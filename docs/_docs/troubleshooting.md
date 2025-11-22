---
title: Khắc phục sự cố (Troubleshooting)
permalink: /docs/troubleshooting/
---

Nếu bạn gặp sự cố khi cài đặt hoặc sử dụng Jekyll, đây là một vài mẹo
có thể giúp ích. Nếu vấn đề bạn đang gặp phải không được đề cập bên dưới,
**vui lòng [kiểm tra các tài nguyên trợ giúp khác của chúng tôi](/help/)** nữa.

- [Sự cố Cài đặt](#installation-problems)
- [Sự cố khi chạy Jekyll](#problems-running-jekyll)
- [Sự cố Base-URL](#base-url-problems)
- [Sự cố Cấu hình](#configuration-problems)
- [Sự cố Markup](#markup-problems)
- [Sự cố Sản xuất](#production-problems)

## Sự cố Cài đặt

Nếu bạn gặp lỗi trong quá trình cài đặt gem, bạn có thể cần cài đặt
các tệp tiêu đề để biên dịch các mô-đun mở rộng cho Ruby 2.x. Điều này
có thể được thực hiện trên Ubuntu hoặc Debian bằng cách chạy:

```sh
sudo apt-get install ruby2.6-dev
```

Trên các hệ thống Red Hat, CentOS và Fedora, bạn có thể thực hiện việc này bằng cách chạy:

```sh
sudo yum install ruby-devel
```

Trên Arch Linux, bạn cần chạy:

```sh
sudo pacman -S ruby-ffi
```

Trên Ubuntu nếu bạn bị kẹt sau khi chạy `bundle exec jekyll serve` và thấy các thông báo lỗi
như `Could not locate Gemfile` hoặc `.bundle/ directory`, có khả năng
là do tất cả các yêu cầu chưa được đáp ứng đầy đủ. Các bản phân phối Ubuntu gốc gần đây
yêu cầu cài đặt cả hai gói `ruby` và `ruby-all-dev`:

```sh
sudo apt-get install ruby ruby-all-dev
```

Trên [NearlyFreeSpeech](https://www.nearlyfreespeech.net/), bạn cần chạy các
lệnh sau trước khi cài đặt Jekyll:

```sh
export GEM_HOME=/home/private/gems
export GEM_PATH=/home/private/gems:/usr/local/lib/ruby/gems/1.8/
export PATH=$PATH:/home/private/gems/bin
export RB_USER_INSTALL='true'
```

Để cài đặt RubyGems trên Gentoo:

```sh
sudo emerge -av dev-ruby/rubygems
```

Trên Windows, bạn có thể cần cài đặt [RubyInstaller
DevKit](https://wiki.github.com/oneclick/rubyinstaller/development-kit).

Trên Android (với Termux), bạn có thể cài đặt tất cả các yêu cầu bằng cách chạy:

```sh
apt update && apt install libffi-dev clang ruby-dev make
```

Trên macOS, bạn có thể cần cập nhật RubyGems (chỉ sử dụng `sudo` nếu cần thiết):

```sh
gem update --system
```

Nếu bạn vẫn gặp sự cố, bạn có thể tải xuống và cài đặt Command Line Tools
mới (chẳng hạn như `gcc`) bằng lệnh sau:

```sh
xcode-select --install
```

điều này có thể cho phép bạn cài đặt các gem gốc bằng lệnh này (một lần nữa, chỉ sử dụng
`sudo` nếu cần thiết):

```sh
gem install jekyll
```

Lưu ý rằng việc nâng cấp macOS không tự động nâng cấp Xcode
(điều đó có thể được thực hiện riêng qua App Store), và việc có một
Xcode.app lỗi thời có thể can thiệp vào các công cụ dòng lệnh được tải xuống ở trên. Nếu
bạn gặp vấn đề này, hãy nâng cấp Xcode và cài đặt Command Line Tools đã nâng cấp.

### Chạy Jekyll với tư cách không phải Superuser (không sudo!)

{: #no-sudo}

Trên hầu hết các hương vị của Linux, macOS và Bash trên Ubuntu trên Windows, có thể
chạy Jekyll với tư cách không phải superuser và không cần phải cài đặt
các gem vào các vị trí toàn hệ thống bằng cách thêm các dòng sau vào cuối
tệp `.bashrc` của bạn:

```bash
# Ruby exports

export GEM_HOME=$HOME/gems
export PATH=$HOME/gems/bin:$PATH
```

Điều này bảo `gem` đặt các gem của nó trong thư mục chính của người dùng,
không phải ở vị trí toàn hệ thống, và thêm lệnh `jekyll` cục bộ vào
`PATH` của người dùng trước bất kỳ đường dẫn toàn hệ thống nào.

Điều này cũng hữu ích cho nhiều dịch vụ lưu trữ web chia sẻ, nơi tài khoản người dùng
chỉ có các đặc quyền hạn chế. Thêm các xuất này vào `.bashrc` trước khi chạy
`gem install jekyll bundler` cho phép cài đặt Jekyll hoàn toàn không cần `sudo`.

Để kích hoạt các xuất mới, hãy đóng và khởi động lại Bash, đăng xuất và
đăng nhập lại vào tài khoản shell của bạn, hoặc chạy `. .bashrc` trong
shell đang chạy hiện tại.

Nếu bạn thấy lỗi sau khi chạy lệnh `jekyll new`,
bạn có thể giải quyết nó bằng cách sử dụng quy trình được mô tả ở trên:

```sh
jekyll new test

Running bundle install in /home/user/test...

Your user account is not allowed to install to the system RubyGems.
You can cancel this installation and run:

    bundle install --path vendor/bundle

to install the gems into ./vendor/bundle/, or you can enter your password
and install the bundled gems to RubyGems using sudo.

Password:
```

Khi điều này được thực hiện, lệnh `jekyll new` sẽ hoạt động bình thường cho
tài khoản người dùng của bạn.

### Jekyll &amp; macOS

Với sự ra đời của Bảo vệ Tính toàn vẹn Hệ thống (System Integrity Protection) trong v10.11, một số thư mục
trước đây có thể ghi được giờ được coi là vị trí hệ thống và không còn
khả dụng nữa. Với những thay đổi này, có một vài cách đơn giản để
bắt đầu và chạy. Một tùy chọn là thay đổi vị trí nơi gem sẽ được
cài đặt (một lần nữa, chỉ sử dụng `sudo` nếu cần thiết):

```sh
gem install -n /usr/local/bin jekyll
```

Ngoài ra, Homebrew có thể được cài đặt và sử dụng để thiết lập Ruby. Điều này có thể được
thực hiện như sau:

```sh
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
```

Khi Homebrew được cài đặt, bước thứ hai là chạy:

```sh
brew install ruby
```

Người dùng nâng cao (với nhu cầu phức tạp hơn) có thể thấy hữu ích khi chọn một trong
số các trình quản lý phiên bản Ruby ([RVM][], [rbenv][], [chruby][], [etc][].) để
cài đặt Jekyll trong đó.

[RVM]: https://rvm.io
[rbenv]: http://rbenv.org
[chruby]: https://github.com/postmodern/chruby
[etc]: https://github.com/rvm/rvm/blob/master/docs/alt.md

Nếu bạn chọn sử dụng một trong các phương pháp trên để cài đặt Ruby, có thể
cần thiết phải sửa đổi biến `$PATH` của bạn bằng lệnh sau:

```sh
export PATH=/usr/local/bin:$PATH
```

Các ứng dụng GUI có thể sửa đổi `$PATH` như sau:

```sh
launchctl setenv PATH "/usr/local/bin:$PATH"
```

Bất kỳ phương pháp nào trong số này đều hữu ích vì `/usr/local` được coi là một
vị trí "an toàn" trên các hệ thống đã bật SIP, chúng tránh các xung đột tiềm ẩn
với phiên bản Ruby được bao gồm bởi Apple, và nó giữ Jekyll và
các phụ thuộc của nó trong một môi trường hộp cát (sandboxed). Điều này cũng có thêm
lợi ích là không yêu cầu `sudo` khi bạn muốn thêm hoặc xóa một gem.

### Không thể tìm thấy JavaScript runtime. (ExecJS::RuntimeUnavailable)

Lỗi này có thể xảy ra trong quá trình cài đặt `jekyll-coffeescript` khi
bạn không có JavaScript runtime thích hợp. Để giải quyết vấn đề này, hãy cài đặt
các gem `execjs` và `therubyracer`, hoặc cài đặt `nodejs`. Xem
[issue #2327](https://github.com/jekyll/jekyll/issues/2327) để biết thêm thông tin.

## Sự cố khi chạy Jekyll

### macOS

Jekyll tương thích với macOS có kiến trúc ARM64.
Tuy nhiên, `bundle exec jekyll serve` có thể [thất bại với phiên bản cũ hơn của `ffi`](https://github.com/ffi/ffi/issues/870).

Bạn có thể cần chạy `bundle update` hoặc cập nhật `ffi` lên ít nhất là `1.14.2` theo cách thủ công.

### Debian hoặc Ubuntu

Trên Debian hoặc Ubuntu, bạn có thể cần thêm `/var/lib/gems/1.8/bin/` vào đường dẫn của mình
để tệp thực thi `jekyll` có sẵn trong Terminal của bạn.

## Sự cố Base-URL

Nếu bạn đang sử dụng tùy chọn base-url như:

```sh
jekyll serve --baseurl '/blog'
```

… thì hãy chắc chắn rằng bạn truy cập trang web tại:

```
http://localhost:4000/blog/index.html
```

Sẽ không hoạt động nếu chỉ truy cập:

```
http://localhost:4000/blog
```

## Sự cố Cấu hình

Thứ tự ưu tiên cho các [cài đặt cấu hình](/docs/configuration/) xung đột
như sau:

1. Cờ dòng lệnh (Command-line flags)
2. Cài đặt tệp cấu hình
3. Mặc định

Nghĩa là: các giá trị mặc định bị ghi đè bởi các tùy chọn được chỉ định trong `_config.yml`,
và các cờ được chỉ định tại dòng lệnh sẽ ghi đè tất cả các cài đặt khác
được chỉ định ở nơi khác.

**Lưu ý: Từ v3.3.0 trở đi, Jekyll không xử lý `node_modules` và một số thư mục con nhất định trong `vendor`, theo mặc định. Nhưng, việc có một mảng `exclude:` được định nghĩa rõ ràng trong tệp cấu hình sẽ ghi đè cài đặt mặc định này, dẫn đến việc một số người dùng gặp lỗi khi xây dựng trang web, với thông báo lỗi sau:**

```
    ERROR: YOUR SITE COULD NOT BE BUILT:
    ------------------------------------
    Invalid date '<%= Time.now.strftime('%Y-%m-%d %H:%M:%S %z') %>':
    Document 'vendor/bundle/gems/jekyll-3.4.3/lib/site_template/_posts/0000-00-00-welcome-to-jekyll.markdown.erb'
    does not have a valid date in front matter.
```

Thêm `vendor/bundle` vào danh sách `exclude:` sẽ giải quyết vấn đề này nhưng sẽ dẫn đến việc có các thư mục con khác dưới `/vendor/` (và cả `/node_modules/`, nếu có) được xử lý vào thư mục đích `_site`.

Giải pháp thích hợp là kết hợp cài đặt mặc định cho `exclude:` thay vì ghi đè hoàn toàn nó:

Đối với các phiên bản lên đến `v3.4.3`, cài đặt `exclude:` phải trông giống như sau:

```yaml
exclude:
  - Gemfile
  - Gemfile.lock
  - node_modules
  - vendor/bundle/
  - vendor/cache/
  - vendor/gems/
  - vendor/ruby/
  - any_additional_item # bất kỳ danh sách cụ thể nào của người dùng sẽ ở cuối
```

Từ `v3.5` trở đi, `Gemfile` và `Gemfile.lock` cũng được loại trừ theo mặc định. Vì vậy, trong hầu hết các trường hợp, không cần phải định nghĩa một mảng `exclude:` khác trong tệp cấu hình. Vì vậy, một định nghĩa hiện có có thể được sửa đổi như trên, hoặc xóa hoàn toàn, hoặc nhận xét để cho phép chỉnh sửa dễ dàng trong tương lai.

## Sự cố Markup

Các công cụ markup khác nhau mà Jekyll sử dụng có thể có một số vấn đề. Trang này
sẽ ghi lại chúng để giúp những người khác có thể gặp phải các vấn đề
tương tự.

### Liquid

Phiên bản Liquid 2.0 dường như phá vỡ việc sử dụng `{{ "{{" }}` trong các mẫu.
Không giống như các phiên bản trước, việc sử dụng `{{ "{{" }}` trong 2.0 gây ra lỗi sau:

```
'{{ "{{" }}' was not properly terminated with regexp: /\}\}/  (Liquid::SyntaxError)
```

### Excerpts (Trích dẫn)

Kể từ v1.0.0, Jekyll đã có các trích dẫn bài đăng được tạo tự động. Kể từ
v1.1.0, Jekyll cũng chuyển các trích dẫn này qua Liquid, điều này có thể gây ra
các lỗi lạ khi các tham chiếu không tồn tại hoặc một thẻ chưa được đóng. Nếu bạn
gặp phải các lỗi này, hãy thử đặt `excerpt_separator: ""` trong
`_config.yml` của bạn, hoặc đặt nó thành một chuỗi vô nghĩa nào đó.

## Sự cố Sản xuất

Nếu bạn gặp sự cố rằng một tệp tĩnh không thể được tìm thấy trong
môi trường sản xuất của bạn trong quá trình xây dựng kể từ v3.2.0, bạn nên đặt
[môi trường thành `production`](/docs/configuration/environments/).
Vấn đề là do cố gắng sao chép một liên kết tượng trưng (symlink) không tồn tại.

<div class="note">
  <h5>Vui lòng báo cáo các vấn đề bạn gặp phải!</h5>
  <p>
  Nếu bạn gặp lỗi, vui lòng <a href="{{ site.repository }}/issues/new">tạo một vấn đề</a>
  trên GitHub mô tả vấn đề và bất kỳ giải pháp thay thế nào bạn tìm thấy để chúng tôi có thể
  ghi lại nó ở đây cho những người khác.
  </p>
</div>
