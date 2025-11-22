---
title: Plugins
permalink: /docs/plugins/installation/
---

Jekyll có hỗ trợ tích hợp cho việc sử dụng các plugin để mở rộng chức năng cốt lõi.

Về cơ bản, bất kỳ tệp nào có phần mở rộng `.rb` được đặt trong thư mục `_plugins` tại gốc của `source` trang web, sẽ được tự động tải
trong một phiên xây dựng.

Hành vi này có thể được cấu hình như sau:

- Thư mục `_plugins` có thể được thay đổi trực tiếp thông qua dòng lệnh hoặc thông qua (các) tệp cấu hình.
- Các plugin trong thư mục `_plugins` (hoặc tương đương) sẽ không được tải khi Jekyll đang chạy ở chế độ `safe`.
- Tuyến đường này không thể được sử dụng để mở rộng Jekyll CLI.

Để làm việc với các plugin được đóng gói dưới dạng gem, người ta phải liệt kê các gem mong muốn trong tệp cấu hình dưới một khóa cấp cao nhất có tên `plugins`.
Ngoài ra, nếu bạn đang xây dựng ở chế độ `safe`, gem cần được liệt kê dưới một khóa cấp cao nhất có tên `whitelist`. Ví dụ:

```yaml
plugins:
  - jekyll-gist
  - jekyll-coffeescript
  - jekyll-seo-tag
  - some-other-jekyll-plugin

# Enable safe mode
safe: true

# Whitelist plugins under safe mode.
# Note that `some-other-jekyll-plugin` is not listed here. Therefore,
# it will not be loaded under safe mode.
whitelist:
  - jekyll-gist
  - jekyll-coffeescript
  - jekyll-seo-tag
```

Trong trường hợp không có Gemfile, người ta phải đảm bảo thủ công rằng các plugin được liệt kê đã được cài đặt trước khi gọi Jekyll. Ví dụ, các
phiên bản mới nhất của các gem trong danh sách trên có thể được cài đặt vào một vị trí toàn hệ thống bằng cách chạy:

```sh
gem install jekyll-gist jekyll-coffeescript jekyll-remote-theme some-other-jekyll-plugin
```

## Sử dụng Gemfile

Việc bảo trì các phụ thuộc gem khác nhau có thể được đơn giản hóa rất nhiều bằng cách sử dụng Gemfile (thường ở gốc của nguồn trang web) kết hợp
với một Rubygem có tên `bundler`. Tuy nhiên, Gemfile **nên** liệt kê tất cả các phụ thuộc chính của trang web của bạn, bao gồm cả Jekyll,
không chỉ các plugin dựa trên gem của trang web vì Bundler thu hẹp phạm vi của các gem đã cài đặt thành chỉ các *phụ thuộc thời gian chạy* được giải quyết bằng cách
đánh giá Gemfile. Ví dụ:

```ruby
source "https://rubygems.org"

# Use the latest version.
gem "jekyll"

# The theme of current site, locked to a certain version.
gem "minima", "2.4.1"

# Plugins of this site loaded during a build with proper
# site configuration.
gem "jekyll-gist"
gem "jekyll-coffeescript"
gem "jekyll-seo-tag", "~> 1.5"
gem "some-other-jekyll-plugin"

# A dependency of a custom-plugin inside `_plugins` directory.
gem "nokogiri", "~> 1.11"
```

Các gem được liệt kê trong Gemfile có thể được cài đặt tập thể bằng cách đơn giản chạy `bundle install`.

### Nhóm Gemfile `:jekyll_plugins`

{: #the-jekyll_plugins-group}

Jekyll dành sự đối xử đặc biệt cho các gem được liệt kê là một phần của nhóm `:jekyll_plugins` trong Gemfile. Bất kỳ gem nào thuộc nhóm này đều được tải tại
ngay khi bắt đầu bất kỳ quy trình Jekyll nào, bất kể cờ CLI `--safe` hoặc các mục trong (các) tệp cấu hình.

Trong khi tuyến đường này cho phép người ta nâng cao Jekyll CLI với các lệnh con và tùy chọn bổ sung, hoặc tránh phải liệt kê các gem trong tệp cấu hình,
nhược điểm là sự cần thiết phải lưu ý đến những gem nào được bao gồm trong nhóm. Ví dụ:

```ruby
source "https://rubygems.org"

# Use the latest version.
gem "jekyll"

# The theme of current site, locked to a certain version.
gem "minima", "2.4.1"

# Plugins of this site loaded only if configured correctly.
gem "jekyll-gist"
gem "jekyll-coffeescript"

# Gems loaded irrespective of site configuration.
group :jekyll_plugins do
  gem "jekyll-cli-plus"
  gem "jekyll-seo-tag", "~> 1.5"
  gem "some-other-jekyll-plugin"
end
```

<div class="note info">
  <h5>Plugins trên GitHub Pages</h5>
  <p>
    <a href="https://pages.github.com/">GitHub Pages</a> được cung cấp bởi Jekyll. Tất cả các trang web GitHub Pages được tạo bằng cách sử dụng tùy chọn
    <code>--safe</code> để vô hiệu hóa các plugin (ngoại trừ một số
    <a href="https://pages.github.com/versions">plugin được đưa vào danh sách trắng</a>) vì lý do bảo mật. Thật không may, điều này có nghĩa là các plugin của bạn sẽ không
    hoạt động nếu bạn đang triển khai qua GitHub Pages.<br><br>
    Bạn vẫn có thể sử dụng GitHub Pages để xuất bản trang web của mình, nhưng bạn sẽ cần phải xây dựng trang web cục bộ và đẩy các tệp đã tạo đến
    kho lưu trữ GitHub của bạn hoặc sử dụng
    <a href="{{ '/docs/continuous-integration/github-actions/' | relative_url }}" title="GitHub Actions">GitHub Actions</a> để lưu trữ các tệp nguồn
    trên GitHub nhưng xây dựng và triển khai với toàn quyền kiểm soát trên GitHub Pages.
  </p>
</div>

<div class="note">
  <h5>
    <code>_plugins</code>, <code>_config.yml</code> và <code>Gemfile</code> có thể được sử dụng đồng thời
  </h5>
  <p>
    Bạn có thể sử dụng bất kỳ tuyến đường plugin nào đã nói ở trên đồng thời trong cùng một trang web nếu bạn chọn.
    Việc sử dụng một cái không hạn chế việc sử dụng những cái khác.
  </p>
</div>
