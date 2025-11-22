---
title: Jekyll trên Windows (Jekyll on Windows)
permalink: /docs/installation/windows/
redirect_from:
  - /docs/windows/
---

Mặc dù Windows không phải là nền tảng được hỗ trợ chính thức, nó có thể được sử dụng để chạy Jekyll với các tinh chỉnh thích hợp.

## Cài đặt Ruby và Jekyll

### Cài đặt qua RubyInstaller

Cách dễ nhất để cài đặt Ruby và Jekyll là sử dụng [RubyInstaller](https://rubyinstaller.org/) cho Windows.

RubyInstaller là một trình cài đặt dựa trên Windows độc lập bao gồm ngôn ngữ Ruby, môi trường thực thi,
tài liệu quan trọng, và nhiều hơn nữa.

Chúng tôi chỉ đề cập đến RubyInstaller-2.4 và mới hơn ở đây. Các phiên bản cũ hơn cần
[cài đặt Devkit](https://github.com/oneclick/rubyinstaller/wiki/Development-Kit) thủ công.

1. Tải xuống và cài đặt phiên bản **Ruby+Devkit** từ [RubyInstaller Downloads](https://rubyinstaller.org/downloads/).
   Sử dụng các tùy chọn mặc định cho cài đặt.
2. Chạy bước `ridk install` ở giai đoạn cuối của trình hướng dẫn cài đặt. Điều này là cần thiết để cài đặt các gem với các phần mở rộng
   gốc (native extensions). Bạn có thể tìm thêm thông tin liên quan đến điều này trong
   [Tài liệu RubyInstaller](https://github.com/oneclick/rubyinstaller2#using-the-installer-on-a-target-system).
   Từ các tùy chọn, chọn `MSYS2 and MINGW development toolchain`.
3. Mở một cửa sổ nhắc lệnh (command prompt) mới từ menu bắt đầu, để các thay đổi đối với biến môi trường `PATH` có hiệu lực.
   Cài đặt Jekyll và Bundler bằng cách sử dụng `gem install jekyll bundler`
4. Kiểm tra xem Jekyll đã được cài đặt đúng chưa: `jekyll -v`

{: .note .info}
Bạn có thể nhận được lỗi khi kiểm tra nếu Jekyll chưa được cài đặt đúng cách. Khởi động lại hệ thống của bạn và chạy lại `jekyll -v`.
Nếu lỗi vẫn còn, vui lòng mở một [vấn đề RubyInstaller](https://github.com/oneclick/rubyinstaller2/issues/new).

Vậy là xong, bạn đã sẵn sàng sử dụng Jekyll!

### Cài đặt qua Bash trên Windows 10

Nếu bạn đang sử dụng Windows 10 phiên bản 1607 hoặc mới hơn, một tùy chọn khác để chạy Jekyll là bằng cách
[cài đặt](https://msdn.microsoft.com/en-us/commandline/wsl/install_guide) Windows Subsystem for Linux.

{: .note .info}
Bạn phải bật [Windows Subsystem for Linux](https://msdn.microsoft.com/en-us/commandline/wsl/about).

Đảm bảo tất cả các gói và kho lưu trữ của bạn đều được cập nhật. Mở cửa sổ Command Prompt hoặc PowerShell mới và nhập `bash`.

Terminal của bạn bây giờ sẽ là một phiên bản Bash. Tiếp theo, cập nhật danh sách kho lưu trữ và các gói của bạn:

```sh
sudo apt-get update -y && sudo apt-get upgrade -y
```

Tiếp theo, cài đặt Ruby. Để làm điều này, hãy sử dụng kho lưu trữ từ [BrightBox](https://www.brightbox.com/docs/ruby/ubuntu/),
nơi lưu trữ các phiên bản Ruby được tối ưu hóa cho Ubuntu.

```sh
sudo apt-add-repository ppa:brightbox/ruby-ng
sudo apt-get update
sudo apt-get install ruby2.5 ruby2.5-dev build-essential dh-autoreconf
```

Tiếp theo, cập nhật các Ruby gems của bạn:

```sh
gem update
```

Cài đặt Jekyll:

```sh
gem install jekyll bundler
```

{: .note .info}
  Không có `sudo` ở đây.

Kiểm tra phiên bản Jekyll của bạn:

```sh
jekyll -v
```

Vậy là xong! Bạn đã sẵn sàng để bắt đầu sử dụng Jekyll.

Bạn có thể đảm bảo quản lý thời gian hoạt động bình thường bằng cách kiểm tra thư mục `_posts` của mình. Bạn sẽ thấy một tệp markdown
với ngày hiện tại trong tên tệp.

<div class="note info">
  <h5>Vấn đề tài khoản không phải siêu người dùng (Non-superuser)</h5>
  <p>Nếu lệnh `jekyll new` in ra lỗi "Your user account isn't allowed to install to the system RubyGems", hãy xem
  hướng dẫn "Running Jekyll as Non-Superuser" trong
  <a href="{{ '/docs/troubleshooting/#no-sudo' | relative_url }}">Khắc phục sự cố</a>.</p>
</div>

{: .note .info}
Bash trên Ubuntu trên Windows vẫn đang được phát triển, vì vậy bạn có thể gặp sự cố.

## Mã hóa (Encoding)

Nếu bạn sử dụng mã hóa UTF-8, Jekyll sẽ bị lỗi nếu một tệp bắt đầu bằng các ký tự đại diện cho [BOM](https://en.wikipedia.org/wiki/Byte_order_mark#UTF-8). Do đó, hãy xóa chuỗi byte này nếu nó xuất hiện ở đầu tệp của bạn.

Ngoài ra, bạn có thể cần thay đổi trang mã (code page) của cửa sổ bảng điều khiển sang UTF-8 trong trường hợp bạn gặp lỗi
`Liquid Exception: Incompatible character encoding` trong quá trình tạo trang web. Chạy lệnh sau:

```sh
chcp 65001
```

## Quản lý Múi giờ

Vì Windows không có nguồn dữ liệu zoneinfo gốc, Trình thông dịch Ruby không hiểu Múi giờ IANA.
Sử dụng chúng có biến môi trường `TZ` mặc định là UTC/GMT 00:00.

Mặc dù người dùng Windows có thể xác định múi giờ blog của họ bằng cách đặt khóa sử dụng định dạng POSIX để xác định
múi giờ, nhưng nó không thân thiện với người dùng khi thay đổi đồng hồ theo quy tắc DST.

Jekyll hiện sử dụng rubygem để cấu hình nội bộ Múi giờ dựa trên
[Cơ sở dữ liệu Múi giờ IANA](https://en.wikipedia.org/wiki/List_of_tz_database_time_zones) đã được thiết lập.

Trong khi các blog 'mới' được tạo bằng Jekyll v3.4 trở lên sẽ có những thứ sau được thêm vào `Gemfile` của họ theo mặc định, các trang web hiện có
*sẽ* phải cập nhật `Gemfile` của họ (và các gem đã cài đặt) để cho phép phát triển trên Windows:

```ruby
# Windows and JRuby does not include zoneinfo files, so bundle the tzinfo-data gem
# and associated library.
platforms :mingw, :x64_mingw, :mswin, :jruby do
  gem "tzinfo", ">= 1", "< 3"
  gem "tzinfo-data"
end
```

## Tự động Tái tạo (Auto Regeneration)

Jekyll sử dụng gem `listen` để theo dõi các thay đổi khi công tắc `--watch` được chỉ định trong quá trình build hoặc serve.
Trong khi `listen` có hỗ trợ tích hợp cho các hệ thống UNIX, nó có thể yêu cầu thêm một gem để tương thích với Windows.

Thêm phần sau vào `Gemfile` cho trang web của bạn nếu bạn gặp sự cố với tự động tái tạo trên Windows:

```ruby
gem "wdm", "~> 0.1.1", :install_if => Gem.win_platform?
```

Bạn phải sử dụng phiên bản [Ruby+Devkit](https://rubyinstaller.org/downloads/) của RubyInstaller và cài đặt
các công cụ xây dựng MSYS2 để cài đặt thành công gem `wdm`.
