---
title: Triển khai Thủ công (Manual Deployment)
permalink: /docs/deployment/manual/
---

Jekyll tạo trang web tĩnh của bạn vào thư mục `_site` theo mặc định. Bạn có thể
chuyển nội dung của thư mục này đến hầu hết mọi nhà cung cấp dịch vụ lưu trữ để đưa
trang web của bạn hoạt động. Dưới đây là một số cách thủ công để đạt được điều này:

## rsync

Rsync tương tự như scp ngoại trừ việc nó có thể nhanh hơn vì nó sẽ chỉ gửi các phần
đã thay đổi của tệp thay vì toàn bộ tệp. Bạn có thể tìm hiểu thêm về cách sử dụng
rsync trong [hướng dẫn Digital Ocean](https://www.digitalocean.com/community/tutorials/how-to-use-rsync-to-sync-local-and-remote-directories-on-a-vps).

## Amazon S3

Nếu bạn muốn lưu trữ trang web của mình trong Amazon S3, bạn có thể làm như vậy bằng cách
sử dụng ứng dụng khách AWS cli và đẩy thư mục `_site` đã hiển thị của bạn trực tiếp đến
nhóm S3 của bạn.

`aws s3 sync _site s3://<YOUR DOMAIN>.com --size-only --storage-class REDUCED_REDUNDANCY`

## FTP

Hầu hết các nhà cung cấp dịch vụ lưu trữ web truyền thống cho phép bạn tải tệp lên máy chủ của họ qua FTP. Để tải một trang web Jekyll lên máy chủ web bằng FTP, hãy chạy lệnh `jekyll build` và sao chép nội dung của thư mục `_site` đã tạo vào thư mục gốc của tài khoản lưu trữ của bạn. Đây rất có thể là thư mục `httpdocs` hoặc `public_html` trên hầu hết các nhà cung cấp dịch vụ lưu trữ.

## scp

Nếu bạn có quyền truy cập trực tiếp vào máy chủ web triển khai, quy trình về cơ bản là giống nhau, ngoại trừ việc bạn có thể có các phương pháp khác có sẵn cho mình (chẳng hạn như `scp`, hoặc thậm chí truy cập hệ thống tệp trực tiếp) để chuyển các tệp. Hãy nhớ đảm bảo nội dung của thư mục `_site` đã tạo được đặt vào thư mục gốc web thích hợp cho máy chủ web của bạn.

## Rack-Jekyll

[Rack-Jekyll](https://github.com/adaoraul/rack-jekyll/) cho phép bạn triển khai trang web của mình trên bất kỳ máy chủ Rack nào như Amazon EC2, Slicehost, Heroku, v.v. Nó cũng có thể chạy với [shotgun](https://github.com/rtomayko/shotgun/), [rackup](https://github.com/rack/rack), [mongrel](https://github.com/mongrel/mongrel), [unicorn](https://github.com/defunkt/unicorn/), và [những cái khác](https://github.com/adaoraul/rack-jekyll#readme).
