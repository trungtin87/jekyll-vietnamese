---
title: Tệp Tĩnh (Static Files)
permalink: /docs/static-files/
---
Một tệp tĩnh là một tệp không chứa bất kỳ front matter nào. Những tệp này
bao gồm hình ảnh, PDF, và các nội dung không được hiển thị khác.

Chúng có thể truy cập được trong Liquid thông qua `site.static_files` và chứa
các siêu dữ liệu sau:

<div class="mobile-side-scroller">
<table>
  <thead>
    <tr>
      <th>Biến</th>
      <th>Mô tả</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td><p><code>file.path</code></p></td>
      <td><p>

        Đường dẫn tương đối đến tệp, ví dụ: <code>/assets/img/image.jpg</code>

      </p></td>
    </tr>
    <tr>
      <td><p><code>file.modified_time</code></p></td>
      <td><p>

        `Time` (Thời gian) tệp được sửa đổi lần cuối, ví dụ: <code>2016-04-01 16:35:26 +0200</code>

      </p></td>
    </tr>
    <tr>
      <td><p><code>file.name</code></p></td>
      <td><p>

        Tên chuỗi của tệp ví dụ: <code>image.jpg</code> cho <code>image.jpg</code>

      </p></td>
    </tr>
    <tr>
      <td><p><code>file.basename</code></p></td>
      <td><p>

        Tên cơ sở chuỗi của tệp ví dụ: <code>image</code> cho <code>image.jpg</code>

      </p></td>
    </tr>
    <tr>
      <td><p><code>file.extname</code></p></td>
      <td><p>

        Tên phần mở rộng cho tệp, ví dụ:
        <code>.jpg</code> cho <code>image.jpg</code>

      </p></td>
    </tr>
  </tbody>
</table>
</div>

Lưu ý rằng trong bảng trên, `file` có thể là bất cứ thứ gì. Nó là một biến được đặt tùy ý sử dụng trong logic của riêng bạn (chẳng hạn như trong một vòng lặp for). Nó không phải là một biến trang web hoặc trang toàn cầu.

## Thêm front matter vào tệp tĩnh

Mặc dù bạn không thể trực tiếp thêm các giá trị front matter vào các tệp tĩnh, bạn có thể đặt các giá trị front matter thông qua [thuộc tính defaults](/docs/configuration/front-matter-defaults/) trong tệp cấu hình của bạn. Khi Jekyll xây dựng trang web, nó sẽ sử dụng các giá trị front matter mà bạn đã đặt.

Dưới đây là một ví dụ:

Trong tệp `_config.yml` của bạn, hãy thêm các giá trị sau vào thuộc tính `defaults`:

```yaml
defaults:
  - scope:
      path: "assets/img"
    values:
      image: true
```

Điều này giả định rằng trang web Jekyll của bạn có một đường dẫn thư mục là `assets/img` nơi bạn có các hình ảnh (tệp tĩnh) được lưu trữ. Khi Jekyll xây dựng trang web, nó sẽ coi mỗi hình ảnh như thể nó có giá trị front matter là `image: true`.

Giả sử bạn muốn liệt kê tất cả các tài sản hình ảnh của mình có trong `assets/img`. Bạn có thể sử dụng vòng lặp for này để tìm trong đối tượng `static_files` và lấy tất cả các tệp tĩnh có thuộc tính front matter này:

{% raw %}

```liquid
{% assign image_files = site.static_files | where: "image", true %}
{% for myimage in image_files %}
  {{ myimage.path }}
{% endfor %}
```

{% endraw %}

Khi bạn xây dựng trang web của mình, đầu ra sẽ liệt kê đường dẫn đến từng tệp đáp ứng điều kiện front matter này.
