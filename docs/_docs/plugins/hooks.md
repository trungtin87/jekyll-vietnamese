---
title: Móc (Hooks)
permalink: /docs/plugins/hooks/
---

Sử dụng các móc (hooks), plugin của bạn có thể thực hiện kiểm soát chi tiết đối với các khía cạnh khác nhau của quá trình xây dựng. Nếu plugin của bạn định nghĩa bất kỳ móc nào, Jekyll
sẽ gọi chúng tại các điểm được xác định trước.

Các móc được đăng ký cho một chủ sở hữu và một tên sự kiện. Để đăng ký một móc, bạn gọi `Jekyll::Hooks.register`, và chuyển chủ sở hữu móc, tên sự kiện,
và mã để gọi bất cứ khi nào móc được kích hoạt. Ví dụ, nếu bạn muốn thực thi một số chức năng tùy chỉnh mỗi khi Jekyll hiển thị một
trang, bạn có thể đăng ký một móc như thế này:

```ruby
Jekyll::Hooks.register :pages, :post_render do |page|
  # code to call after Jekyll renders a page
end
```

*Lưu ý: Các sự kiện `:post_convert` được đề cập sau đây là một tính năng được giới thiệu trong v4.2.0.*

Ngoài ra, Jekyll có các điểm móc được xác định trước cho các chủ sở hữu `:site`, `:pages`, `:documents` và `:clean`. Ngoài ra, các điểm móc
được định nghĩa cho `:documents` có thể được sử dụng cho các bộ sưu tập riêng lẻ chỉ bằng cách gọi loại bộ sưu tập thay thế. tức là `:posts` cho các tài liệu
trong bộ sưu tập `_posts` và `:movies` cho các tài liệu trong bộ sưu tập `_movies`. Trong mọi trường hợp, Jekyll gọi các móc của bạn với đối tượng chủ sở hữu là
tham số gọi lại đầu tiên.

Mọi chủ sở hữu móc đã đăng ký đều hỗ trợ các sự kiện sau &mdash; `:post_init`, `:pre_render`, `:post_convert`, `:post_render`, `:post_write`
&mdash; tuy nhiên, chủ sở hữu `:site` được thiết lập để *phản hồi* các *tên sự kiện đặc biệt*. Tham khảo phần tiếp theo để biết chi tiết.

Tất cả các móc `:pre_render` và móc `:site, :post_render` cũng sẽ cung cấp một hàm băm `payload` làm tham số thứ hai. Trong trường hợp của
các sự kiện `:pre_render`, payload cung cấp cho bạn toàn quyền kiểm soát các biến có sẵn trong quá trình hiển thị, với sự kiện `:site, :post_render`,
payload chứa các giá trị cuối cùng sau khi hiển thị tất cả trang web (hữu ích cho sitemaps, feeds, v.v.).

## Chủ sở hữu Móc và Sự kiện Tích hợp

Danh sách đầy đủ các móc có sẵn:

