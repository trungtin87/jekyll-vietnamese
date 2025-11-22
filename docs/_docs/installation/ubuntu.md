---
title: Jekyll trên Ubuntu (Jekyll on Ubuntu)
permalink: /docs/installation/ubuntu/
---

## Cài đặt các phụ thuộc

Cài đặt Ruby và các [điều kiện tiên quyết]({{ '/docs/installation/#requirements' | relative_url }}) khác:

```sh
sudo apt-get install ruby-full build-essential zlib1g-dev
```

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

Cuối cùng, cài đặt Jekyll và Bundler:

```sh
gem install jekyll bundler
```

Vậy là xong! Bạn đã sẵn sàng để bắt đầu sử dụng Jekyll.
