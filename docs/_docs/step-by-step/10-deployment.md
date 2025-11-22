---
layout: step
title: Triển khai
position: 10
---
Trong bước cuối cùng này, chúng tôi sẽ chuẩn bị trang web sẵn sàng cho sản xuất.

## Gemfile

Thực hành tốt là có một [Gemfile](/docs/ruby-101/#gemfile) cho trang web của bạn. Điều này đảm bảo phiên bản của Jekyll và các gem khác vẫn nhất quán trên các môi trường khác nhau.

Nếu bạn đã hoàn thành bước một trong hướng dẫn này, bạn đã tạo một Gemfile. Nếu bạn đã bỏ qua bước một, hãy tạo một `Gemfile` trong thư mục gốc.
Tệp nên được gọi là 'Gemfile' và *không* nên có bất kỳ phần mở rộng nào.
Bạn có thể tạo một Gemfile bằng Bundler và sau đó thêm gem `jekyll`:

```sh
bundle init
bundle add jekyll
```

`Gemfile` của bạn sẽ trông giống như:

```ruby
# frozen_string_literal: true
source "https://rubygems.org"

gem "jekyll"
```

Bundler cài đặt các gem và tạo một `Gemfile.lock` khóa các phiên bản gem hiện tại cho một `bundle install` trong tương lai. Nếu bạn muốn cập nhật các phiên bản gem của mình, bạn có thể chạy `bundle update`.

Khi sử dụng một `Gemfile`, bạn sẽ chạy các lệnh như `jekyll serve` với `bundle exec` được thêm vào trước. Vì vậy, lệnh đầy đủ là:

```sh
bundle exec jekyll serve
```

Điều này hạn chế môi trường Ruby của bạn chỉ sử dụng các gem được đặt trong `Gemfile` của bạn.

Lưu ý: nếu xuất bản trang web của bạn với GitHub Pages, bạn có thể khớp phiên bản sản xuất của Jekyll bằng cách sử dụng gem `github-pages` thay vì `jekyll` trong `Gemfile` của bạn. Trong kịch bản này, bạn cũng có thể muốn loại trừ `Gemfile.lock` khỏi kho lưu trữ của mình vì GitHub Pages bỏ qua tệp đó.

## Plugin

Các plugin Jekyll cho phép bạn tạo nội dung được tạo tùy chỉnh cụ thể cho trang web của bạn. Có nhiều [plugin](/docs/plugins/) có sẵn hoặc bạn thậm chí có thể viết plugin của riêng mình.

Có ba plugin chính thức hữu ích trên hầu hết mọi trang web Jekyll:

* [jekyll-sitemap](https://github.com/jekyll/jekyll-sitemap) - Tạo tệp sơ đồ trang web để giúp các công cụ tìm kiếm lập chỉ mục nội dung
* [jekyll-feed](https://github.com/jekyll/jekyll-feed) - Tạo nguồn cấp dữ liệu RSS cho các bài đăng của bạn
* [jekyll-seo-tag](https://github.com/jekyll/jekyll-seo-tag) - Thêm các thẻ meta để giúp SEO

Để sử dụng những thứ này trước tiên bạn cần thêm chúng vào `Gemfile` của mình. Nếu bạn đặt chúng trong một nhóm `jekyll_plugins`, chúng sẽ tự động được yêu cầu vào Jekyll:

```ruby
source 'https://rubygems.org'

gem "jekyll"

group :jekyll_plugins do
  gem "jekyll-sitemap"
  gem "jekyll-feed"
  gem "jekyll-seo-tag"
end
```

Sau đó thêm các dòng này vào `_config.yml` của bạn:

```yaml
plugins:
  - jekyll-feed
  - jekyll-sitemap
  - jekyll-seo-tag
```

Bây giờ hãy cài đặt chúng bằng cách chạy `bundle update`.

`jekyll-sitemap` không cần bất kỳ thiết lập nào, nó sẽ tạo sơ đồ trang web của bạn khi xây dựng.

Đối với `jekyll-feed` và `jekyll-seo-tag`, bạn cần thêm các thẻ vào `_layouts/default.html`:

{% raw %}

```liquid
<!doctype html>
<html>
  <head>
    <meta charset="utf-8">
    <title>{{ page.title }}</title>
    <link rel="stylesheet" href="/assets/css/styles.css">
    {% feed_meta %}
    {% seo %}
  </head>
  <body>
    {% include navigation.html %}
    {{ content }}
  </body>
</html>
```

{% endraw %}

Khởi động lại máy chủ Jekyll của bạn và kiểm tra các thẻ này được thêm vào `<head>`.

## Môi trường

Đôi khi bạn có thể muốn xuất một cái gì đó trong sản xuất nhưng không phải trong phát triển. Các tập lệnh phân tích là ví dụ phổ biến nhất về điều này.

Để làm điều này, bạn có thể sử dụng [môi trường](/docs/configuration/environments/). Bạn có thể đặt môi trường bằng cách sử dụng biến môi trường `JEKYLL_ENV` khi chạy một lệnh. Ví dụ:

```sh
JEKYLL_ENV=production bundle exec jekyll build
```

Theo mặc định `JEKYLL_ENV` là development. `JEKYLL_ENV` có sẵn cho bạn trong liquid bằng cách sử dụng `jekyll.environment`. Vì vậy, để chỉ xuất tập lệnh phân tích trên sản xuất, bạn sẽ làm như sau:

{% raw %}

```liquid
{% if jekyll.environment == "production" %}
  <script src="my-analytics-script.js"></script>
{% endif %}
```

{% endraw %}

## Triển khai

Bước cuối cùng là đưa trang web lên máy chủ sản xuất. Cách cơ bản nhất để làm điều này là chạy bản dựng sản xuất:

```sh
JEKYLL_ENV=production bundle exec jekyll build
```

Và sau đó sao chép nội dung của `_site` vào máy chủ của bạn.

<div class="note warning">
  <h5>Thư mục đích được làm sạch khi xây dựng trang web</h5>
  <p>
    Nội dung của <code>_site</code> được tự động làm sạch, theo mặc định, khi trang web được xây dựng. Các tệp hoặc thư mục không được tạo bởi quy trình xây dựng trang web của bạn sẽ bị xóa.
  </p>
  <p>
    Một số tệp có thể được giữ lại bằng cách chỉ định chúng trong chỉ thị cấu hình <code>keep_files</code>. Các tệp khác có thể được giữ lại bằng cách giữ chúng trong thư mục tài sản của bạn.
  </p>
</div>

Một cách tốt hơn là tự động hóa quy trình này bằng cách sử dụng [CI](/docs/deployment/automated/) hoặc [bên thứ 3](/docs/deployment/third-party/).

## Tổng kết

Điều đó đưa chúng ta đến cuối hướng dẫn từng bước này và bắt đầu hành trình Jekyll của bạn!

* Hãy đến chào hỏi tại [diễn đàn cộng đồng](https://talk.jekyllrb.com)
* Giúp chúng tôi làm cho Jekyll tốt hơn bằng cách [đóng góp](/docs/contributing/)
* Tiếp tục xây dựng các trang web Jekyll!
