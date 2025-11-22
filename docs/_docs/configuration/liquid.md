---
title: Tùy chọn Liquid (Liquid Options)
permalink: "/docs/configuration/liquid/"
---
Phản ứng của Liquid đối với các lỗi có thể được cấu hình bằng cách đặt `error_mode`. Các
tùy chọn là

- `lax` --- Bỏ qua tất cả các lỗi.
- `warn` --- Xuất cảnh báo trên bảng điều khiển cho mỗi lỗi. (mặc định)
- `strict` --- Xuất thông báo lỗi và dừng quá trình xây dựng.

Trong _config.yml, cấu hình mặc định như sau:

```yaml
liquid:
  error_mode: warn
```

Ví dụ trên mô tả giá trị "warn", giá trị này đã được đặt theo mặc định- `error_mode: warn`. Điều này dẫn đến bất kỳ vấn đề nào được gọi ra trong quá trình xây dựng tuy nhiên sẽ tiếp tục xây dựng nếu có thể.

Bạn cũng có thể cấu hình trình kết xuất của Liquid để bắt các biến không được gán và
các bộ lọc không tồn tại bằng cách đặt `strict_variables` và / hoặc `strict_filters`
thành `true` tương ứng. {% include docs_version_badge.html version="3.8.0" %}

Lưu ý rằng trong khi `error_mode` cấu hình trình phân tích cú pháp của Liquid, các tùy chọn `strict_variables`
và `strict_filters` cấu hình trình kết xuất của Liquid và do đó là
trực giao (độc lập).

Một ví dụ về việc đặt các biến này trong _config.yml như sau:

```yaml
liquid:
  error_mode: strict
  strict_variables: true
  strict_filters: true
```

Cấu hình như mô tả ở trên sẽ ngăn quá trình build/serve của bạn xảy ra và gọi ra lỗi vi phạm và dừng lại. Điều này hữu ích khi muốn bắt các vấn đề liên quan đến liquid bằng cách dừng quá trình build hoặc serve và cho phép bạn giải quyết bất kỳ vấn đề nào.
