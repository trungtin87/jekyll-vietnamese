---
title: Bố cục (Layouts)
description: placeholder
permalink: /docs/layouts/
---
Bố cục là các mẫu bao bọc nội dung của bạn. Chúng cho phép bạn có
mã nguồn cho mẫu của mình ở một nơi để bạn không phải lặp lại những thứ
như điều hướng và chân trang trên mỗi trang.

Các bố cục nằm trong thư mục `_layouts`. Quy ước là có một mẫu cơ sở
được gọi là `default.html` và có các bố cục khác [kế thừa](#inheritance)
từ nó khi cần thiết.

<div class="note">
  <h5>Thư mục Bố cục</h5>
  <p>
    Jekyll tìm thư mục <code>_layouts</code> tại thư mục gốc của
    <code>source</code> trang web của bạn hoặc tại thư mục gốc của giao diện (theme) của bạn.
  </p>
  <p>
    Mặc dù bạn có thể cấu hình tên thư mục chứa các bố cục của mình bằng cách
    đặt khóa <code>layouts_dir</code> trong tệp cấu hình của bạn, nhưng thư mục
    đó vẫn nên được đặt tại thư mục gốc của thư mục <code>source</code> trang web của bạn.
  </p>
</div>

## Sử dụng

Bước đầu tiên là đặt mã nguồn mẫu vào `default.html`. `content`
là một biến đặc biệt, giá trị là nội dung được hiển thị của bài viết hoặc trang
đang được bao bọc.

{% raw %}

```liquid
<!doctype html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <title>{{ page.title }}</title>
    <link rel="stylesheet" href="/css/style.css">
  </head>
  <body>
    <nav>
      <a href="/">Trang chủ</a>
      <a href="/blog/">Blog</a>
    </nav>
    <h1>{{ page.title }}</h1>
    <section>
      {{ content }}
    </section>
    <footer>
      &copy; to me
    </footer>
  </body>
</html>
```

{% endraw %}

Bạn có toàn quyền truy cập vào front matter của nguồn gốc. Trong
ví dụ trên, `page.title` đến từ front matter của trang.

Tiếp theo, bạn cần chỉ định bố cục bạn đang sử dụng trong front matter của trang.
Bạn cũng có thể sử dụng
[mặc định front matter](/docs/configuration/front-matter-defaults/) để giúp bạn
không phải thiết lập điều này trên mỗi trang.

```markdown
---
title: Trang đầu tiên của tôi
layout: default
---

Đây là nội dung trang của tôi
```

Đầu ra được hiển thị của trang này là:

```html
<!doctype html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <title>Trang đầu tiên của tôi</title>
    <link rel="stylesheet" href="/css/style.css">
  </head>
  <body>
    <nav>
      <a href="/">Trang chủ</a>
      <a href="/blog/">Blog</a>
    </nav>
    <h1>Trang đầu tiên của tôi</h1>
    <section>
      Đây là nội dung trang của tôi
    </section>
    <footer>
      &copy; to me
    </footer>
  </body>
</html>
```

## Kế thừa

Kế thừa bố cục rất hữu ích khi bạn muốn thêm một cái gì đó vào một bố cục hiện có
cho một phần tài liệu trên trang web của bạn. Một ví dụ phổ biến về điều này là
các bài viết blog, bạn có thể muốn một bài viết hiển thị ngày và tác giả nhưng mặt khác
giống hệt với bố cục cơ sở của bạn.

Để đạt được điều này, bạn cần tạo một bố cục khác chỉ định bố cục gốc của bạn
trong front matter. Ví dụ bố cục này sẽ nằm tại
`_layouts/post.html`:

{% raw %}

```liquid
---
layout: default
---
<p>{{ page.date }} - Được viết bởi {{ page.author }}</p>

{{ content }}
```

{% endraw %}

Bây giờ các bài viết có thể sử dụng bố cục này trong khi các trang còn lại sử dụng mặc định.

## Biến

Bạn có thể đặt front matter trong các bố cục, sự khác biệt duy nhất là khi bạn
đang sử dụng trong Liquid, bạn cần sử dụng biến `layout` thay vì `page`. Ví dụ:

{% raw %}

```liquid
---
city: San Francisco
---
<p>{{ layout.city }}</p>

{{ content }}
```

{% endraw %}
