# DevLinux — Nộp Bài Tập

> Fork repo này để bắt đầu nộp bài.

---

## Cây thư mục

```
devlinux/
├── embedded-linux/
│   └── K26.1/
│       └── ten-hoc-vien/        ← giáo viên tạo sẵn
│           ├── session-01/
│           │   ├── hw1/
│           │   ├── hw2/
│           │   └── hw3/
│           └── session-02/
├── rtos/
├── embedded-mcu/
└── c-advance/
```

---

## Quy trình nộp bài

### Bước 1 — Fork repo (1 lần duy nhất)
Click **Fork** góc trên phải → fork về tài khoản cá nhân.

### Bước 2 — Clone về máy
```bash
git clone https://github.com/TÊN_BẠN/devlinux.git
cd devlinux
```

### Bước 3 — Tạo branch cho mỗi buổi

**Format bắt buộc:** `tên-môn/KXX.X/tên-của-bạn/session-XX`

```bash
# Ví dụ: học viên "nguyen-van-a", môn Embedded Linux, khoá K26.1, buổi 1
git checkout -b embedded-linux/K26.1/nguyen-van-a/session-01
```

| Môn | Tên dùng trong branch |
|---|---|
| Embedded Linux | `embedded-linux` |
| RTOS | `rtos` |
| Embedded MCU | `embedded-mcu` |
| C Advance | `c-advance` |

### Bước 4 — Làm bài vào thư mục của mình

```
embedded-linux/K26.1/nguyen-van-a/session-01/
├── hw1/
│   ├── main.c
│   └── Makefile
├── hw2/
│   ├── main.c
│   └── Makefile
└── hw3/
    ├── main.c
    └── Makefile
```

### Bước 5 — Commit và push

```bash
git add .
git commit -m "embedded-linux K26.1 session-01: hoàn thành hw1, hw2, hw3"
git push origin embedded-linux/K26.1/nguyen-van-a/session-01
```

### Bước 6 — Mở Pull Request

1. Vào GitHub → repo fork của bạn
2. Click **"Compare & pull request"**
3. Đảm bảo base là repo của giáo viên → branch `main`
4. Title: `[Embedded Linux K26.1 Session 01] Nguyễn Văn A`
5. Click **Create pull request**

⏱️ Sau ~1-2 phút, Claude sẽ tự động comment điểm và nhận xét.

---

## Khi cần sửa bài

```bash
# Sửa code trên cùng branch
git add .
git commit -m "fix: sửa lỗi fd leak theo review"
git push origin embedded-linux/K26.1/nguyen-van-a/session-01
# PR tự cập nhật → Claude review lại tự động
```
