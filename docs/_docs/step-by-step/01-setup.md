---
layout: step
title: Thiết lập
menu_name: Hướng dẫn từng bước
position: 1
redirect_from:
- /docs/step-by-step/
---
Chào mừng bạn đến với hướng dẫn từng bước của Jekyll. Hướng dẫn này đưa bạn từ việc có một chút kinh nghiệm phát triển web front-end đến việc xây dựng trang web Jekyll đầu tiên của bạn từ đầu mà không dựa vào chủ đề dựa trên gem mặc định.

## Cài đặt

Jekyll là một Ruby gem. Đầu tiên, hãy cài đặt Ruby trên máy của bạn.
Đi đến [Cài đặt]({{ '/docs/installation/' | relative_url }}) và làm theo hướng dẫn cho hệ điều hành của bạn.

Với Ruby đã được cài đặt, hãy cài đặt Jekyll từ thiết bị đầu cuối:

```sh
gem install jekyll bundler
```

Tạo một `Gemfile` mới để liệt kê các phụ thuộc của dự án của bạn:

```sh
bundle init
```

Chỉnh sửa `Gemfile` trong trình soạn thảo văn bản và thêm jekyll làm phụ thuộc:

```ruby
gem "jekyll"
```

Chạy `bundle` để cài đặt jekyll cho dự án của bạn.

Bây giờ bạn có thể thêm tiền tố cho tất cả các lệnh jekyll được liệt kê trong hướng dẫn này bằng `bundle exec` để đảm bảo bạn sử dụng phiên bản jekyll được xác định trong `Gemfile` của mình.

## Tạo một trang web

Đã đến lúc tạo một trang web! Tạo một thư mục mới cho trang web của bạn và đặt tên cho nó bất cứ điều gì bạn muốn. Trong phần còn lại của hướng dẫn này, chúng tôi sẽ gọi thư mục này là **root**.

Bạn cũng có thể khởi tạo kho lưu trữ Git tại đây.

Một trong những điều tuyệt vời về Jekyll là không có cơ sở dữ liệu. Tất cả nội dung và cấu trúc trang web là các tệp mà kho lưu trữ Git có thể tạo phiên bản. Sử dụng kho lưu trữ là tùy chọn nhưng được khuyến khích. Bạn có thể tìm hiểu thêm về cách sử dụng Git bằng cách đọc [Sổ tay Git](https://guides.github.com/introduction/git-handbook/).

Hãy thêm tệp đầu tiên của bạn. Tạo `index.html` trong **root** với nội dung sau:

```html
<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8">
    <title>Home</title>
  </head>
  <body>
    <h1>Hello World!</h1>
  </body>
</html>
```

## Xây dựng

Vì Jekyll là một trình tạo trang tĩnh, nó phải xây dựng trang web trước khi chúng ta có thể xem nó. Chạy một trong các lệnh sau để xây dựng trang web của bạn:

* `jekyll build` - Xây dựng trang web và xuất trang web tĩnh sang một thư mục có tên `_site`.
* `jekyll serve` - Thực hiện `jekyll build` và chạy nó trên máy chủ web cục bộ tại `http://localhost:4000`, xây dựng lại trang web bất cứ khi nào bạn thực hiện thay đổi.

{: .note .info}
Khi bạn đang phát triển một trang web, hãy sử dụng `jekyll serve`. Để buộc trình duyệt làm mới với mỗi thay đổi, hãy sử dụng `jekyll serve --livereload`.
Nếu có xung đột hoặc bạn muốn Jekyll phục vụ trang web phát triển của mình tại một URL khác, hãy sử dụng các đối số `--host` và `--port`, như được mô tả trong [tùy chọn lệnh serve]({{ '/docs/configuration/options/#serve-command-options' | relative_url }}).

{: .note .warning}
Phiên bản của trang web mà `jekyll serve` xây dựng trong `_site` không phù hợp để triển khai. Các liên kết và URL nội dung trong các trang web được tạo bằng `jekyll serve` sẽ sử dụng `https://localhost:4000` hoặc giá trị được đặt bằng cấu hình dòng lệnh, thay vì các giá trị được đặt trong [tệp cấu hình trang web của bạn]({{ '/docs/configuration/' | relative_url }}). Để tìm hiểu về cách xây dựng trang web của bạn khi nó sẵn sàng để triển khai, hãy đọc phần [Triển khai]({{ '/docs/step-by-step/10-deployment/' | relative_url }}) của hướng dẫn này.

Chạy `jekyll serve` và đi đến <a href="http://localhost:4000" target="_blank" data-proofer-ignore>http://localhost:4000</a> trong trình duyệt của bạn. Bạn sẽ thấy "Hello World!".

Tại thời điểm này, bạn có thể đang nghĩ, "Vậy thì sao?". Điều duy nhất xảy ra là Jekyll đã sao chép một tệp HTML từ nơi này sang nơi khác.

Kiên nhẫn, châu chấu trẻ, vẫn còn nhiều điều để học!

Tiếp theo. bạn sẽ tìm hiểu về Liquid và tạo mẫu.
