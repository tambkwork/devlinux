#!/bin/bash
# =============================================================
#  distribute_homework.sh — Phân phối đề bài đến tất cả học viên
# =============================================================
#
# CÁCH DÙNG
#   Chạy từ root của repo devlinux:
#     bash distribute_homework.sh <subject/course>
#
# VÍ DỤ
#     bash distribute_homework.sh embedded-linux/K26.1
#     bash distribute_homework.sh rtos/K26.2
#
# MÔ TẢ
#   Script đọc tất cả file session-XX.md trong thư mục homeworks/
#   rồi copy vào homework.md của từng học viên tương ứng.
#
# CẤU TRÚC YÊU CẦU
#   subject/course/
#   ├── class.json
#   ├── homeworks/
#   │   ├── session-01.md   ← soạn theo homework.template.md
#   │   ├── session-02.md
#   │   └── ...
#   └── (thư mục học viên đã tạo bởi setup_students.sh)
#
# KẾT QUẢ
#   subject/course/nguyen-van-a/session-01/homework.md  ← ghi đè
#   subject/course/tran-thi-b/session-01/homework.md   ← ghi đè
#   ...
#
# LƯU Ý
#   - Ghi đè homework.md đã có — chạy lại an toàn
#   - Chỉ copy những session có file trong homeworks/
#   - Học viên chưa có thư mục session tương ứng → bỏ qua
# =============================================================

set -e

REPO_ROOT="$(cd "$(dirname "$0")" && pwd)"
COURSE_ARG="${1:-}"

if [ -z "$COURSE_ARG" ]; then
    echo "❌ Thiếu tham số. Cách dùng:"
    echo "   bash distribute_homework.sh <subject/course>"
    echo "   Ví dụ: bash distribute_homework.sh embedded-linux/K26.1"
    exit 1
fi

COURSE_DIR="$REPO_ROOT/$COURSE_ARG"
HOMEWORKS_DIR="$COURSE_DIR/homeworks"

if [ ! -d "$COURSE_DIR" ]; then
    echo "❌ Không tìm thấy thư mục: $COURSE_DIR"
    exit 1
fi

if [ ! -d "$HOMEWORKS_DIR" ]; then
    echo "❌ Không tìm thấy thư mục homeworks/: $HOMEWORKS_DIR"
    echo "   Tạo thư mục và đặt file session-XX.md vào đó trước."
    exit 1
fi

CLASS_FILE="$COURSE_DIR/class.json"
if [ ! -f "$CLASS_FILE" ]; then
    echo "❌ Không tìm thấy class.json: $CLASS_FILE"
    exit 1
fi

# Đọc danh sách học viên
STUDENTS=$(python3 -c "
import json
data = json.load(open('$CLASS_FILE'))
for student in data.get('students', {}).keys():
    print(student)
")

echo "======================================"
echo "  DevLinux — Distribute Homework"
echo "  Khoá : $COURSE_ARG"
echo "======================================"
echo ""

COPIED=0
SKIPPED=0

# Duyệt từng file session-XX.md trong homeworks/
while IFS= read -r hw_file; do
    filename="$(basename "$hw_file")"           # session-01.md
    session_name="${filename%.md}"              # session-01

    echo "📄 $filename"

    # Copy vào từng học viên
    for student in $STUDENTS; do
        session_dir="$COURSE_DIR/$student/$session_name"

        if [ ! -d "$session_dir" ]; then
            echo "   ⏭️  $student/$session_name/ — thư mục chưa tồn tại, bỏ qua"
            SKIPPED=$((SKIPPED + 1))
            continue
        fi

        cp "$hw_file" "$session_dir/homework.md"
        echo "   ✅ $student/$session_name/homework.md"
        COPIED=$((COPIED + 1))
    done

    echo ""

done < <(find "$HOMEWORKS_DIR" -name "session-*.md" | sort)

echo "======================================"
echo "  ✅ Đã copy : $COPIED file"
echo "  ⏭️  Bỏ qua  : $SKIPPED thư mục chưa tồn tại"
echo "======================================"
echo ""
echo "Chạy lệnh sau để push lên GitHub:"
echo "  git add ."
echo "  git commit -m \"homework: cập nhật đề bài $COURSE_ARG\""
echo "  git push"
