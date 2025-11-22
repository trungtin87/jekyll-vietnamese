---
title: Jekyll trên macOS (Jekyll on macOS)
permalink: /docs/installation/macos/
---

## Các phiên bản macOS được hỗ trợ

Chúng tôi khớp với [yêu cầu macOS của Homebrew](https://docs.brew.sh/Installation#macos-requirements), thường hỗ trợ 2 hoặc 3 phiên bản macOS gần nhất.

Các phiên bản macOS cũ hơn có thể hoạt động, nhưng chúng tôi không chính thức hỗ trợ chúng.

## Cài đặt Ruby

Để cài đặt Jekyll trên macOS, bạn cần một môi trường phát triển Ruby thích hợp.
Mặc dù macOS được cài đặt sẵn Ruby, chúng tôi không khuyên bạn nên sử dụng phiên bản đó
để cài đặt Jekyll. Bài viết bên ngoài này đi qua các lý do khác nhau
[tại sao bạn không nên sử dụng Ruby hệ thống](https://www.moncefbelyamani.com/why-you-shouldn-t-use-the-system-ruby-to-install-gems-on-a-mac/).

Thay vào đó, bạn sẽ cần cài đặt một phiên bản Ruby riêng biệt và mới hơn bằng cách sử dụng một
trình quản lý phiên bản như [asdf], [chruby], [rbenv], hoặc [rvm]. Các trình quản lý phiên bản
cho phép bạn dễ dàng cài đặt nhiều phiên bản Ruby và chuyển đổi giữa chúng.

Chúng tôi khuyên dùng `chruby` vì nó đơn giản nhất và ít có khả năng gây ra sự cố nhất.

Các hướng dẫn bên dưới là trích đoạn từ hướng dẫn bên ngoài chi tiết này để
[cài đặt Ruby trên Mac]. Chúng hoạt động tốt nhất nếu bạn đang thiết lập các công cụ phát triển
lần đầu tiên trên máy Mac của mình. Nếu bạn đã thử cài đặt Ruby hoặc
Jekyll trên máy Mac của mình, hoặc nếu bạn gặp bất kỳ vấn đề nào, hãy đọc hướng dẫn đó.

[asdf]: https://asdf-vm.com/
[chruby]: https://github.com/postmodern/chruby
[rbenv]: https://github.com/rbenv/rbenv
[rvm]: https://rvm.io/
[cài đặt Ruby trên Mac]: https://www.moncefbelyamani.com/how-to-install-xcode-homebrew-git-rvm-ruby-on-mac/

### Bước 1: Cài đặt Homebrew

[Homebrew](https://brew.sh/) giúp dễ dàng cài đặt các công cụ phát triển trên máy Mac.

```sh
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

### Bước 2: Cài đặt chruby và Ruby mới nhất với ruby-install

Cài đặt `chruby` và `ruby-install` với Homebrew:

```sh
brew install chruby ruby-install
```

Cài đặt phiên bản ổn định mới nhất của Ruby (được Jekyll hỗ trợ):

```sh
ruby-install ruby {{ site.data.ruby.current_version }}
```

Việc này sẽ mất vài phút, và sau khi hoàn tất, hãy cấu hình shell của bạn để
tự động sử dụng `chruby`:

```sh
echo "source $(brew --prefix)/opt/chruby/share/chruby/chruby.sh" >> ~/.zshrc
echo "source $(brew --prefix)/opt/chruby/share/chruby/auto.sh" >> ~/.zshrc
echo "chruby ruby-{{ site.data.ruby.current_version }}" >> ~/.zshrc # chạy 'chruby' để xem phiên bản thực tế
```

Nếu bạn đang sử dụng Bash, hãy thay thế `.zshrc` bằng `.bash_profile`. Nếu bạn không chắc chắn,
hãy đọc hướng dẫn bên ngoài này để
[tìm ra shell nào bạn đang sử dụng](https://www.moncefbelyamani.com/which-shell-am-i-using-how-can-i-switch/).

Thoát và khởi chạy lại Terminal, sau đó kiểm tra xem mọi thứ có hoạt động không:

```sh
ruby -v
```

Nó sẽ hiển thị {{ site.data.ruby.current_version_output }} hoặc một phiên bản mới hơn.

Tiếp theo, hãy đọc cùng hướng dẫn bên ngoài đó để biết các ghi chú quan trọng về
[thiết lập và chuyển đổi giữa các phiên bản Ruby với chruby](https://www.moncefbelyamani.com/how-to-install-xcode-homebrew-git-rvm-ruby-on-mac/#how-to-install-different-versions-of-ruby-and-switch-between-them).

## Cài đặt Jekyll

Sau khi cài đặt Ruby với chruby, hãy cài đặt gem Jekyll mới nhất:

```sh
gem install jekyll
```

## Khắc phục sự cố

Xem [Khắc phục sự cố]({{ '/docs/troubleshooting/' | relative_url }}) hoặc [yêu cầu trợ giúp trên diễn đàn của chúng tôi](https://talk.jekyllrb.com).
