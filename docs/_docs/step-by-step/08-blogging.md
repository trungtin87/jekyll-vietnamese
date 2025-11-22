---
layout: step
title: Viết blog
position: 8
---
Bạn có thể tự hỏi làm thế nào bạn có thể có một blog mà không có cơ sở dữ liệu. Theo phong cách Jekyll thực sự, việc viết blog chỉ được cung cấp bởi các tệp văn bản.

## Bài đăng

Các bài đăng trên blog sống trong một thư mục có tên `_posts`. Tên tệp cho các bài đăng có định dạng đặc biệt: ngày xuất bản, sau đó là tiêu đề, theo sau là phần mở rộng.

Tạo bài đăng đầu tiên của bạn tại `_posts/2018-08-20-bananas.md` với nội dung sau:

```markdown
---
layout: post
author: jill
---

A banana is an edible fruit – botanically a berry – produced by several
kinds of large herbaceous flowering plants in the genus Musa.

In some countries, bananas used for cooking may be called "plantains",
distinguishing them from dessert bananas. The fruit is variable in size,
color, and firmness, but is usually elongated and curved, with soft
flesh rich in starch covered with a rind, which may be green, yellow,
red, purple, or brown when ripe.
```

Điều này giống như `about.md` bạn đã tạo trước đó ngoại trừ việc nó có tác giả và bố cục khác. `author` là một biến tùy chỉnh, nó không bắt buộc và có thể được đặt tên giống như `creator`.

## Bố cục

Bố cục `post` không tồn tại vì vậy bạn sẽ cần tạo nó tại `_layouts/post.html` với nội dung sau:

{% raw %}

```liquid
---
layout: default
---
<h1>{{ page.title }}</h1>
<p>{{ page.date | date_to_string }} - {{ page.author }}</p>

{{ content }}
```

{% endraw %}

Đây là một ví dụ về kế thừa bố cục. Bố cục bài đăng xuất tiêu đề, ngày tháng, tác giả và nội dung chính được bao bọc bởi bố cục mặc định.

Cũng lưu ý bộ lọc `date_to_string`, bộ lọc này định dạng ngày tháng thành định dạng đẹp hơn.

## Liệt kê các bài đăng

Hiện tại không có cách nào để điều hướng đến bài đăng trên blog. Thông thường, một blog có một trang liệt kê tất cả các bài đăng, hãy làm điều đó tiếp theo.

Jekyll làm cho các bài đăng có sẵn tại `site.posts`.

Tạo `blog.html` trong thư mục gốc của bạn (`/blog.html`) với nội dung sau:

{% raw %}

```liquid
---
layout: default
title: Blog
---
<h1>Bài đăng mới nhất</h1>

<ul>
  {% for post in site.posts %}
    <li>
      <h2><a href="{{ post.url }}">{{ post.title }}</a></h2>
      {{ post.excerpt }}
    </li>
  {% endfor %}
</ul>
```

{% endraw %}

Có một vài điều cần lưu ý với mã này:

* `post.url` được Jekyll tự động đặt thành đường dẫn đầu ra của bài đăng
* `post.title` được lấy từ tên tệp bài đăng và có thể bị ghi đè bằng cách đặt `title` trong front matter
* `post.excerpt` là đoạn nội dung đầu tiên theo mặc định

Bạn cũng cần một cách để điều hướng đến trang này thông qua điều hướng chính. Mở `_data/navigation.yml` và thêm một mục nhập cho trang blog:

```yaml
- name: Trang chủ
  link: /
- name: Giới thiệu
  link: /about.html
- name: Blog
  link: /blog.html
```

## Thêm bài đăng

Một blog không thú vị lắm với một bài đăng duy nhất. Thêm một vài bài nữa:

`_posts/2018-08-21-apples.md`:

```markdown
---
layout: post
author: jill
---
An apple is a sweet, edible fruit produced by an apple tree.

Apple trees are cultivated worldwide, and are the most widely grown
species in the genus Malus. The tree originated in Central Asia, where
its wild ancestor, Malus sieversii, is still found today. Apples have
been grown for thousands of years in Asia and Europe, and were brought
to North America by European colonists.
```

`_posts/2018-08-22-kiwifruit.md`:

```markdown
---
layout: post
author: ted
---
Kiwifruit (often abbreviated as kiwi), or Chinese gooseberry is the
edible berry of several species of woody vines in the genus Actinidia.

The most common cultivar group of kiwifruit is oval, about the size of
a large hen's egg (5–8 cm (2.0–3.1 in) in length and 4.5–5.5 cm
(1.8–2.2 in) in diameter). It has a fibrous, dull greenish-brown skin
and bright green or golden flesh with rows of tiny, black, edible
seeds. The fruit has a soft texture, with a sweet and unique flavor.
```

Mở <a href="http://localhost:4000" target="_blank" data-proofer-ignore>http://localhost:4000</a> và xem qua các bài đăng trên blog của bạn.

Tiếp theo, chúng ta sẽ tập trung vào việc tạo một trang cho mỗi tác giả bài đăng.
