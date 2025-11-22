---
title: GitHub Actions
---

Khi xây dựng một trang web Jekyll với GitHub Pages, Jekyll chạy trong một môi trường bị hạn chế vì lý do
bảo mật, nhưng chứa nhiều [plugin và chủ đề được đưa vào danh sách trắng][ghp-whitelist] để làm cho việc
thiết lập một trang web trở nên đơn giản hơn.

Giải pháp duy nhất để có quyền kiểm soát môi trường xây dựng và gemset nhưng vẫn sử dụng GitHub Pages để
lưu trữ trang web trước đây là xây dựng ở nơi khác và đẩy nội dung thư mục đã xây dựng đến nhánh
`gh-pages` trên kho lưu trữ của bạn.

Tuy nhiên, GitHub hiện cung cấp cho bạn tùy chọn sử dụng sản phẩm CI/CD nội bộ của họ có tên là
*GitHub Actions* để *xây dựng và triển khai (lưu trữ)* trang web Jekyll của bạn với quyền kiểm soát hoàn toàn đối với môi trường
xây dựng và gemset.

## Ưu điểm của việc sử dụng Actions

### Kiểm soát gemset

- **Phiên bản Jekyll** --- Thay vì sử dụng phiên bản do GitHub Pages cung cấp cổ điển được chỉ định trong
  danh sách [Phiên bản phụ thuộc][ghp-whitelist], bạn có thể sử dụng bất kỳ phiên bản Jekyll nào bạn muốn.
  Ví dụ `{{ site.version }}`, hoặc trỏ trực tiếp đến kho lưu trữ thông qua Gemfile.
- **Plugin** --- Bạn có thể sử dụng bất kỳ plugin Jekyll nào bất kể chúng có được GitHub đưa vào danh sách trắng hay không,
  bao gồm bất kỳ tệp `*.rb` nào được đặt trong thư mục `_plugins` của trang web của bạn.
- **Chủ đề** --- Mặc dù việc sử dụng chủ đề tùy chỉnh là có thể mà không cần Actions, nhưng giờ đây có thể sử dụng
  các chủ đề phụ thuộc vào các tính năng được giới thiệu trong các phiên bản mới hơn của Jekyll.

{: .note .info}
Nếu bạn đang di chuyển từ luồng cổ điển nhưng muốn tiếp tục sử dụng chủ đề được lưu trữ trên GitHub, bạn có thể sử dụng
plugin [jekyll-remote-theme][remote-theme], thêm bất kỳ phụ thuộc cần thiết nào của chủ đề của bạn
(trước đây được đóng gói theo mặc định) vào `_config.yml` và `Gemfile` của bạn và đặt
slug kho lưu trữ chủ đề `remote_theme: <owner>/<repo_name>` một cách chính xác trong `_config.yml` của bạn.

### Quản lý Quy trình làm việc

- **Tùy chỉnh** --- Bằng cách tạo một tệp quy trình làm việc để chạy Actions, bạn có thể chỉ định các bước xây dựng
  tùy chỉnh, sử dụng các biến môi trường.
- **Ghi nhật ký** --- Nhật ký xây dựng có thể nhìn thấy và có thể được điều chỉnh để chi tiết, vì vậy việc gỡ lỗi
  các lỗi bằng Actions dễ dàng hơn nhiều.
- **Bộ nhớ đệm** --- Hành động `ruby/setup-ruby` giúp có thể tự động lưu trữ các gem đã cài đặt
  thay vì phải tải xuống gói trên mỗi bản dựng.

## Thiết lập không gian làm việc

Yêu cầu đầu tiên và quan trọng nhất là một dự án Jekyll được lưu trữ tại GitHub. Chọn một dự án Jekyll
hiện có hoặc làm theo [hướng dẫn nhanh]({{ '/docs/' | relative_url }}) và đẩy kho lưu trữ lên GitHub
nếu nó chưa được lưu trữ ở đó.

Trang web Jekyll chúng ta sẽ sử dụng cho phần còn lại của trang này, ban đầu chỉ bao gồm một `_config.yml`,
một trang `index.md` và một `Gemfile`. Nội dung lần lượt là:

