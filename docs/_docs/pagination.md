---
title: Phân trang (Pagination)
permalink: /docs/pagination/
---

Với nhiều trang web &mdash; đặc biệt là blog &mdash; rất phổ biến để
chia danh sách bài viết chính thành các danh sách nhỏ hơn và hiển thị chúng trên
nhiều trang. Jekyll cung cấp một plugin phân trang, vì vậy bạn có thể tự động
tạo các tệp và thư mục thích hợp bạn cần cho danh sách được phân trang.

Đối với Jekyll 3 hoặc cao hơn, hãy bao gồm plugin `jekyll-paginate` trong
Gemfile của bạn và trong `_config.yml` của bạn dưới `plugins`. Đối với Jekyll 2, điều này là
tiêu chuẩn.

<div class="note info">
  <h5>Phân trang chỉ hoạt động trong các tệp HTML</h5>
  <p>
    Phân trang không hoạt động từ bên trong các tệp Markdown của
    trang web Jekyll của bạn. Phân trang hoạt động khi được gọi từ bên trong tệp HTML,
    được đặt tên là <code>index.html</code>, tệp này tùy chọn có thể nằm trong và
    tạo phân trang từ bên trong một thư mục con, thông qua giá trị cấu hình
    <code>paginate_path</code>.
  </p>
</div>

## Kích hoạt phân trang

Để kích hoạt phân trang cho các bài viết trên blog của bạn, hãy thêm một dòng vào tệp `_config.yml`
chỉ định bao nhiêu mục sẽ được hiển thị trên mỗi trang:

```yaml
paginate: 5
```

Con số này phải là số lượng Bài viết tối đa bạn muốn hiển thị
trên mỗi trang trong trang web được tạo.

Bạn cũng có thể chỉ định đích của các trang phân trang:

```yaml
paginate_path: "/blog/page:num/"
```

Điều này sẽ đọc trong `blog/index.html`, gửi cho nó mỗi trang phân trang trong Liquid dưới dạng
`paginator` và ghi đầu ra vào `blog/page:num/`, trong đó `:num` là
số trang phân trang, bắt đầu bằng `2`. <br/>
Nếu một trang web có 12 bài viết và chỉ định `paginate: 5`, Jekyll sẽ ghi `blog/index.html`
với 5 bài viết đầu tiên, `blog/page2/index.html` với 5 bài viết tiếp theo và
`blog/page3/index.html` với 2 bài viết cuối cùng vào thư mục đích.

<div class="note warning">
  <h5>Đừng đặt liên kết tĩnh (permalink)</h5>
  <p>
    Đặt liên kết tĩnh trong front matter của trang blog của bạn sẽ khiến
    phân trang bị hỏng. Chỉ cần bỏ qua liên kết tĩnh.
  </p>
</div>

<div class="note info">
  <h5>Phân trang cho danh mục, thẻ và bộ sưu tập</h5>
  <p>
    Plugin <a href="https://github.com/sverrirs/jekyll-paginate-v2">
    jekyll-paginate-v2</a> gần đây hơn hỗ trợ nhiều tính năng hơn. Xem
    <a href="https://github.com/sverrirs/jekyll-paginate-v2/tree/master/examples">
    các ví dụ phân trang</a> trong kho lưu trữ. <strong>Plugin này không được
    hỗ trợ bởi GitHub Pages</strong>.
  </p>
</div>

## Các thuộc tính Liquid có sẵn

Plugin phân trang hiển thị đối tượng liquid `paginator` với các thuộc tính sau:

{% include docs_variables_table.html scope=site.data.jekyll_variables.paginator %}

<div class="note info">
  <h5>Phân trang không hỗ trợ thẻ hoặc danh mục</h5>
  <p>Phân trang duyệt qua mọi bài viết trong biến <code>posts</code>
  trừ khi một bài viết có <code>hidden: true</code> trong front matter của nó.
  Nó hiện không cho phép phân trang qua các nhóm bài viết được liên kết
  bởi một thẻ hoặc danh mục chung. Nó không thể bao gồm bất kỳ bộ sưu tập
  tài liệu nào vì nó bị giới hạn ở các bài viết.</p>
</div>

## Hiển thị các Bài viết được phân trang

Điều tiếp theo bạn cần làm là thực sự hiển thị các bài viết của mình trong một danh sách sử dụng
biến `paginator` hiện sẽ có sẵn cho bạn. Bạn có thể sẽ
muốn làm điều này trong một trong những trang chính của trang web của bạn. Đây là một ví dụ về
cách đơn giản để hiển thị các Bài viết được phân trang trong một tệp HTML:

{% raw %}

```liquid
---
layout: default
title: Blog của tôi
---

<!-- Vòng lặp này duyệt qua các bài viết được phân trang -->
{% for post in paginator.posts %}
  <h1><a href="{{ post.url }}">{{ post.title }}</a></h1>
  <p class="author">
    <span class="date">{{ post.date }}</span>
  </p>
  <div class="content">
    {{ post.content }}
  </div>
{% endfor %}

<!-- Liên kết phân trang -->
<div class="pagination">
  {% if paginator.previous_page %}
    <a href="{{ paginator.previous_page_path }}" class="previous">
      Trước
    </a>
  {% else %}
    <span class="previous">Trước</span>
  {% endif %}
  <span class="page_number ">
    Trang: {{ paginator.page }} trên {{ paginator.total_pages }}
  </span>
  {% if paginator.next_page %}
    <a href="{{ paginator.next_page_path }}" class="next">Tiếp</a>
  {% else %}
    <span class="next ">Tiếp</span>
  {% endif %}
</div>
```

{% endraw %}

<div class="note warning">
  <h5>Cẩn thận với trường hợp biên trang một</h5>
  <p>
    Jekyll không tạo thư mục ‘page1’, vì vậy mã trên sẽ không hoạt động
    khi liên kết <code>/page1</code> được tạo ra. Xem bên dưới để biết cách xử lý
    điều này nếu nó là vấn đề đối với bạn.
  </p>
</div>

Đoạn mã HTML sau sẽ xử lý trang một, và hiển thị danh sách của mỗi
trang với các liên kết đến tất cả trừ trang hiện tại.

{% raw %}

```liquid
{% if paginator.total_pages > 1 %}
<div class="pagination">
  {% if paginator.previous_page %}
    <a href="{{ paginator.previous_page_path | relative_url }}">&laquo; Trước</a>
  {% else %}
    <span>&laquo; Trước</span>
  {% endif %}

  {% for page in (1..paginator.total_pages) %}
    {% if page == paginator.page %}
      <em>{{ page }}</em>
    {% elsif page == 1 %}
      <a href="{{ site.paginate_path | relative_url | replace: 'page:num/', '' }}">{{ page }}</a>
    {% else %}
      <a href="{{ site.paginate_path | relative_url | replace: ':num', page }}">{{ page }}</a>
    {% endif %}
  {% endfor %}

  {% if paginator.next_page %}
    <a href="{{ paginator.next_page_path | relative_url }}">Tiếp &raquo;</a>
  {% else %}
    <span>Tiếp &raquo;</span>
  {% endif %}
</div>
{% endif %}
```

{% endraw %}
