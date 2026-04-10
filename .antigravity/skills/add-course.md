---
description: Hướng dẫn tiêu chuẩn để thêm một khóa học mới lên nền tảng ở trang chủ dưới dạng Đa ngôn ngữ.
---

# Kỹ năng: Thêm Khóa học vào Nền tảng (Add Course to Platform)

Kỹ năng này tự động hóa việc đưa khóa học mới lên trang hiển thị chung của toàn khóa học (khu vực Landing Page) một cách đồng bộ và chính xác nhất cho hệ thống Đa ngôn ngữ (English, Vietnamese, Japanese).

## 1. Cơ sở hạ tầng của giao diện (UI)
Tìm đến khối thẻ `<main>` nằm bên trong 3 file gốc của nền tảng tại thư mục root (thư mục ngoài cùng):
- `index.html` (Mặc định: Tiếng Anh)
- `index_vi.html` (Bản cho Tiếng Việt)
- `index_ja.html` (Bản cho Tiếng Nhật)

## 2. Cấu trúc của Khối Thẻ Khóa học (Course Card)
Bất cứ khi nào tạo thẻ hiển thị một khóa học mới, bạn phải tuân thủ nghiêm ngặt đoạn mã HTML mẫu dưới đây, nằm đặt ngay phía trên cụm ghi chú `<!-- Copy this block to add more courses in the future -->`:

```html
<a href="<đường_dẫn_vào_khóa_học>/<tên_file_index_tùy_ngôn_ngữ>" class="course-card">
    <span class="course-tag"><Từ_khóa_thể_loại></span>
    <h2 class="course-title"><Tên_khóa_học></h2>
    <p class="course-description"><Mô_tả_ngắn_gọn_nhưng_hấp_dẫn></p>
    <div class="course-footer">
        <span><Chữ_kêu_gọi_bắt_đầu_học></span>
        <svg class="arrow-icon" xmlns="http://www.w3.org/2000/svg" width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2.5" stroke-linecap="round" stroke-linejoin="round"><line x1="5" y1="12" x2="19" y2="12"></line><polyline points="12 5 19 12 12 19"></polyline></svg>
    </div>
</a>
```

## 3. Quy trình Thêm Giao diện Đa Ngôn Ngữ
Khi có lệnh thêm một khóa học mới, bạn phải chèn đoạn code thẻ khóa học (Course Card) này vào chung vào cả 3 file tương ứng, và lưu ý những nguyên tắc thiết lập Dịch ngữ sau:

- **Với `index.html`**:
  - `href`: trỏ vào bản gốc `[thư_mục_khóa_học]/index.html`
  - Text: Tiếng Anh 100%
  - Nút kêu gọi: "Start Learning"

- **Với `index_vi.html`**:
  - `href`: BẮT BUỘC rẽ link vào `[thư_mục_khóa_học]/index_vi.html`
  - Text: Dịch uyển chuyển sang Tiếng Việt.
  - Nút kêu gọi: "Bắt Đầu Học"

- **Với `index_ja.html`**:
  - `href`: BẮT BUỘC rẽ link vào `[thư_mục_khóa_học]/index_ja.html`
  - Text: Dịch tự nhiên sang Tiếng Nhật.
  - Nút kêu gọi: "学習を始める"

**Cách sử dụng**: Nếu User có yêu cầu dạng "Thêm khóa học XYZ lên trang chủ `index.html`", Claude sẽ nạp Kỹ năng (Skill) này và tự động thêm tấm thẻ chứa khóa học đó tuần tự vào cả 3 file theo chuẩn Đa ngôn ngữ và định tuyến URL đã nêu ở bước 3. Cấm được thiên vị chỉ cập nhật 1 file `index.html`.
