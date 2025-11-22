---
layout: step
title: Tài sản
position: 7
---
Sử dụng CSS, JS, hình ảnh và các tài sản khác rất đơn giản với Jekyll. Đặt chúng trong thư mục trang web của bạn và chúng sẽ sao chép sang trang web đã xây dựng.

Các trang web Jekyll thường sử dụng cấu trúc này để giữ cho tài sản được tổ chức:

```
.
├── assets
│   ├── css
│   ├── images
│   └── js
...
```

Vì vậy, từ thư mục assets của bạn, hãy tạo các thư mục có tên css, images và js.
Ngoài ra, ngay dưới thư mục gốc, hãy tạo một thư mục khác có tên `_sass`, mà bạn sẽ cần ngay sau đây.

## Sass

Nội tuyến các kiểu được sử dụng trong `_includes/navigation.html` (thêm hoặc cấu hình trong cùng một tệp) không phải là cách làm tốt nhất.
Thay vào đó, hãy tạo kiểu cho trang hiện tại bằng cách xác định lớp đầu tiên của chúng ta trong một tệp css mới thay thế.

Để làm điều này, hãy tham khảo lớp (mà bạn sẽ cấu hình trong các phần tiếp theo của bước này) từ bên trong tệp `navigation.html` bằng cách xóa mã bạn đã thêm trước đó (để tô màu liên kết hiện tại thành màu đỏ) và chèn mã sau:

{% raw %}

```liquid
<nav>
  {% for item in site.data.navigation %}
    <a href="{{ item.link }}"{% if page.url == item.link %} class="current"{% endif %}>{{ item.name }}</a>
  {% endfor %}
</nav>
```

{% endraw %}

Bạn có thể sử dụng tệp CSS tiêu chuẩn để tạo kiểu, chúng ta sẽ tiến thêm một bước bằng cách sử dụng [Sass](https://sass-lang.com/). Sass là một phần mở rộng tuyệt vời cho CSS được tích hợp ngay vào Jekyll.

Đầu tiên tạo một tệp Sass tại `assets/css/styles.scss` với nội dung sau:

```sass
---
---
@import "main";
```

Front matter trống ở trên cùng cho Jekyll biết nó cần xử lý tệp. `@import "main"` bảo Sass tìm kiếm một tệp có tên `main.scss` trong thư mục sass (`_sass/` theo mặc định) bạn đã tạo tại thư mục gốc của thư mục làm việc của mình trước đó.

Ở giai đoạn này, bạn sẽ chỉ có một tệp css chính. Đối với các dự án lớn hơn, đây là một cách tuyệt vời để giữ cho CSS của bạn được tổ chức.

Tạo lớp hiện tại được đề cập ở trên để tô màu liên kết hiện tại thành màu xanh lá cây. Tạo một tệp Sass tại `_sass/main.scss` với nội dung sau:

```sass
.current {
  color: green;
}
```

Bạn sẽ cần tham chiếu bảng định kiểu trong bố cục của mình.

Mở `_layouts/default.html` và thêm bảng định kiểu vào `<head>`:

{% raw %}

```liquid
<!doctype html>
<html>
  <head>
    <meta charset="utf-8">
    <title>{{ page.title }}</title>
    <link rel="stylesheet" href="/assets/css/styles.css">
  </head>
  <body>
    {% include navigation.html %}
    {{ content }}
  </body>
</html>
```

{% endraw %}

`styles.css` được tham chiếu ở đây được tạo bởi Jekyll từ `styles.scss` bạn đã tạo trước đó trong `assets/css/`.

Tải lên <a href="http://localhost:4000" target="_blank" data-proofer-ignore>http://localhost:4000</a> và kiểm tra xem liên kết hoạt động trong điều hướng có màu xanh lá cây không.

Tiếp theo, chúng ta sẽ xem xét một trong những tính năng phổ biến nhất của Jekyll, viết blog.
