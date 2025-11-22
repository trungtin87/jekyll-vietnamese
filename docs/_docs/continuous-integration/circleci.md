---
title: "CircleCI"
---

Việc xây dựng, kiểm tra và triển khai trang web do Jekyll tạo ra của bạn có thể được thực hiện nhanh chóng với [CircleCI][0], một công cụ tích hợp & phân phối liên tục. CircleCI hỗ trợ [GitHub][1] và [Bitbucket][2], và bạn có thể bắt đầu miễn phí bằng cách sử dụng kho lưu trữ mã nguồn mở hoặc riêng tư.

[0]: https://circleci.com/
[1]: https://github.com/
[2]: https://bitbucket.org/

## 1. Theo dõi Dự án của bạn trên CircleCI

Để bắt đầu xây dựng dự án của bạn trên CircleCI, tất cả những gì bạn cần làm là 'theo dõi' dự án của mình từ trang web của CircleCI:

1. Truy cập trang 'Add Projects' (Thêm Dự án)
1. Từ tab GitHub hoặc Bitbucket ở bên trái, chọn một người dùng hoặc tổ chức.
1. Tìm dự án của bạn trong danh sách và nhấp vào 'Build project' (Xây dựng dự án) ở bên phải.
1. Bản dựng đầu tiên sẽ tự khởi động. Bạn có thể bắt đầu cho CircleCI biết cách xây dựng dự án của mình bằng cách tạo tệp [.circleci/config.yml][3] trong thư mục gốc của kho lưu trữ của bạn.

[3]: https://circleci.com/docs/2.0/configuration-reference/

## 2. Các phụ thuộc

Cách dễ nhất để quản lý các phụ thuộc cho một dự án Jekyll (có hoặc không có CircleCI) là thông qua một [Gemfile][4]. Bạn sẽ muốn có Jekyll, bất kỳ plugin Jekyll nào, [HTML Proofer](#html-proofer), và bất kỳ gem nào khác mà bạn đang sử dụng trong `Gemfile`. Đừng quên tạo phiên bản `Gemfile.lock` nữa. Dưới đây là một ví dụ `Gemfile`:

[4]: http://bundler.io/gemfile.html

```ruby
source 'https://rubygems.org'

ruby '2.7.4'

gem "jekyll"
gem "html-proofer"
```

```yaml
    - step:
       run: bundle install
```

## 3. Kiểm tra

Bài kiểm tra cơ bản nhất có thể chạy là xem liệu `jekyll build` có thực sự hoạt động hay không. Đây là một trình chặn, một phụ thuộc nếu bạn muốn, cho các bài kiểm tra khác mà bạn có thể chạy trên trang web đã tạo. Vì vậy, chúng tôi sẽ chạy Jekyll, thông qua Bundler, trong giai đoạn `dependencies`.

```yaml
    - step:
        run: bundle exec jekyll build
```

### HTML Proofer

Với trang web của bạn đã được xây dựng, thật hữu ích khi chạy các bài kiểm tra để kiểm tra HTML hợp lệ, các liên kết bị hỏng, v.v. Có một vài công cụ ngoài kia nhưng [HTML Proofer][5] phổ biến trong số những người dùng Jekyll. Chúng tôi sẽ chạy nó trong giai đoạn `test` với một vài cờ ưa thích. Kiểm tra [README][6] của `html-proofer` để biết tất cả các cờ có sẵn, hoặc chạy `htmlproofer --help` cục bộ.

[5]: https://github.com/gjtorikian/html-proofer
[6]: https://github.com/gjtorikian/html-proofer/blob/master/README.md#configuration

```yaml
    - step:
        run: bundle exec htmlproofer ./_site --check-html --disable-external
```

## Ví dụ hoàn chỉnh về tệp .circleci/config.yml

Ví dụ `.circleci/config.yml` dưới đây minh họa cách
triển khai dự án Jekyll của bạn lên AWS. Để điều này hoạt động, trước tiên bạn sẽ phải đặt
[biến môi trường](https://circleci.com/docs/2.0/env-vars/) `S3_BUCKET_NAME`.

```yaml
workflows:
  test-deploy:
    jobs:
      - build
      - deploy:
          requires:
            - build
          filters:
            branches:
              only: master
version: 2.1
jobs:
  build:
    docker:
      - image: cimg/ruby:2.7.4
    environment:
      BUNDLE_PATH: ~/repo/vendor/bundle
    steps:
      - checkout
      - restore_cache:
          keys:
            - rubygems-v1-{% raw %}{{ checksum "Gemfile.lock" }}{% endraw %}
            - rubygems-v1-fallback
      - run:
          name: Bundle Install
          command: bundle check || bundle install
      - save_cache:
          key: rubygems-v1-{% raw %}{{ checksum "Gemfile.lock" }}{% endraw %}
          paths:
            - vendor/bundle
      - run:
          name: Jekyll build
          command: bundle exec jekyll build
      - run:
          name: HTMLProofer tests
          command: |
            bundle exec htmlproofer ./_site \
              --allow-hash-href \
              --check-favicon  \
              --check-html \
              --disable-external
      - persist_to_workspace:
          root: ./
          paths:
            - _site
  deploy:
    docker:
      - image: cimg/python:3.9.1
    environment:
      S3_BUCKET_NAME: <<YOUR BUCKET NAME HERE>>
    steps:
      - attach_workspace:
          at: ./
      - run:
          name: Install AWS CLI
          command: pip install awscli --upgrade --user
      - run:
          name: Upload to s3
          command: ~/.local/bin/aws s3 sync ./_site s3://$S3_BUCKET_NAME/ --delete --acl public-read
```

## Câu hỏi?

Toàn bộ hướng dẫn này là mã nguồn mở. Hãy tiếp tục và [chỉnh sửa nó][7] nếu bạn có bản sửa lỗi hoặc [yêu cầu trợ giúp][8] nếu bạn gặp sự cố và cần một số trợ giúp. CircleCI cũng có một [cộng đồng trực tuyến][9] để trợ giúp.

[7]: https://github.com/jekyll/jekyll/edit/master/docs/_docs/continuous-integration/circleci.md
[8]: https://jekyllrb.com/help/
[9]: https://discuss.circleci.com
