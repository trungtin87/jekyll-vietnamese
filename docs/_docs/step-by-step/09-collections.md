---
layout: step
title: Bộ sưu tập
position: 9
---
Hãy xem xét việc bổ sung các tác giả để mỗi tác giả có trang riêng của họ với một đoạn giới thiệu và các bài đăng họ đã xuất bản.

Để làm điều này, bạn sẽ sử dụng các bộ sưu tập. Các bộ sưu tập tương tự như các bài đăng ngoại trừ việc nội dung không cần phải được nhóm theo ngày.

## Cấu hình

Để thiết lập một bộ sưu tập, bạn cần nói với Jekyll về nó. Cấu hình Jekyll xảy ra trong một tệp có tên `_config.yml` (theo mặc định).

Tạo `_config.yml` trong thư mục gốc với nội dung sau:

```yaml
collections:
  authors:
```

Để (tải lại) cấu hình, hãy khởi động lại máy chủ jekyll. Nhấn `Ctrl`+`C` trong thiết bị đầu cuối của bạn để dừng máy chủ, và sau đó `jekyll serve` để khởi động lại nó.

## Thêm tác giả

Tài liệu (các mục trong một bộ sưu tập) sống trong một thư mục ở thư mục gốc của trang web có tên `_*collection_name*`. Trong trường hợp này, `_authors`.

Tạo một tài liệu cho mỗi tác giả:

`_authors/jill.md`:

```markdown
---
short_name: jill
name: Jill Smith
position: Chief Editor
---
Jill is an avid fruit grower based in the south of France.
```

`_authors/ted.md`:

```markdown
---
short_name: ted
name: Ted Doe
position: Writer
---
Ted has been eating fruit since he was baby.
```

## Trang nhân viên

Hãy thêm một trang liệt kê tất cả các tác giả trên trang web. Jekyll làm cho bộ sưu tập có sẵn tại `site.authors`.

Tạo `staff.html` trong thư mục gốc và lặp lại `site.authors` để xuất tất cả nhân viên:

{% raw %}

```liquid
---
layout: default
title: Nhân viên
---
<h1>Nhân viên</h1>

<ul>
  {% for author in site.authors %}
    <li>
      <h2>{{ author.name }}</h2>
      <h3>{{ author.position }}</h3>
      <p>{{ author.content | markdownify }}</p>
    </li>
  {% endfor %}
</ul>
```

{% endraw %}

Vì nội dung là markdown, bạn cần chạy nó qua bộ lọc `markdownify`. Điều này xảy ra tự động khi xuất bằng cách sử dụng {% raw %}`{{ content }}`{% endraw %} trong một bố cục.

Bạn cũng cần một cách để điều hướng đến trang này thông qua điều hướng chính. Mở `_data/navigation.yml` và thêm một mục nhập cho trang nhân viên:

```yaml
- name: Trang chủ
  link: /
- name: Giới thiệu
  link: /about.html
- name: Blog
  link: /blog.html
- name: Nhân viên
  link: /staff.html
```

## Xuất một trang

Theo mặc định, các bộ sưu tập không xuất một trang cho các tài liệu. Trong trường hợp này, chúng tôi muốn mỗi tác giả có trang riêng của họ vì vậy hãy điều chỉnh cấu hình bộ sưu tập.

Mở `_config.yml` và thêm `output: true` vào cấu hình bộ sưu tập tác giả:

```yaml
collections:
  authors:
    output: true
```

Khởi động lại máy chủ jekyll một lần nữa để các thay đổi cấu hình có hiệu lực.

Bạn có thể liên kết đến trang đầu ra bằng cách sử dụng `author.url`.

Thêm liên kết vào trang `staff.html`:

{% raw %}

```liquid
---
layout: default
title: Nhân viên
---
<h1>Nhân viên</h1>

<ul>
  {% for author in site.authors %}
    <li>
      <h2><a href="{{ author.url }}">{{ author.name }}</a></h2>
      <h3>{{ author.position }}</h3>
      <p>{{ author.content | markdownify }}</p>
    </li>
  {% endfor %}
</ul>
```

