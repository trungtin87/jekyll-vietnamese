---
layout: step
title: Liquid
position: 2
---
Liquid là nơi Jekyll bắt đầu trở nên thú vị hơn. Nó là một ngôn ngữ tạo mẫu có ba thành phần chính:

* [đối tượng](#objects)
* [thẻ](#tags)
* [bộ lọc](#filters)

## Đối tượng

Các đối tượng bảo Liquid xuất các [biến](../../variables/) được xác định trước dưới dạng nội dung trên một trang. Sử dụng dấu ngoặc nhọn kép cho các đối tượng: {% raw %}`{{`{% endraw %} và {% raw %}`}}`{% endraw %}.

Ví dụ, {% raw %}`{{ page.title }}`{% endraw %} hiển thị biến `page.title`.

## Thẻ

Các thẻ xác định logic và luồng điều khiển cho các mẫu. Sử dụng dấu ngoặc nhọn và dấu phần trăm cho các thẻ: {% raw %}`{%`{% endraw %} và {% raw %}`%}`{% endraw %}.

Ví dụ:

{% raw %}

```liquid
{% if page.show_sidebar %}
  <div class="sidebar">
    sidebar content
  </div>
{% endif %}
```

{% endraw %}

Điều này hiển thị thanh bên nếu giá trị của biến trang `show_sidebar` là đúng.

Tìm hiểu thêm về các thẻ có sẵn trong Jekyll [tại đây](/docs/liquid/tags/).

## Bộ lọc

Bộ lọc thay đổi đầu ra của một đối tượng Liquid. Chúng được sử dụng trong một đầu ra và được phân tách bằng dấu `|`.

Ví dụ:

{% raw %}

```liquid
{{ "hi" | capitalize }}
```

{% endraw %}

Điều này hiển thị `Hi` thay vì `hi`.

[Tìm hiểu thêm về các bộ lọc](/docs/liquid/filters/) có sẵn.

## Sử dụng Liquid

Bây giờ, hãy sử dụng Liquid để làm cho văn bản `Hello World!` của bạn từ [Thiết lập](../01-setup/) thành chữ thường:

{% raw %}

```liquid
...
<h1>{{ "Hello World!" | downcase }}</h1>
...
```

{% endraw %}

Để làm cho Jekyll xử lý các thay đổi của bạn, hãy thêm [front matter](../03-front-matter/) vào đầu trang:

```yaml
---
# front matter tells Jekyll to process Liquid
---
```

Tài liệu HTML của bạn sẽ trông như thế này:

{% raw %}

```html
---
---

<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8">
    <title>Home</title>
  </head>
  <body>
    <h1>{{ "Hello World!" | downcase }}</h1>
  </body>
</html>
```

{% endraw %}

Khi bạn tải lại trình duyệt của mình, bạn sẽ thấy `hello world!`.

Phần lớn sức mạnh của Jekyll đến từ việc kết hợp Liquid với các tính năng khác. Thêm frontmatter vào các trang để làm cho Jekyll xử lý Liquid trên các trang đó.

Tiếp theo, bạn sẽ tìm hiểu thêm về frontmatter.
