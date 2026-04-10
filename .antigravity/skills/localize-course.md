---
description: Hướng dẫn tiêu chuẩn để Việt hóa và Nhật hóa một khóa học HTML
---

# Kỹ năng: Điển Phạm Hóa Đa Ngôn Ngữ Khóa Học (Localize Course)

Kỹ năng này cung cấp quy trình và kiến trúc chuẩn để biến một khóa học tiếng Anh dạng module rải rác ban đầu thành một khóa học hỗ trợ Đa ngôn ngữ (English, Vietnamese, Japanese) với tính năng chuyển đổi ngôn ngữ (Language Switcher) trơn tru trên giao diện người dùng.

## 1. Quy tắc thiết lập cấu trúc thư mục
- **Tạo thư mục con cho ngôn ngữ**: Bên trong thư mục `modules/`, tạo các thư mục lưu trữ ứng với mã ngôn ngữ: `en/`, `vi/`, `ja/`.
- **Di chuyển bản gốc**: Gắn toàn bộ các tệp nội dung `.html` gốc vào thư mục `modules/en/`.

## 2. Quy trình Dịch thuật
- Quét danh sách tệp trong `modules/en/`, sao chép nguyên vẹn cấu trúc file sang `modules/vi/` và `modules/ja/`. 
- Tiến hành dịch 100% nội dung hiển thị (tiêu đề, thẻ text, mô tả) sang Tiếng Việt và Tiếng Nhật.
- **Bắt buộc**: KHÔNG làm phá vỡ các thẻ HTML, class CSS hay data attributes (đặc biệt chú ý đến thuộc tính giải thích `data-definition=""` hay luồng logic trắc nghiệm Javascript tự tạo).

## 3. Cập nhật UI (Bộ chuyển đổi ngôn ngữ)
Trong phần khung trang tổng (ví dụ `_base.html` hoặc thư mục gốc), thêm trực tiếp khối HTML Language Switcher:
```html
<div class="lang-switcher">
    <a href="index.html" class="active">EN</a>
    <a href="index_vi.html">VI</a>
    <a href="index_ja.html">JA</a>
</div>
```
Yêu cầu thiết kế CSS cho `.lang-switcher` sử dụng phong cách Glassmorphism (làm mờ phông nền với backdrop-filter) để cho đồng nhất.

## 4. Tái cấu trúc file tự động biên dịch `build.sh`
Kịch bản biên dịch (Build script) phải đóng gói nội dung tự động cho từng ngôn ngữ riêng rẽ:
- Đọc file sườn `_base.html` chung. 
- Thay thế đoạn đánh dấu `<!-- MODULES_CONTENT -->` bằng tổng hợp nội dung file html của thư mục ngôn ngữ tương ứng (`en`, `vi`, `ja`).
- Ghi đè và xuất chuỗi HTML hoàn chỉnh ra các tệp `index.html` (cho EN), `index_vi.html` (cho VI), `index_ja.html` (cho JA).

## 5. Nguyên tắc Dịch ngữ (Tone of voice)
- **Tiếng Việt**: Sử dụng ngữ điệu năng động, ngôn từ công nghệ nhưng gần gũi. Thay thế các hình ảnh ẩn dụ (metaphor) tiếng Anh cho phù hợp với dân IT. (Ví dụ: Subagent -> Đặc vụ phụ, Command -> Lệnh).
- **Tiếng Nhật**: Văn phong chuyên nghiệp, rành mạch. Đảm bảo dịch chuẩn xác. (Ví dụ: Subagent -> サブエージェント).

**Cách sử dụng**: Khi được User yêu cầu thực hiện "đa ngôn ngữ hóa khóa học", Claude sẽ nạp Kỹ năng (Skill) này và tiến hành tuần tự 5 bước trên.