{% endraw %}

Giống như các bài đăng, bạn sẽ cần tạo một bố cục cho các tác giả.

Tạo `_layouts/author.html` với nội dung sau:

{% raw %}

```liquid
---
layout: default
---
<h1>{{ page.name }}</h1>
<h2>{{ page.position }}</h2>

{{ content }}
```

{% endraw %}

## Mặc định front matter

Bây giờ bạn cần cấu hình các tài liệu tác giả để sử dụng bố cục `author`. Bạn có thể làm điều này trong front matter như chúng ta đã làm trước đây nhưng điều đó đang trở nên lặp đi lặp lại.

Những gì bạn thực sự muốn là tất cả các bài đăng tự động có bố cục bài đăng, tác giả có tác giả và mọi thứ khác sử dụng mặc định.

Bạn có thể đạt được điều này bằng cách sử dụng [mặc định front matter](/docs/configuration/front-matter-defaults/) trong `_config.yml`. Bạn đặt phạm vi của những gì mặc định áp dụng cho, sau đó là front matter mặc định bạn muốn.

Thêm mặc định cho các bố cục vào `_config.yml` của bạn,

```yaml
collections:
  authors:
    output: true

defaults:
  - scope:
      path: ""
      type: "authors"
    values:
      layout: "author"
  - scope:
      path: ""
      type: "posts"
    values:
      layout: "post"
  - scope:
      path: ""
    values:
      layout: "default"
```

Bây giờ bạn có thể xóa bố cục khỏi front matter của tất cả các trang và bài đăng. Lưu ý rằng bất cứ khi nào bạn cập nhật `_config.yml`, bạn sẽ cần khởi động lại Jekyll để các thay đổi có hiệu lực.

## Liệt kê các bài đăng của tác giả

Hãy liệt kê các bài đăng mà một tác giả đã xuất bản trên trang của họ. Để làm điều này, bạn cần khớp `short_name` của tác giả với `author` của bài đăng. Bạn sử dụng điều này để lọc các bài đăng theo tác giả.

Lặp lại danh sách đã lọc này trong `_layouts/author.html` để xuất các bài đăng của tác giả:

{% raw %}

```liquid
---
layout: default
---
<h1>{{ page.name }}</h1>
<h2>{{ page.position }}</h2>

{{ content }}

<h2>Bài đăng</h2>
<ul>
  {% assign filtered_posts = site.posts | where: 'author', page.short_name %}
  {% for post in filtered_posts %}
    <li><a href="{{ post.url }}">{{ post.title }}</a></li>
  {% endfor %}
</ul>
```

{% endraw %}

## Liên kết đến trang tác giả

Các bài đăng có tham chiếu đến tác giả vì vậy hãy liên kết nó với trang của tác giả. Bạn có thể làm điều này bằng cách sử dụng một kỹ thuật lọc tương tự trong `_layouts/post.html`:

{% raw %}

```liquid
---
layout: default
---
<h1>{{ page.title }}</h1>

<p>
  {{ page.date | date_to_string }}
  {% assign author = site.authors | where: 'short_name', page.author | first %}
  {% if author %}
    - <a href="{{ author.url }}">{{ author.name }}</a>
  {% endif %}
</p>

{{ content }}
```

{% endraw %}

Mở <a href="http://localhost:4000" target="_blank" data-proofer-ignore>http://localhost:4000</a> và xem trang nhân viên và các liên kết tác giả trên các bài đăng để kiểm tra xem mọi thứ có được liên kết với nhau chính xác không.

Trong bước tiếp theo và cuối cùng của hướng dẫn này, chúng tôi sẽ thêm sự hoàn thiện cho trang web và chuẩn bị sẵn sàng cho việc triển khai sản xuất.
