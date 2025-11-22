---
title: Bộ lọc Liquid (Liquid Filters)
permalink: "/docs/liquid/filters/"
shopify_filter_url: https://shopify.github.io/liquid/filters/
shopify_filters:
- abs
- append
- at_least
- at_most
- capitalize
- ceil
- compact
- concat
- date
- default
- divided_by
- downcase
- escape
- escape_once
- first
- floor
- join
- last
- lstrip
- map
- minus
- modulo
- newline_to_br
- plus
- prepend
- remove
- remove_first
- replace
- replace_first
- reverse
- round
- rstrip
- size
- slice
- sort
- sort_natural
- split
- strip
- strip_html
- strip_newlines
- times
- truncate
- truncatewords
- uniq
- upcase
- url_decode
- url_encode
---

Tất cả các [bộ lọc](#standard-liquid-filters) Liquid tiêu chuẩn đều được hỗ trợ (xem bên dưới).

Để thực hiện các tác vụ phổ biến dễ dàng hơn, Jekyll thậm chí còn thêm một vài bộ lọc tiện dụng của riêng mình,
tất cả đều có thể tìm thấy trên trang này. Bạn cũng có thể tạo bộ lọc của riêng mình
bằng cách sử dụng [plugins](/docs/plugins/).

<div class="mobile-side-scroller">
<table>
  <thead>
    <tr>
      <th>Mô tả</th>
      <th><span class="filter">Bộ lọc</span> và <span class="output">Đầu ra</span></th>
    </tr>
  </thead>
  <tbody>
    {% for filter in site.data.jekyll_filters %}
      <tr>
        <td>
          <p id="{{ filter.name | slugify }}" class="name"><strong>{{ filter.name }}</strong></p>
          <p>
            {{- filter.description -}}
            {%- if filter.version_badge %}
              <span class="version-badge" title="This filter is available from version {{ filter.version_badge }}">
                {{- filter.version_badge -}}
              </span>
            {% endif -%}
          </p>
        </td>
        <td class="align-center">
          {%- for example in filter.examples %}
            <p><code class="filter">{{ example.input }}</code></p>
            {% if example.output %}<p><code class="output">{{ example.output }}</code></p>{% endif %}
          {% endfor -%}
        </td>
      </tr>
    {% endfor %}
  </tbody>
</table>
</div>

### Tùy chọn cho bộ lọc `slugify`

Bộ lọc `slugify` chấp nhận một tùy chọn, mỗi tùy chọn chỉ định những gì cần lọc.
Mặc định là `default`. Chúng như sau (với những gì chúng lọc):

- `none`: không có ký tự nào
- `raw`: khoảng trắng
- `default`: khoảng trắng và các ký tự không phải chữ và số
- `pretty`: khoảng trắng và các ký tự không phải chữ và số ngoại trừ `._~!$&'()+,;=@`
- `ascii`: khoảng trắng, không phải chữ và số, và các ký tự không phải ASCII
- `latin`: giống như `default`, ngoại trừ các ký tự Latinh được chuyển ngữ trước (ví dụ: `àèïòü` thành `aeiou`) {%- include docs_version_badge.html version="3.7.0" -%}.

### Phát hiện giá trị `nil` với bộ lọc `where` {%- include docs_version_badge.html version="4.0" -%}

Bạn có thể sử dụng bộ lọc `where` để phát hiện các tài liệu và trang có thuộc tính là `nil` hoặc `""`. Ví dụ,

{% raw %}

```liquid
// Using `nil` to select posts that either do not have `my_prop`
// defined or `my_prop` has been set to `nil` explicitly.
{% assign filtered_posts = site.posts | where: 'my_prop', nil %}
```

{% endraw %}

{% raw %}

```liquid
// Using Liquid's special literal `empty` or `blank` to select
// posts that have `my_prop` set to an empty value.
{% assign filtered_posts = site.posts | where: 'my_prop', empty %}
```

{% endraw %}

### Toán tử nhị phân trong bộ lọc `where_exp` {%- include docs_version_badge.html version="4.0" -%}

Bạn có thể sử dụng các toán tử nhị phân Liquid `or` và `and` trong biểu thức được truyền cho bộ lọc `where_exp` để sử dụng nhiều
điều kiện trong hoạt động.

Ví dụ: để lấy danh sách các tài liệu về phim kinh dị tiếng Anh, người ta có thể sử dụng đoạn mã sau:

{% raw %}

```liquid
{{ site.movies | where_exp: "item", "item.genre == 'horror' and item.language == 'English'" }}
```

{% endraw %}

Hoặc để lấy danh sách các bộ phim dựa trên truyện tranh, người ta có thể sử dụng như sau:

{% raw %}

```liquid
{{ site.movies | where_exp: "item", "item.sub_genre == 'MCU' or item.sub_genre == 'DCEU'" }}
```

{% endraw %}

### Bộ lọc Liquid Tiêu chuẩn

Để thuận tiện cho bạn, đây là danh sách tất cả [các bộ lọc Liquid]({{ page.shopify_filter_url }}) với các liên kết đến các ví dụ trong tài liệu Liquid chính thức.

{% for filter in page.shopify_filters %}

- [{{ filter }}]({{ filter | prepend: page.shopify_filter_url | append: '/' }})
{% endfor %}
