---
title: Cấu hình Mặc định (Default Configuration)
permalink: "/docs/configuration/incremental-regeneration/"
---

## Tái tạo Gia tăng (Incremental Regeneration)

<div class="note warning">
  <h5>Tái tạo gia tăng vẫn là một tính năng thử nghiệm</h5>
  <p>
    Mặc dù tái tạo gia tăng sẽ hoạt động cho các trường hợp phổ biến nhất, nó sẽ
    không hoạt động chính xác trong mọi tình huống. Vui lòng cực kỳ thận trọng khi
    sử dụng tính năng này, và báo cáo bất kỳ vấn đề nào không được liệt kê bên dưới bằng cách
    <a href="https://github.com/jekyll/jekyll/issues/new">mở một vấn đề trên GitHub</a>.
  </p>
</div>

Tái tạo gia tăng giúp rút ngắn thời gian xây dựng bằng cách chỉ tạo các tài liệu
và trang đã được cập nhật kể từ lần xây dựng trước. Nó thực hiện điều này bằng cách theo dõi
cả thời gian sửa đổi tệp và các phụ thuộc giữa các tài liệu trong tệp
`.jekyll-metadata`.

Theo cách triển khai hiện tại, tái tạo gia tăng sẽ chỉ tạo một
tài liệu hoặc trang nếu nó, hoặc một trong các phụ thuộc của nó, được sửa đổi. Hiện tại,
các loại phụ thuộc duy nhất được theo dõi là các bao gồm (sử dụng thẻ
{% raw %}`{% include %}`{% endraw %}) và bố cục. Điều này có nghĩa là các tham chiếu
thuần túy đến các tài liệu khác (ví dụ, trường hợp phổ biến lặp qua
`site.posts` trong trang danh sách bài đăng) sẽ không được phát hiện là một phụ thuộc.

Để khắc phục một số thiếu sót này, việc đặt `regenerate: true` trong front-matter
của một tài liệu sẽ buộc Jekyll tái tạo nó bất kể nó có được sửa đổi hay không.
Lưu ý rằng điều này sẽ chỉ tạo tài liệu được chỉ định; các tham chiếu
đến nội dung của các tài liệu khác sẽ không hoạt động vì chúng sẽ không được hiển thị lại.

Tái tạo gia tăng có thể được kích hoạt thông qua cờ `--incremental` (viết tắt là `-I`)
từ dòng lệnh hoặc bằng cách đặt `incremental: true` trong tệp
cấu hình của bạn.
