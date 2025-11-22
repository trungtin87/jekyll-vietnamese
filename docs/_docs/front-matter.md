---
title: Front Matter
permalink: /docs/front-matter/
redirect_from: /docs/frontmatter/index.html
---

Bất kỳ tệp nào chứa khối [YAML](https://yaml.org/) front matter sẽ được
Jekyll xử lý như một tệp đặc biệt. Front matter phải là thứ đầu tiên
trong tệp và phải ở dạng YAML hợp lệ nằm giữa các dòng có ba dấu gạch ngang.
Dưới đây là một ví dụ cơ bản:

```yaml
---
layout: post
title: Viết blog như một Hacker
---
```

Giữa các dòng ba dấu gạch ngang này, bạn có thể đặt các biến được xác định trước (xem bên dưới
để tham khảo) hoặc thậm chí tạo các biến tùy chỉnh của riêng bạn. Các biến này sau đó sẽ
có sẵn để bạn truy cập bằng cách sử dụng các thẻ Liquid ở phần dưới của tệp
và cũng trong bất kỳ bố cục (layout) hoặc tệp bao gồm (include) nào mà trang hoặc bài viết đang xét
dựa vào.

<div class="note warning">
  <h5>Cảnh báo Mã hóa Ký tự UTF-8</h5>
  <p>
    Nếu bạn sử dụng mã hóa UTF-8, hãy đảm bảo rằng không có ký tự tiêu đề <code>BOM</code>
    nào tồn tại trong các tệp của bạn, nếu không những điều rất, rất tồi tệ sẽ xảy ra với
    Jekyll. Điều này đặc biệt liên quan nếu bạn đang chạy
    <a href="{{ '/docs/installation/windows/' | relative_url }}">Jekyll trên Windows</a>.
  </p>
</div>

<div class="note">
  <h5>Biến Front Matter là Tùy chọn</h5>
  <p>
    Nếu bạn muốn sử dụng <a href="{{ '/docs/variables/' | relative_url }}">các thẻ và biến Liquid</a>
    nhưng không cần bất cứ thứ gì trong front matter của mình, chỉ cần để trống nó! Tập hợp
    các dòng ba dấu gạch ngang không có gì ở giữa vẫn sẽ khiến Jekyll
    xử lý tệp của bạn. (Điều này hữu ích cho những thứ như CSS và RSS feed!)
  </p>
</div>

## Các Biến Toàn cục Được xác định trước

Có một số biến toàn cục được xác định trước mà bạn có thể đặt trong
front matter của một trang hoặc bài viết.

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
      <td>
        <p><code>layout</code></p>
      </td>
      <td>
        <p>

          Nếu được đặt, biến này chỉ định tệp bố cục sẽ sử dụng. Sử dụng tên tệp bố cục
          không có phần mở rộng tệp. Các tệp bố cục phải được đặt trong
          thư mục <code>_layouts</code>.

        </p>
        <ul>
          <li>
            Sử dụng <code>null</code> sẽ tạo ra một tệp mà không sử dụng tệp bố cục
            nào. Điều này bị ghi đè nếu tệp là một bài viết/tài liệu và có một
            bố cục được xác định trong <a href="{{ '/docs/configuration/front-matter-defaults/' | relative_url }}">
            mặc định front matter</a>.
          </li>
          <li>
            Bắt đầu từ phiên bản 3.5.0, sử dụng <code>none</code> trong một bài viết/tài liệu sẽ
            tạo ra một tệp mà không sử dụng tệp bố cục bất kể mặc định front matter.
            Sử dụng <code>none</code> trong một trang sẽ khiến Jekyll cố gắng
            sử dụng một bố cục có tên là "none".
          </li>
        </ul>
      </td>
    </tr>
    <tr>
      <td>
        <p><code>permalink</code></p>
      </td>
      <td>
        <p>

          Nếu bạn cần URL bài viết blog đã xử lý của mình là một cái gì đó khác với
          kiểu toàn trang web (mặc định <code>/year/month/day/title.html</code>), thì bạn có thể đặt
          biến này và nó sẽ được sử dụng làm URL cuối cùng.

        </p>
      </td>
    </tr>
    <tr>
      <td>
        <p><code>published</code></p>
      </td>
      <td>
        <p>
          Đặt thành false nếu bạn không muốn một bài viết cụ thể hiển thị khi
          trang web được tạo.
        </p>
      </td>
    </tr>
  </tbody>
</table>
</div>

<div class="note">
  <h5>Hiển thị Các bài viết Được đánh dấu là Chưa xuất bản</h5>
  <p>
    Để xem trước các trang chưa xuất bản, hãy chạy `jekyll serve` hoặc `jekyll build`
    với tham số `--unpublished`. Jekyll cũng có một tính năng <a href="{{ '/docs/posts/#drafts' | relative_url }}">bản nháp (drafts)</a>
    tiện dụng được thiết kế riêng cho các bài viết blog.
  </p>
</div>

## Biến Tùy chỉnh

Bạn cũng có thể đặt các biến front matter của riêng mình mà bạn có thể truy cập trong Liquid. Ví dụ,
nếu bạn đặt một biến gọi là `food`, bạn có thể sử dụng biến đó trong trang của mình:

{% raw %}

```liquid
---
food: Pizza
---

<h1>{{ page.food }}</h1>
```

{% endraw %}

## Các Biến Được xác định trước cho Bài viết

Những biến này có sẵn ngay lập tức để sử dụng trong front matter cho một bài viết.

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
      <td>
        <p><code>date</code></p>
      </td>
      <td>
        <p>
          Một ngày ở đây ghi đè ngày từ tên của bài viết. Điều này có thể được
          sử dụng để đảm bảo sắp xếp chính xác các bài viết. Một ngày được chỉ định theo
          định dạng <code>YYYY-MM-DD HH:MM:SS +/-TTTT</code>; giờ, phút, giây và độ lệch múi giờ
          là tùy chọn.
        </p>
      </td>
    </tr>
    <tr>
      <td>
        <p><code>category</code></p>
        <p><code>categories</code></p>
      </td>
      <td>
        <p>

          Thay vì đặt các bài viết bên trong các thư mục, bạn có thể chỉ định một hoặc
          nhiều danh mục mà bài viết thuộc về. Khi trang web được tạo
          bài viết sẽ hoạt động như thể nó đã được đặt với các danh mục này
          một cách bình thường. Categories (khóa số nhiều) có thể được chỉ định dưới dạng một <a
          href="https://en.wikipedia.org/wiki/YAML#Basic_components">danh sách YAML</a> hoặc một
          chuỗi phân tách bằng dấu cách.

        </p>
      </td>
    </tr>
    <tr>
      <td>
        <p><code>tags</code></p>
      </td>
      <td>
        <p>

          Tương tự như categories, một hoặc nhiều thẻ (tags) có thể được thêm vào một bài viết.
          Cũng giống như categories, tags có thể được chỉ định dưới dạng một <a
          href="https://en.wikipedia.org/wiki/YAML#Basic_components">danh sách YAML</a> hoặc một
          chuỗi phân tách bằng dấu cách.

        </p>
      </td>
    </tr>
  </tbody>
</table>
</div>

<div class="note">
  <h5>Đừng lặp lại chính mình</h5>
  <p>
    Nếu bạn không muốn lặp lại các biến front matter thường dùng của mình
    hết lần này đến lần khác, hãy xác định
    <a href="{{ '/docs/configuration/front-matter-defaults/' | relative_url }}" title="Front Matter defaults">mặc định</a>
    cho chúng và chỉ ghi đè chúng khi cần thiết (hoặc không bao giờ). Điều này hoạt động
    cho cả các biến được xác định trước và tùy chỉnh.
  </p>
</div>
