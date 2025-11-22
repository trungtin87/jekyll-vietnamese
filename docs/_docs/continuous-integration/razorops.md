---
title: "Razorops"
---

[Razorops][razorops-homepage] là một giải pháp CI/CD gốc container hoàn chỉnh xử lý tất cả các khía cạnh của vòng đời phần mềm từ thời điểm một cam kết được tạo cho đến khi nó được triển khai vào sản xuất.
Razorops có tất cả các khả năng mà bạn mong đợi từ một nền tảng CI/CD như

1. Biên dịch/xây dựng mã
2. Đóng gói tạo tác
3. Tự động hóa kiểm tra (đơn vị, tích hợp, chấp nhận, v.v.)
4. Xây dựng nhanh hơn và vận chuyển đến sản xuất

Razorops là một giải pháp duy nhất thực hiện toàn bộ đường ống từ khi bắt đầu đến khi triển khai.

Với [Razorops][razorops-homepage], bạn có thể thiết lập các bước xây dựng, kiểm tra và triển khai dự án trang web Jekyll của mình chỉ trong 15 phút. Nó hỗ trợ các kho lưu trữ [GitHub][github-homepage], [Bitbucket][bitbucket-homepage], và [GitLab][gitlab-homepage]. Hướng dẫn sau đây sẽ chỉ cho bạn cách thiết lập một môi trường miễn phí để xây dựng, kiểm tra và triển khai dự án Jekyll của bạn.

[razorops-homepage]: https://razorops.com/
[github-homepage]: https://github.com
[bitbucket-homepage]: https://bitbucket.org/
[gitlab-homepage]: https://gitlab.com
[deploy-s3]: https://razorops.com/blog/how-to-deploy-a-static-website-to-aws-s3-with-razorops-ci-cd/

## 1. Bắt đầu

1. Đăng nhập tại [https://razorops.com/][razorops-homepage] bằng tài khoản GitHub/Bitbucket hoặc GitLab của bạn
2. Tạo một đường ống, chọn nhà cung cấp Git của bạn và chọn Dự án Jekyll của bạn
3. Thêm tệp .razorops.yaml vào thư mục gốc của dự án của bạn
4. Thêm biến môi trường và việc triển khai của bạn đã sẵn sàng
5. Thêm các bước xây dựng và triển khai như được hiển thị trong bài đăng này [Cách triển khai trang web tĩnh lên AWS S3 với Razorops CI/CD][deploy-s3]

## 2. Cách thức hoạt động

Bất cứ khi nào bạn thực hiện đẩy đến nhánh đã chọn, các bước của bạn sẽ tự động chạy như được xác định trong tệp .razorops.yaml

```yaml
  tasks:
    build-and-deploy:
      steps:
      - checkout
      # commands to build jekyll website
      - commands:
        - bundle install
        - JEKYLL_ENV=production bundle exec jekyll build
      # Commands to upload static pages folder to AWS S3 or ftp
      # Set AWS access key & secrets environment variables under
      # Razorops dashboard project pipelines
      - commands:
        - aws s3 rm s3://$AWS_S3_BUCKET --recursive
        - aws s3 cp _site s3://$AWS_S3_BUCKET --recursive
        if: branch == 'main'

```

 Bước xây dựng tạo thư mục _site theo mặc định của Jekyll và trong quá trình triển khai, bạn sẽ có thể vận chuyển mã đến s3 hoặc bất kỳ máy chủ ftp nào, bạn có thể xác định bất kỳ lệnh nào để vận chuyển mã trang web của mình đến máy chủ.

Razorops MIỄN PHÍ cho các dự án mã nguồn mở, Hãy thử ngay
[https://razorops.com/][razorops-homepage]
