---
title: "Buddy"
---

[Buddy][buddy-homepage] là một máy chủ CI dựa trên [Docker][docker-homepage] mà bạn có thể thiết lập trong 15-20 phút để xây dựng, kiểm tra và triển khai các trang web Jekyll của mình. Nó hỗ trợ các kho lưu trữ [GitHub][github-homepage], [Bitbucket][bitbucket-homepage], và [GitLab][gitlab-homepage], và có thể được cài đặt tại chỗ hoặc sử dụng trên đám mây. Hướng dẫn sau đây sẽ chỉ cho bạn cách thiết lập một môi trường miễn phí để xây dựng và kiểm tra dự án Jekyll của bạn.

[buddy-homepage]: https://buddy.works
[docker-homepage]: https://www.docker.com/
[github-homepage]: https://github.com
[bitbucket-homepage]: https://bitbucket.org/
[gitlab-homepage]: https://gitlab.com

## 1. Bắt đầu

1. Đăng nhập tại [https://buddy.works][buddy-homepage] bằng tài khoản GitHub/Bitbucket hoặc email của bạn
2. Chọn nhà cung cấp Git của bạn và chọn hoặc đẩy Dự án Jekyll của bạn
3. Tạo một đường ống mới và đặt chế độ kích hoạt thành 'On every push' (Mỗi khi đẩy)
4. Thêm và cấu hình hành động Jekyll và lưu đường ống

## 2. Cách thức hoạt động

Bất cứ khi nào bạn thực hiện đẩy đến nhánh đã chọn, hành động Jekyll sẽ chạy `jekyll build` trong một [hình ảnh Docker Jekyll][jekyll-docker-image] bị cô lập. Đầu ra được tạo ra trong thư mục `/filesystem`, và có thể được triển khai thêm đến các dịch vụ FTP/SFTP và IaaS. Bạn có thể thêm các lệnh của riêng mình, cài đặt các gói bổ sung, đính kèm các dịch vụ và chạy các bài kiểm tra Selenium, cũng như thêm các hành động khác vào đường ống, ví dụ: thông báo Slack hoặc tập lệnh SSH sẽ khởi động lại máy chủ của bạn.

[jekyll-docker-image]: https://hub.docker.com/r/jekyll/jekyll/

## 3. Sử dụng YAML để cấu hình

Nếu bạn thích cấu hình dưới dạng mã hơn là GUI, bạn có thể tạo một `buddy.yml` sẽ tạo một đường ống với hành động Jekyll sau khi bạn đẩy nó đến nhánh đích:

```yaml
- pipeline: "Build and Deploy Jekyll site"
  trigger_mode: "ON_EVERY_PUSH"
  ref_name: "master"
  actions:
  - action: "Execute: jekyll build"
    type: "BUILD"
    docker_image_name: "jekyll/jekyll"
    docker_image_tag: "latest"
    execute_commands:
    - "chown jekyll:jekyll $WORKING_DIR"
    - "jekyll build"
```

## 4. Thiết lập máy chủ tại chỗ

Phiên bản tự lưu trữ của Buddy có thể được cài đặt trên bất kỳ loại máy chủ nào hỗ trợ Docker, bao gồm [Linux][bw-linux], [Mac][bw-mac], [AWS EC2][bw-aws-ec2], [DigitalOcean][bw-digitalocean], và [Microsoft Azure][bw-azure].

[bw-linux]: https://buddy.works/knowledge/standalone/installation-linux
[bw-mac]: https://buddy.works/knowledge/standalone/installation-mac-osx
[bw-aws-ec2]: https://buddy.works/knowledge/standalone/installation-amazon-ec2
[bw-digitalocean]: https://buddy.works/knowledge/standalone/installation-digitalocean
[bw-azure]: https://buddy.works/knowledge/standalone/installation-azure

## 5. Câu hỏi?

Toàn bộ hướng dẫn này là mã nguồn mở. Hãy tiếp tục và [chỉnh sửa nó][jekyll-docs-ci-buddy] nếu bạn muốn mở rộng nó hoặc có bản sửa lỗi hoặc [yêu cầu trợ giúp][jekyll-help] nếu bạn gặp sự cố và cần hỗ trợ. Buddy cũng có một [cộng đồng trực tuyến][buddy-forum] để trợ giúp.

[jekyll-docs-ci-buddy]: https://github.com/jekyll/jekyll/edit/master/docs/_docs/continuous-integration/buddyworks.md
[jekyll-help]: https://jekyllrb.com/help/
[buddy-forum]: https://forum.buddy.works/
