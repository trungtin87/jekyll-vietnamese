---
layout: step
title: Bao gồm
position: 5
---
Trang web đang dần hình thành; tuy nhiên, không có cách nào để điều hướng giữa các trang. Hãy sửa điều đó.

Điều hướng nên có trên mọi trang vì vậy thêm nó vào bố cục của bạn là nơi chính xác để làm điều này. Thay vì thêm trực tiếp vào bố cục, hãy sử dụng cơ hội này để tìm hiểu về bao gồm (includes).

## Thẻ include

Thẻ `include` cho phép bạn bao gồm nội dung từ một tệp khác được lưu trữ trong thư mục `_includes`. Bao gồm rất hữu ích để có một nguồn duy nhất cho mã nguồn lặp lại xung quanh trang web hoặc để cải thiện khả năng đọc.

Mã nguồn điều hướng có thể trở nên phức tạp, vì vậy đôi khi thật tốt khi di chuyển nó vào một bao gồm.

## Sử dụng include

Tạo một tệp cho điều hướng tại `_includes/navigation.html` với nội dung sau:

```
<nav>
  <a href="/">Trang chủ</a>
  <a href="/about.html">Giới thiệu</a>
</nav>
```

Hãy thử sử dụng thẻ include để thêm điều hướng vào `_layouts/default.html`:

{% raw %}

```liquid
<!doctype html>
<html>
  <head>
    <meta charset="utf-8">
    <title>{{ page.title }}</title>
  </head>
  <body>
    {% include navigation.html %}
    {{ content }}
  </body>
</html>
```

{% endraw %}

Mở <a href="http://localhost:4000" target="_blank" data-proofer-ignore>http://localhost:4000</a> trong trình duyệt của bạn và thử chuyển đổi giữa các trang.

## Làm nổi bật trang hiện tại

Hãy tiến thêm một bước và làm nổi bật trang hiện tại trong điều hướng.

`_includes/navigation.html` cần biết URL của trang mà nó được chèn vào để nó có thể thêm kiểu dáng. Jekyll có các [biến](/docs/variables/) hữu ích có sẵn, một trong số đó là `page.url`.

Sử dụng `page.url`, bạn có thể kiểm tra xem mỗi liên kết có phải là trang hiện tại hay không và tô màu đỏ nếu đúng:

{% raw %}

```liquid
<nav>
  <a href="/" {% if page.url == "/" %}style="color: red;"{% endif %}>
    Trang chủ
  </a>
  <a href="/about.html" {% if page.url == "/about.html" %}style="color: red;"{% endif %}>
    Giới thiệu
  </a>
</nav>
```

{% endraw %}

Hãy xem <a href="http://localhost:4000" target="_blank" data-proofer-ignore>http://localhost:4000</a> và xem liên kết màu đỏ của bạn cho trang hiện tại.

Vẫn còn rất nhiều sự lặp lại ở đây nếu bạn muốn thêm một mục mới vào điều hướng hoặc thay đổi màu tô sáng. Trong bước tiếp theo, chúng ta sẽ giải quyết vấn đề này.
