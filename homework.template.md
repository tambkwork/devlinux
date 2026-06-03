# Đề Bài — session-XX

> **Hướng dẫn dùng template này:**
> - Xoá các dòng `>` hướng dẫn trước khi push
> - Các phần đánh dấu `(tuỳ chọn)` có thể bỏ nếu không cần
> - Tag `[build]` / `[review-only]` trong tiêu đề Exercise là **bắt buộc**

---

## Exercise_1 [build]

> Tag `[build]`: hệ thống sẽ build và chạy thử — bắt buộc có Makefile.
> Tag `[review-only]`: chỉ review code tĩnh — không cần Makefile (dùng cho Yocto, Device Tree, MCU, v.v.).

### Đề bài

<!-- Mô tả yêu cầu bài tập. Càng cụ thể càng tốt. -->

Viết chương trình C thực hiện ...

### Định hướng thiết kế (tuỳ chọn)

<!-- Gợi ý struct, enum, typedef nếu muốn định hướng học viên. Bỏ phần này nếu muốn học viên tự thiết kế. -->

```c
typedef struct {
    int fd;
    char name[64];
} my_struct_t;
```

### Hướng tiếp cận (tuỳ chọn)

<!-- Mô tả luồng xử lý chính để học viên không bị lạc hướng. Bỏ nếu muốn học viên tự thiết kế. -->

```
1. Khởi tạo ...
2. Vòng lặp chính: đọc dữ liệu → xử lý → ghi kết quả
3. Cleanup tài nguyên trước khi thoát
```

### Yêu cầu đầu ra (tuỳ chọn)

<!-- Mô tả output mong đợi khi chạy chương trình. Dùng khi cần kiểm tra output tự động. -->

Khi chạy với input `...`, output phải là:

```
expected output line 1
expected output line 2
```

Exit code: `0` khi thành công, khác `0` khi lỗi.

### Yêu cầu file nộp

```
Exercise_1/
├── main.c        (bắt buộc)
├── Makefile      (bắt buộc — target: all, clean)
└── *.h           (nếu có)
```

---

## Exercise_2 [review-only]

### Đề bài

Viết Device Tree overlay cho ...

### Yêu cầu file nộp

```
Exercise_2/
└── my-overlay.dts    (bắt buộc)
```

---

## Exercise_3 [build]

### Đề bài

...

### Yêu cầu file nộp

```
Exercise_3/
├── main.c
└── Makefile
```
