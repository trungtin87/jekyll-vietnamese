---
title: Liên kết tĩnh (Permalinks)
permalink: /docs/permalinks/
---

Liên kết tĩnh là đường dẫn đầu ra cho các trang, bài viết hoặc bộ sưu tập của bạn. Chúng
cho phép bạn cấu trúc các thư mục mã nguồn của mình khác với các
thư mục trong đầu ra của bạn.

## Front Matter

Cách đơn giản nhất để đặt liên kết tĩnh là sử dụng front matter. Bạn đặt biến
`permalink` trong front matter thành đường dẫn đầu ra mà bạn muốn.

Ví dụ: bạn có thể có một trang trên trang web của mình nằm tại
`/my_pages/about-me.html` và bạn muốn url đầu ra là `/about/`. Trong
front matter của trang, bạn sẽ đặt:

```yaml
---
permalink: /about/
---
```

## Toàn cục

Đặt liên kết tĩnh trong front matter cho mỗi trang trên trang web của bạn không vui chút nào.
May mắn thay, Jekyll cho phép bạn đặt cấu trúc liên kết tĩnh toàn cục trong `_config.yml` của bạn.

Để đặt liên kết tĩnh toàn cục, bạn sử dụng biến `permalink` trong `_config.yml`.
Bạn có thể sử dụng các trình giữ chỗ cho đầu ra mong muốn của mình. Ví dụ:

```yaml
permalink: /:categories/:year/:month/:day/:title:output_ext
```

Lưu ý rằng các trang và bộ sưu tập (ngoại trừ `posts` và `drafts`) không có thời gian
và danh mục (đối với các trang, `:title` ở trên tương đương với `:basename`), những
khía cạnh này của kiểu liên kết tĩnh bị bỏ qua cho đầu ra.

Ví dụ: kiểu liên kết tĩnh của
`/:categories/:year/:month/:day/:title:output_ext` cho bộ sưu tập `posts` trở thành
`/:title.html` cho các trang và bộ sưu tập (ngoại trừ `posts` và `drafts`).

### Trình giữ chỗ (Placeholders)

Dưới đây là danh sách đầy đủ các trình giữ chỗ có sẵn:

<div class="mobile-side-scroller">
<table>
  <thead>
    <tr>
      <th>Biến</th>
      <th>Mô tả</th>
    </tr>
  </thead>
  <tbody>
    {%- for entry in site.data.permalinks.placeholders %}
    <tr>
      <td><p><code>:{{ entry.name }}</code></p>
        {%- if entry.intro_ver -%}
          <small>{% include docs_version_badge.html version = entry.intro_ver %}</small>
        {%- endif -%}
      </td>
      <td><p>{{ entry.desc }}</p></td>
    </tr>
    {%- endfor %}
  </tbody>
</table>
</div>

### Các định dạng tích hợp sẵn

Đối với các bài viết, Jekyll cũng cung cấp các kiểu tích hợp sẵn sau đây để thuận tiện:

<div class="mobile-side-scroller">
<table>
  <thead>
    <tr>
      <th>Kiểu Liên kết tĩnh</th>
      <th>Mẫu URL</th>
    </tr>
  </thead>
  <tbody>
    {%- for entry in site.data.permalinks.builtin_formats %}
    <tr>
      <td><p><code>{{ entry.name }}</code></p>
        {%- if entry.intro_ver -%}
          <small>{% include docs_version_badge.html version = entry.intro_ver %}</small>
        {%- endif -%}
      </td>
      <td>
        <p><code>{{ entry.format }}</code>
        {%- if entry.note -%}<br/>
          <small>({{ entry.note }})</small>
        {%- endif -%}
        </p>
      </td>
    </tr>
    {%- endfor %}
  </tbody>
</table>
</div>

Thay vì gõ `permalink: /:categories/:year/:month/:day/:title/`, bạn chỉ cần gõ `permalink: pretty`.

<div class="note info">
<h5>Chỉ định liên kết tĩnh thông qua front matter</h5>
<p>Các kiểu liên kết tĩnh tích hợp sẵn không được nhận dạng trong front matter. Do đó, <code>permalink: pretty</code> sẽ không hoạt động.</p>
</div>

### Bộ sưu tập

Đối với các bộ sưu tập (bao gồm `posts` và `drafts`), bạn có tùy chọn ghi đè
liên kết tĩnh toàn cục trong cấu hình bộ sưu tập trong `_config.yml`:

```yaml
collections:
  my_collection:
    output: true
    permalink: /:collection/:name
```

Các bộ sưu tập có các trình giữ chỗ sau đây có sẵn:

<div class="mobile-side-scroller">
<table>
  <thead>
    <tr>
      <th>Biến</th>
      <th>Mô tả</th>
    </tr>
  </thead>
  <tbody>
    {%- for entry in site.data.permalinks.types.documents -%}
    <tr>
      <td><p><code>:{{ entry.name }}</code></p></td>
      <td><p>{{ entry.desc }}</p></td>
    </tr>
    {%- endfor -%}
  </tbody>
</table>
</div>

### Trang

Đối với các trang, bạn phải sử dụng front matter để ghi đè liên kết tĩnh toàn cục,
và nếu bạn đặt liên kết tĩnh thông qua mặc định front matter trong `_config.yml`,
nó sẽ bị bỏ qua.

Các trang có các trình giữ chỗ sau đây có sẵn:

<div class="mobile-side-scroller">
<table>
  <thead>
    <tr>
      <th>Biến</th>
      <th>Mô tả</th>
    </tr>
  </thead>
  <tbody>
    {%- for entry in site.data.permalinks.types.pages -%}
    <tr>
      <td><p><code>:{{ entry.name }}</code></p></td>
      <td><p>{{ entry.desc }}</p></td>
    </tr>
    {%- endfor -%}
  </tbody>
</table>
</div>
