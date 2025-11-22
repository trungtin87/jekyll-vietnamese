---
title: Jekyll trên FreeBSD (Jekyll on FreeBSD)
permalink: /docs/installation/freebsd/
---

### Cài đặt Ruby

```sh
sudo pkg install ruby
```

### Cài đặt Ruby Gems

Tìm phiên bản mới nhất và cài đặt nó. (Thay thế `ruby3x` bằng bất kỳ phiên bản mới nhất nào.)

```sh
pkg search gems
sudo pkg install ruby3x-gems
```

## Đặt thư mục Gems và thêm nó vào đường dẫn Bash

Tránh cài đặt các gói RubyGems (được gọi là gems) với tư cách là người dùng root. Thay vào đó,
thiết lập một thư mục cài đặt gem cho tài khoản người dùng của bạn. Các lệnh sau
sẽ thêm các biến môi trường vào tệp `~/.bashrc` của bạn để cấu hình
đường dẫn cài đặt gem:

```sh
echo '# Install Ruby Gems to ~/gems' >> ~/.bashrc
echo 'export GEM_HOME="$HOME/gems"' >> ~/.bashrc
echo 'export PATH="$HOME/gems/bin:$PATH"' >> ~/.bashrc
source ~/.bashrc
```

## Cài đặt Jekyll Gems

```sh
gem install jekyll bundler jekyll-sitemap
```

## Xác minh cài đặt

Cả hai lệnh này sẽ trả về một số đầu ra hiển thị số phiên bản, v.v.

```sh
ruby -v
jekyll -v
```

Vậy là xong! Bạn đã sẵn sàng để bắt đầu sử dụng Jekyll.
