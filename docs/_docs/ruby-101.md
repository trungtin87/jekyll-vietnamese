---
title: Ruby 101
permalink: /docs/ruby-101/
---

Jekyll được viết bằng Ruby. Nếu bạn mới làm quen với Ruby, trang này sẽ giúp bạn tìm hiểu một số thuật ngữ.

## Gems

Gems là mã bạn có thể đưa vào các dự án Ruby. Gems đóng gói chức năng cụ thể. Bạn có thể chia sẻ gems qua nhiều dự án hoặc với những người khác.
Gems có thể thực hiện các hành động như:

* Chuyển đổi một đối tượng Ruby sang JSON
* Phân trang
* Tương tác với các API như GitHub

Jekyll là một gem. Nhiều [plugin]({{ '/docs/plugins/' | relative_url }}) Jekyll cũng là gems, bao gồm
[jekyll-feed](https://github.com/jekyll/jekyll-feed),
[jekyll-seo-tag](https://github.com/jekyll/jekyll-seo-tag) và
[jekyll-archives](https://github.com/jekyll/jekyll-archives).

## Gemfile

Một `Gemfile` là danh sách các gems được sử dụng bởi trang web của bạn. Mọi trang web Jekyll đều có một Gemfile trong thư mục chính.

Đối với một trang web Jekyll đơn giản, nó có thể trông giống như thế này:

```ruby
source "https://rubygems.org"

gem "jekyll"

group :jekyll_plugins do
  gem "jekyll-feed"
  gem "jekyll-seo-tag"
end
```

## Bundler

[Bundler](https://rubygems.org/gems/bundler) là một gem cài đặt tất cả các gems trong `Gemfile` của bạn.

Mặc dù bạn không bắt buộc phải sử dụng `Gemfile` và `bundler`, nhưng nó rất được khuyến khích vì nó đảm bảo bạn đang chạy cùng một phiên bản Jekyll và các plugin của nó trên các môi trường khác nhau.

Cài đặt Bundler bằng cách sử dụng `gem install bundler`. Bạn chỉ cần cài đặt nó một lần, không phải mỗi lần bạn tạo một dự án Jekyll mới.

Để cài đặt các gems trong Gemfile của bạn bằng Bundler, hãy chạy lệnh sau trong thư mục có Gemfile:

```
bundle install
bundle exec jekyll serve
```

Để bỏ qua Bundler nếu bạn không sử dụng Gemfile, hãy chạy `jekyll serve`.

Xem [Sử dụng Jekyll với Bundler](/tutorials/using-jekyll-with-bundler/) để biết thêm thông tin về Bundler trong Jekyll và hướng dẫn để bắt đầu nhanh chóng.