<div class="mobile-side-scroller">
<table id="builtin-hooks">
  <thead>
    <tr>
      <th>Chủ sở hữu</th>
      <th>Sự kiện</th>
      <th>Kích hoạt tại</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td rowspan="6">
        <p><code>:site</code></p>
        <p>Bao gồm toàn bộ trang web</p>
      </td>
      <td>
        <p><code>:after_init</code></p>
      </td>
      <td>
        <p>Ngay sau khi trang web khởi tạo. Tốt cho việc sửa đổi cấu hình của trang web. Được kích hoạt một lần cho mỗi phiên xây dựng / phục vụ</p>
      </td>
    </tr>
    <tr>
      <td>
        <p><code>:after_reset</code></p>
      </td>
      <td>
        <p>Ngay sau khi trang web đặt lại trong quá trình tái tạo</p>
      </td>
    </tr>
    <tr>
      <td>
        <p><code>:post_read</code></p>
      </td>
      <td>
        <p>Sau khi tất cả các tệp nguồn đã được đọc và tải từ đĩa</p>
      </td>
    </tr>
    <tr>
      <td>
        <p><code>:pre_render</code></p>
      </td>
      <td>
        <p>Ngay trước khi hiển thị toàn bộ trang web</p>
      </td>
    </tr>
    <tr>
      <td>
        <p><code>:post_render</code></p>
      </td>
      <td>
        <p>Sau khi hiển thị toàn bộ trang web, nhưng trước khi ghi bất kỳ tệp nào</p>
      </td>
    </tr>
    <tr>
      <td>
        <p><code>:post_write</code></p>
      </td>
      <td>
        <p>Sau khi ghi tất cả các tệp đã hiển thị vào đĩa</p>
      </td>
    </tr>
    <tr>
      <td rowspan="5">
        <p><code>:pages</code></p>
        <p>Cho phép kiểm soát chi tiết đối với tất cả các trang trong trang web</p>
      </td>
      <td>
        <p><code>:post_init</code></p>
      </td>
      <td>
        <p>Bất cứ khi nào một trang được khởi tạo</p>
      </td>
    </tr>
    <tr>
      <td>
        <p><code>:pre_render</code></p>
      </td>
      <td>
        <p>Ngay trước khi hiển thị một trang</p>
      </td>
    </tr>
    <tr>
      <td>
        <p><code>:post_convert</code></p>
      </td>
      <td>
        <p>Sau khi chuyển đổi nội dung trang, nhưng trước khi hiển thị bố cục trang</p>
      </td>
    </tr>
    <tr>
      <td>
        <p><code>:post_render</code></p>
      </td>
      <td>
        <p>Sau khi hiển thị một trang, nhưng trước khi ghi nó vào đĩa</p>
      </td>
    </tr>
    <tr>
      <td>
        <p><code>:post_write</code></p>
      </td>
      <td>
        <p>Sau khi ghi một trang vào đĩa</p>
      </td>
    </tr>
    <tr>
      <td rowspan="5">
        <p><code>:documents</code></p>
        <p>Cho phép kiểm soát chi tiết đối với tất cả các tài liệu trong trang web bao gồm các bài đăng và tài liệu trong các bộ sưu tập do người dùng định nghĩa</p>
      </td>
      <td>
        <p><code>:post_init</code></p>
      </td>
      <td>
        <p>Bất cứ khi nào bất kỳ tài liệu nào được khởi tạo</p>
      </td>
    </tr>
    <tr>
      <td>
        <p><code>:pre_render</code></p>
      </td>
      <td>
        <p>Ngay trước khi hiển thị một tài liệu</p>
      </td>
    </tr>
    <tr>
      <td>
        <p><code>:post_convert</code></p>
      </td>
      <td>
        <p>
          Sau khi chuyển đổi nội dung tài liệu, nhưng trước khi hiển thị bố cục
          tài liệu
        </p>
      </td>
    </tr>
    <tr>
      <td>
        <p><code>:post_render</code></p>
      </td>
      <td>
        <p>Sau khi hiển thị một tài liệu, nhưng trước khi ghi nó vào đĩa</p>
      </td>
    </tr>
    <tr>
      <td>
        <p><code>:post_write</code></p>
      </td>
      <td>
        <p>Sau khi ghi một tài liệu vào đĩa</p>
      </td>
    </tr>
    <tr>
      <td rowspan="5">
        <p><code>:posts</code></p>
        <p>Cho phép kiểm soát chi tiết đối với tất cả các bài đăng trong trang web mà không ảnh hưởng đến các tài liệu trong các bộ sưu tập do người dùng định nghĩa</p>
      </td>
      <td>
        <p><code>:post_init</code></p>
      </td>
      <td>
        <p>Bất cứ khi nào một bài đăng được khởi tạo</p>
      </td>
    </tr>
    <tr>
      <td>
        <p><code>:pre_render</code></p>
      </td>
      <td>
        <p>Ngay trước khi hiển thị một bài đăng</p>
      </td>
    </tr>
    <tr>
      <td>
        <p><code>:post_convert</code></p>
      </td>
      <td>
        <p>Sau khi chuyển đổi nội dung bài đăng, nhưng trước khi hiển thị bố cục bài đăng</p>
      </td>
    </tr>
    <tr>
      <td>
        <p><code>:post_render</code></p>
      </td>
      <td>
        <p>Sau khi hiển thị một bài đăng, nhưng trước khi ghi nó vào đĩa</p>
      </td>
    </tr>
    <tr>
      <td>
        <p><code>:post_write</code></p>
      </td>
      <td>
        <p>Sau khi ghi một bài đăng vào đĩa</p>
      </td>
    </tr>
    <tr>
      <td>
        <p><code>:clean</code></p>
        <p>Kiểm soát chi tiết danh sách các tệp lỗi thời được xác định sẽ bị xóa trong giai đoạn dọn dẹp của trang web.</p>
      </td>
      <td>
        <p><code>:on_obsolete</code></p>
      </td>
      <td>
        <p>Trong quá trình dọn dẹp đích của một trang web trước khi nó được xây dựng</p>
      </td>
    </tr>
  </tbody>
</table>
</div>

## Móc cho các đối tượng Jekyll tùy chỉnh

Bạn cũng có thể đăng ký và kích hoạt các móc cho các đối tượng Jekyll được giới thiệu bởi plugin của bạn. Tất cả những gì cần làm là đặt các cuộc gọi `trigger` dưới một tên
`owner` phù hợp, tại các vị trí mong muốn trong lớp tùy chỉnh của bạn và đăng ký `owner` bởi plugin của bạn.

Để minh họa, hãy xem xét plugin sau triển khai chức năng tùy chỉnh cho mọi đối tượng `Excerpt` tùy chỉnh được khởi tạo:

```ruby
module Foobar
  class HookedExcerpt < Jekyll::Excerpt
    def initialize(doc)
      super
      trigger_hooks(:post_init)
    end

    def output
      @output ||= trigger_hooks(:post_render, renderer.run)
    end

    def renderer
      @renderer ||= Jekyll::Renderer.new(
        doc.site, self, site.site_payload
      )
    end

    def trigger_hooks(hook_name, *args)
      Jekyll::Hooks.trigger :excerpts, hook_name, self, *args
    end
  end
end

Jekyll::Hooks.register :excerpts, :post_init do |excerpt|
  Jekyll.logger.debug "Initialized:",
                      "Hooked Excerpt for #{excerpt.doc.inspect}"
end

Jekyll::Hooks.register :excerpts, :post_render do |excerpt, output|
  return output unless excerpt.doc.type == :posts
  Foobar.transform(output)
end
```