```yaml
# _config.yml

title: "Jekyll Actions Demo"
```

{% raw %}

```liquid
---
---

Welcome to My Home Page

{% assign date = '2020-04-13T10:20:00Z' %}

- Original date - {{ date }}
- With timeago filter - {{ date | timeago }}
```

{% endraw %}

```ruby
# Gemfile

source 'https://rubygems.org'

gem "jekyll", "~> 4.2"

group :jekyll_plugins do
  gem "jekyll-timeago", "~> 0.13.1"
end
```

{: .note .info}
Trang web demo sử dụng Jekyll 4 và một [plugin của bên thứ ba][timeago-plugin], cả hai hiện tại
không được đưa vào danh sách trắng để sử dụng trên GitHub pages. Plugin sẽ cho phép chúng ta mô tả một ngày
cách ngày hôm nay bao xa. ví dụ: Nếu chúng ta đưa ra một ngày là `2016-03-23T10:20:00Z` và ngày hiện tại là
`2020-04-13T10:20:00Z`, thì đầu ra sẽ là `4 years and 3 weeks ago`.

{: .note .info}
Hành động chúng ta đang sử dụng sẽ lo việc cài đặt các Ruby gem và các phụ thuộc. Mặc dù điều đó giữ cho
việc thiết lập đơn giản cho người dùng, nhưng người ta có thể gặp sự cố nếu họ cũng check-in `Gemfile.lock` nếu nó
được tạo bằng phiên bản Bundler cũ.

### Thiết lập Action

1. Đi tới tab **Settings** trên kho lưu trữ của bạn.
    1. Nhấp vào **Pages** dưới **Code and automation**.
    2. Thay đổi **Source** dưới **Build and deployment** từ **Deploy from a branch** sang **GitHub Actions**.
2. Đi tới tab **Actions** trên kho lưu trữ của bạn.
    1. Bắt đầu một **New workflow** và tìm kiếm **Jekyll**.
    2. Nhấp vào **Configure** dưới quy trình làm việc **Jekyll** (không phải quy trình làm việc **GitHub Pages Jekyll**).
    3. Xem lại thay đổi và nhấp vào **Commit changes**.

### Xây dựng và triển khai

Khi đẩy bất kỳ thay đổi cục bộ nào lên nhánh mặc định, hành động sẽ được kích hoạt và bản dựng sẽ
**bắt đầu**.

Để xem tiến trình và xem bất kỳ lỗi xây dựng nào, hãy kiểm tra **trạng thái** bản dựng bằng một trong các
cách tiếp cận sau:

- **Xem theo cam kết**
  - Đi tới chế độ xem cấp kho lưu trữ trong GitHub. Dưới cam kết gần đây nhất (gần trên cùng), bạn sẽ
    thấy một **biểu tượng trạng thái** bên cạnh thông báo cam kết dưới dạng dấu tích hoặc *X*. Di chuột qua nó và nhấp vào
    liên kết **details**.
- **Tab Actions**
  - Đi tới tab Actions của kho lưu trữ. Nhấp vào tab quy trình làm việc `jekyll`.

Nếu mọi thứ diễn ra tốt đẹp, tất cả các bước sẽ có màu xanh lục và các tài sản đã xây dựng sẽ được tải lên GitHub Pages.

Để xem **trang web trực tiếp**, hãy đi tới tab **Deployments** trên kho lưu trữ của bạn và nhấp vào URL trang web
đã triển khai.

Khi bạn cần thực hiện thêm **thay đổi** cho trang web, hãy cam kết với nhánh mặc định và đẩy.
Quy trình làm việc sẽ xây dựng và triển khai lại trang web của bạn.

## Liên kết ngoài

- [starter-workflows] là kho lưu trữ chính thức cung cấp mẫu quy trình làm việc được sử dụng trong hướng dẫn này.

[ghp-whitelist]: https://pages.github.com/versions/
[remote-theme]: https://github.com/benbalter/jekyll-remote-theme
[timeago-plugin]: https://rubygems.org/gems/jekyll-timeago
[starter-workflows]: https://github.com/actions/starter-workflows/blob/main/pages/jekyll.yml
