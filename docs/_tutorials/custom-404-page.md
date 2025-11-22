---
title: Trang 404 Tùy chỉnh
author: ashmaroli
date: 2017-03-11 17:23:24 +0530
---

Bạn có thể dễ dàng phục vụ các trang lỗi 404 tùy chỉnh với Jekyll để thay thế trang **Error 404 -- File Not Found** mặc định được hiển thị khi ai đó cố gắng truy cập một liên kết bị hỏng trên trang web của bạn.

## Trên GitHub Pages

Bất kỳ `404.html` nào tại **thư mục gốc của thư mục `_site` của bạn** sẽ được phục vụ tự động bởi GitHub Pages và máy chủ phát triển WEBrick cục bộ.

Chỉ cần thêm một `404.md` hoặc `404.html` tại thư mục gốc của thư mục nguồn trang web của bạn và bao gồm dữ liệu front matter để sử dụng bố cục cơ sở của giao diện.

Nếu bạn dự định tổ chức các tệp của mình dưới các thư mục con, trang lỗi nên có Dữ liệu Front Matter sau, được đặt: `permalink: /404.html`. Điều này là để đảm bảo rằng `404.html` đã biên dịch nằm ở thư mục gốc của trang web đã xử lý của bạn, nơi nó sẽ được máy chủ chọn.

```markdown
---
# ví dụ 404.md

layout: default
permalink: /404.html
---

# 404

Không tìm thấy trang! :(
```

## Lưu trữ trên Máy chủ Web Apache

Máy chủ Web Apache tải một tệp cấu hình có tên [`.htaccess`](http://www.htaccess-guide.com/) sửa đổi chức năng của các máy chủ này.

Chỉ cần thêm nội dung sau vào tệp `.htaccess` của bạn.

```apache
ErrorDocument 404 /404.html
```

Với tệp `.htaccess`, bạn có quyền tự do đặt trang lỗi của mình trong một thư mục con.

```apache
ErrorDocument 404 /error_pages/404.html
```

Trong đó đường dẫn là tương đối với tên miền của trang web của bạn.

Thông tin thêm về cấu hình Trang Lỗi Apache có thể được tìm thấy trong [tài liệu chính thức](https://httpd.apache.org/docs/current/mod/core.html#errordocument).

## Lưu trữ trên máy chủ Nginx

Quy trình cũng đơn giản như cấu hình máy chủ Apache, nhưng hơi khác một chút.

Tệp cấu hình nginx phụ thuộc vào hệ thống mà nó được cài đặt. Trong hầu hết các hệ thống, đó là tệp `nginx.conf`, thường nằm trong `/etc/nginx/` hoặc `/etc/nginx/conf/`. Tuy nhiên, trong các hệ thống khác như Ubuntu, bạn sẽ phải tìm tệp cấu hình nginx `default`, chứa thông tin liên quan đến máy chủ, thường nằm trong `/etc/nginx/sites-available/` hoặc `/etc/nginx/sites-enabled/`. Thêm nội dung sau vào tệp cấu hình nginx của bạn, _tức là_ vào tệp `nginx.conf` hoặc vào tệp `default`:

```nginx
server {
  error_page 404 /404.html;
  location = /404.html {
    internal;
  }
}
```

Nếu khối `server` đã tồn tại, chỉ cần thêm mã bên trong khối `server` được đưa ra ở trên.
Chỉ thị `location` ngăn người dùng duyệt trực tiếp trang 404.html.

Thông tin thêm về trang lỗi nginx có thể được tìm thấy trên [tài liệu chính thức nginx](http://nginx.org/en/docs/http/ngx_http_core_module.html#error_page).

<p class="note warning">
  Hãy thận trọng khi chỉnh sửa tệp cấu hình.
</p>
