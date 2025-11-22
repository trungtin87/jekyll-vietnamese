---
title: Plugin đầu tiên của bạn
permalink: /docs/plugins/your-first-plugin/
---

Các plugin cho phép bạn mở rộng hành vi của Jekyll để phù hợp với nhu cầu của bạn. Có sáu
loại plugin trong Jekyll.

## Bộ tạo (Generators)

[Bộ tạo](/docs/plugins/generators/) tạo nội dung trên trang web của bạn.
Ví dụ:

* [jekyll-feed](https://github.com/jekyll/jekyll-feed) tạo một nguồn cấp dữ liệu Atom của
các bài đăng trên blog.
* [jekyll-archives](https://github.com/jekyll/jekyll-archives) tạo các trang lưu trữ
cho các danh mục và thẻ blog.
* [jekyll-sitemap](https://github.com/jekyll/jekyll-sitemap) tạo một sơ đồ trang web.

## Bộ chuyển đổi (Converters)

[Bộ chuyển đổi](/docs/plugins/converters/) thay đổi một ngôn ngữ đánh dấu thành một định dạng
khác. Ví dụ:

* [jekyll-textile-converter](https://github.com/jekyll/jekyll-textile-converter)
chuyển đổi textile sang HTML.
* [jekyll-coffeescript](https://github.com/jekyll/jekyll-coffeescript) chuyển đổi
Coffeescript sang JavaScript.
* [jekyll-opal](https://github.com/jekyll/jekyll-opal) chuyển đổi Ruby sang
JavaScript.

## Lệnh (Commands)

[Lệnh](/docs/plugins/commands/) mở rộng tệp thực thi `jekyll` với các
lệnh con. Ví dụ:

* [jekyll-compose](https://github.com/jekyll/jekyll-compose) thêm các lệnh con
để tạo một bài đăng, trang hoặc bản nháp.

## Thẻ (Tags)

[Thẻ](/docs/plugins/tags/) tạo các thẻ Liquid tùy chỉnh. Ví dụ:

* [jekyll-youtube](https://github.com/dommmel/jekyll-youtube) nhúng một video
YouTube.
* [jekyll-asset-path-plugin](https://github.com/samrayner/jekyll-asset-path-plugin)
xuất ra một URL tương đối cho các tài sản.
* [jekyll-swfobject](https://github.com/sectore/jekyll-swfobject) nhúng một đối tượng
SWF.

## Bộ lọc (Filters)

[Bộ lọc](/docs/plugins/filters/) tạo các bộ lọc Liquid tùy chỉnh. Ví dụ:

* [jekyll-time-ago](https://github.com/markets/jekyll-timeago) - Khoảng cách
giữa hai ngày bằng chữ.
* [jekyll-toc](https://github.com/toshimaru/jekyll-toc) - Tạo một mục lục.
* [jekyll-email-protect](https://github.com/vwochnik/jekyll-email-protect) -
Làm mờ email để bảo vệ chúng khỏi các bot spam.

## Móc (Hooks)

[Móc](/docs/plugins/hooks/) cung cấp quyền kiểm soát chi tiết để mở rộng quá trình
xây dựng. Ví dụ:

* [jemoji](https://github.com/jekyll/jemoji) Hiển thị biểu tượng cảm xúc :+1:
* [jekyll-mentions](https://github.com/jekyll/jekyll-mentions) biến các đề cập @jekyll thành các liên kết
* [jekyll-spaceship](https://github.com/jeffreytse/jekyll-spaceship) - ví dụ nâng cao. Cung cấp
hỗ trợ mạnh mẽ cho bảng, mathjax, plantuml, video, v.v.

## Cờ (Flags)

Có hai cờ cần lưu ý khi viết một plugin:

<div class="mobile-side-scroller">
<table>
  <thead>
    <tr>
      <th>Cờ</th>
      <th>Mô tả</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>
        <p><code>safe</code></p>
      </td>
      <td>
        <p>
          Một cờ boolean thông báo cho Jekyll biết liệu plugin này có thể được thực thi an toàn
          trong một môi trường nơi việc thực thi mã tùy ý không được
          cho phép hay không. Điều này được sử dụng bởi GitHub Pages để xác định plugin cốt lõi nào
          có thể được sử dụng, và plugin nào không an toàn để chạy. Nếu plugin của bạn không
          cho phép thực thi mã tùy ý, hãy đặt cái này thành <code>true</code>.
          GitHub Pages vẫn sẽ không tải plugin của bạn, nhưng nếu bạn gửi nó để
          đưa vào cốt lõi, tốt nhất là cái này phải chính xác!
        </p>
      </td>
    </tr>
    <tr>
      <td>
        <p><code>priority</code></p>
      </td>
      <td>
        <p>
          Cờ này xác định thứ tự plugin được tải. Các giá trị hợp lệ
          là: <code>:lowest</code>, <code>:low</code>, <code>:normal</code>,
          <code>:high</code>, và <code>:highest</code>. Các kết quả khớp ưu tiên cao nhất
          được áp dụng trước, ưu tiên thấp nhất được áp dụng sau cùng.
        </p>
      </td>
    </tr>
  </tbody>
</table>
</div>

Để sử dụng một trong các plugin ví dụ ở trên làm minh họa, đây là cách bạn sẽ
chỉ định hai cờ này:

```ruby
module Jekyll
  class UpcaseConverter < Converter
    safe true
    priority :low
    ...
  end
end
```

## Thực tiễn tốt nhất

Các hướng dẫn giúp bạn với các chi tiết cụ thể của việc tạo plugin. Chúng tôi cũng có một số
thực tiễn tốt nhất được đề xuất để giúp cấu trúc plugin của bạn.

Chúng tôi khuyên bạn nên sử dụng một [gem](/docs/ruby-101/#gems) cho plugin của bạn. Điều này sẽ
giúp bạn quản lý các phụ thuộc, giữ sự tách biệt khỏi mã nguồn trang web của bạn và
cho phép bạn chia sẻ chức năng trên nhiều dự án. Để biết các mẹo về việc tạo
một gem hãy xem
[hướng dẫn Ruby gems](https://guides.rubygems.org/make-your-own-gem/) hoặc xem
qua mã nguồn của một plugin hiện có như
[jekyll-feed](https://github.com/jekyll/jekyll-feed).
