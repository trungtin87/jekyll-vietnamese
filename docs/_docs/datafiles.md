---
title: Tệp Dữ liệu
permalink: /docs/datafiles/
---

Ngoài các [biến tích hợp]({{'/docs/variables/' | relative_url }}) có sẵn từ Jekyll,
bạn có thể chỉ định dữ liệu tùy chỉnh của riêng mình để truy cập qua [hệ thống mẫu Liquid](https://github.com/Shopify/liquid/wiki/Liquid-for-Designers).

Jekyll hỗ trợ tải dữ liệu từ các tệp [YAML](https://yaml.org), [JSON](https://www.json.org/json-en.html), [CSV](https://en.wikipedia.org/wiki/Comma-separated_values), và [TSV](https://en.wikipedia.org/wiki/Tab-separated_values) nằm trong thư mục `_data`.
Lưu ý rằng các tệp CSV và TSV *phải* chứa một hàng tiêu đề.

Tính năng mạnh mẽ này cho phép bạn tránh lặp lại trong các mẫu của mình và
đặt các tùy chọn cụ thể cho trang web mà không cần thay đổi `_config.yml`.

Các plugin/giao diện (themes) cũng có thể tận dụng Tệp Dữ liệu để đặt các biến cấu hình.

## Thư mục Dữ liệu

Thư mục `_data` là nơi bạn có thể lưu trữ dữ liệu bổ sung để Jekyll sử dụng khi
tạo trang web của bạn. Các tệp này phải là tệp YAML, JSON, TSV hoặc CSV (sử dụng
phần mở rộng `.yml`, `.yaml`, `.json`, `.tsv`, hoặc `.csv`), và chúng sẽ
có thể truy cập được qua `site.data`.

## Ví dụ: Danh sách thành viên

Dưới đây là một ví dụ cơ bản về việc sử dụng Tệp Dữ liệu để tránh sao chép-dán các đoạn mã lớn
trong các mẫu Jekyll của bạn:

Trong `_data/members.yml`:

```yaml
- name: Eric Mill
  github: konklone

- name: Parker Moore
  github: parkr

- name: Liu Fengyun
  github: liufengyun
```

Hoặc `_data/members.csv`:

```
name,github
Eric Mill,konklone
Parker Moore,parkr
Liu Fengyun,liufengyun
```

Dữ liệu này có thể được truy cập qua `site.data.members` (lưu ý rằng *tên cơ sở* (basename) của tệp xác định tên biến và
do đó, người ta nên tránh có các tệp dữ liệu có cùng tên cơ sở nhưng khác phần mở rộng trong cùng một thư mục).

Bây giờ bạn có thể hiển thị danh sách các thành viên trong một mẫu:

{% raw %}

```liquid
<ul>
{% for member in site.data.members %}
  <li>
    <a href="https://github.com/{{ member.github }}">
      {{ member.name }}
    </a>
  </li>
{% endfor %}
</ul>
```

{% endraw %}

## Thư mục con

Các tệp dữ liệu cũng có thể được đặt trong các thư mục con của thư mục `_data`. Mỗi cấp thư mục
sẽ được thêm vào không gian tên của một biến. Ví dụ dưới đây cho thấy cách
các tổ chức GitHub có thể được định nghĩa riêng biệt trong một tệp dưới thư mục `orgs`:

Trong `_data/orgs/jekyll.yml`:

```yaml
username: jekyll
name: Jekyll
members:
  - name: Tom Preston-Werner
     github: mojombo

  - name: Parker Moore
     github: parkr
```

Trong `_data/orgs/doeorg.yml`:

```yaml
username: doeorg
name: Doe Org
members:
  - name: John Doe
     github: jdoe
```

Các tổ chức sau đó có thể được truy cập qua `site.data.orgs`, theo sau là
tên tệp:

{% raw %}

```liquid
<ul>
{% for org_hash in site.data.orgs %}
{% assign org = org_hash[1] %}
  <li>
    <a href="https://github.com/{{ org.username }}">
      {{ org.name }}
    </a>
    ({{ org.members | size }} members)
  </li>
{% endfor %}
</ul>
```

{% endraw %}

## Ví dụ: Truy cập một tác giả cụ thể

Các trang và bài viết cũng có thể truy cập một mục dữ liệu cụ thể. Ví dụ dưới đây cho thấy cách truy cập một mục cụ thể:

`_data/people.yml`:

```yaml
dave:
    name: David Smith
    twitter: DavidSilvaSmith
```

Tác giả sau đó có thể được chỉ định là một biến trang trong front matter của bài viết:

{% raw %}

```liquid
---
title: sample post
author: dave
---

{% assign author = site.data.people[page.author] %}
<a rel="author"
  href="https://twitter.com/{{ author.twitter }}"
  title="{{ author.name }}">
    {{ author.name }}
</a>
```

{% endraw %}

Để biết thông tin về cách xây dựng điều hướng mạnh mẽ cho trang web của bạn (đặc biệt nếu bạn có một trang web tài liệu hoặc một loại trang web Jekyll khác với nhiều trang cần tổ chức), hãy xem [Điều hướng]({{ '/tutorials/navigation/' | relative_url }}).

## Tùy chọn Phân tích cú pháp CSV/TSV

Cách Ruby phân tích cú pháp các tệp CSV và TSV có thể được tùy chỉnh với các tùy chọn cấu hình `csv_reader` và `tsv_reader`.
Mỗi khóa cấu hình hiển thị các tùy chọn giống nhau:

`converters`: Những [bộ chuyển đổi CSV](https://ruby-doc.org/stdlib-2.5.0/libdoc/csv/rdoc/CSV.html#Converters) nào nên được
              sử dụng khi phân tích cú pháp tệp. Các tùy chọn có sẵn là `integer`, `float`, `numeric`, `date`, `date_time` và
              `all`. Theo mặc định, danh sách này trống.
`encoding`:   Mã hóa của các tệp. Mặc định là tùy chọn cấu hình `encoding` của trang web.
`headers`:    Trường Boolean cho biết có phân tích dòng đầu tiên của tệp làm tiêu đề hay không. Khi `false`, nó coi
              hàng đầu tiên là dữ liệu. Mặc định là `true`.

Ví dụ:

```yaml
csv_reader:
    converters:
      - numeric
      - datetime
    headers: true
    encoding: utf-8
tsv_reader:
    converters:
      - all
    headers: false
```
