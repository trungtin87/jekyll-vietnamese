---
title: "Travis CI"
---

Bạn có thể kiểm tra bản dựng trang web của mình với một hoặc nhiều phiên bản Ruby.
Hướng dẫn sau đây sẽ chỉ cho bạn cách thiết lập môi trường xây dựng miễn phí trên
[Travis][travis], với tích hợp [GitHub][github] cho các yêu cầu kéo.

[travis]: https://travis-ci.org/
[github]: https://github.com/

## 1. Kích hoạt Travis và GitHub

Để kích hoạt bản dựng Travis cho kho lưu trữ GitHub của bạn:

1. Truy cập hồ sơ của bạn trên travis-ci.org: <https://travis-ci.org/profile/username>
2. Tìm kho lưu trữ mà bạn quan tâm đến việc kích hoạt bản dựng.
3. Bật công tắc kho lưu trữ để nó chuyển sang màu xanh lam.
4. Tùy chọn cấu hình bản dựng bằng cách nhấp vào biểu tượng bánh răng. Cấu hình thêm
   xảy ra thông qua tệp `.travis.yml` của bạn. Chi tiết thêm bên dưới.

## 2. Tập lệnh kiểm tra

Tập lệnh kiểm tra đơn giản nhất chạy `jekyll build` và đảm bảo rằng Jekyll
không thất bại trong việc xây dựng trang web. Nó không kiểm tra trang web kết quả, nhưng nó
đảm bảo mọi thứ được xây dựng đúng cách.

Khi kiểm tra đầu ra Jekyll, không có công cụ nào tốt hơn [html-proofer][html-proofer].
Công cụ này kiểm tra trang web kết quả của bạn để đảm bảo tất cả các liên kết và hình ảnh đều tồn tại.
Sử dụng nó với tệp thực thi dòng lệnh `htmlproofer` thuận tiện,
hoặc viết một tập lệnh Ruby sử dụng gem.

Lưu các lệnh bạn muốn chạy và thành công trong một tệp: `./script/cibuild`

### Tệp thực thi HTML Proofer

```bash
#!/usr/bin/env bash
set -e # halt script on error

bundle exec jekyll build
bundle exec htmlproofer ./_site
```

Một số tùy chọn có thể được chỉ định thông qua các công tắc dòng lệnh. Kiểm tra
README của `html-proofer` để biết thêm thông tin về các công tắc này, hoặc chạy
`htmlproofer --help` cục bộ.

Ví dụ để tránh kiểm tra các trang web bên ngoài, hãy sử dụng lệnh này:

```sh
bundle exec htmlproofer ./_site --disable-external
```

### Thư viện HTML Proofer

Bạn cũng có thể gọi `html-proofer` trong các tập lệnh Ruby (ví dụ: trong Rakefile):

```ruby
#!/usr/bin/env ruby

require 'html-proofer'
HTMLProofer.check_directory("./_site").run
```

Các tùy chọn được đưa ra dưới dạng đối số thứ hai cho `.new`, và được mã hóa trong một
Ruby Hash có khóa biểu tượng. Để biết thêm thông tin về các tùy chọn cấu hình,
hãy xem tệp README của `html-proofer`.

[html-proofer]: https://github.com/gjtorikian/html-proofer

## 3. Cấu hình Bản dựng Travis của bạn

Tệp này được sử dụng để cấu hình các bản dựng Travis của bạn. Vì Jekyll được xây dựng
với Ruby và yêu cầu RubyGems để cài đặt, chúng tôi sử dụng môi trường xây dựng ngôn ngữ Ruby.
Dưới đây là một tệp mẫu `.travis.yml`, theo sau là
giải thích về từng dòng.

**Lưu ý:** Bạn cũng sẽ cần một Gemfile, [Travis sẽ tự động cài đặt](https://docs.travis-ci.com/user/languages/ruby/#Dependency-Management) các phụ thuộc dựa trên các gem được tham chiếu. Dưới đây là một ví dụ `Gemfile` với hai gem được tham chiếu, "jekyll" và "html-proofer":

```ruby
source "https://rubygems.org"

gem "jekyll"
gem "html-proofer"
```

Tệp `.travis.yml` của bạn sẽ trông giống như thế này:

```yaml
language: ruby
rvm:
  - 2.6.3

before_script:
 - chmod +x ./script/cibuild # or do this locally and commit

# Assume bundler is being used, therefore
# the `install` step will run `bundle install` by default.
script: ./script/cibuild

# branch whitelist, only for GitHub Pages
branches:
  only:
  - gh-pages     # test the gh-pages branch
  - /pages-(.*)/ # test every branch which starts with "pages-"

addons:
  apt:
    packages:
    - libcurl4-openssl-dev

cache: bundler # caching bundler gem packages will speed up build

# Optional: disable email notifications about the outcome of your builds
notifications:
  email: false
```

Ok, bây giờ là giải thích cho từng dòng:

```yaml
language: ruby
```

Dòng này bảo Travis sử dụng một container xây dựng Ruby. Nó cung cấp cho tập lệnh của bạn
quyền truy cập vào Bundler, RubyGems, và thời gian chạy Ruby.

```yaml
rvm:
  - 2.6.3
```

RVM là một Trình quản lý Phiên bản Ruby phổ biến (như rbenv, chruby, v.v.). Chỉ thị này
bảo Travis phiên bản Ruby để sử dụng khi chạy tập lệnh kiểm tra của bạn.
Sử dụng một [phiên bản được cài đặt sẵn trên hình ảnh docker xây dựng Travis][5]
để tăng tốc độ xây dựng.

```yaml
before_script:
 - chmod +x ./script/cibuild
```

Tệp tập lệnh xây dựng cần phải có thuộc tính *executable* được thiết lập hoặc
Travis sẽ thất bại với lỗi từ chối quyền. Bạn cũng có thể chạy cái này
cục bộ và cam kết các quyền trực tiếp, do đó làm cho bước này
không liên quan.

```yaml
script: ./script/cibuild
```

Travis cho phép bạn chạy bất kỳ tập lệnh shell tùy ý nào để kiểm tra trang web của bạn. Một
quy ước là đặt tất cả các tập lệnh cho dự án của bạn trong thư mục `script`,
và gọi tập lệnh kiểm tra của bạn là `cibuild`. Dòng này hoàn toàn
có thể tùy chỉnh. Nếu tập lệnh của bạn không thay đổi nhiều, bạn có thể viết câu thần chú kiểm tra
của mình ở đây trực tiếp:

```yaml
install: gem install jekyll html-proofer
script: jekyll build && htmlproofer ./_site
```

Chỉ thị `script` có thể là hoàn toàn bất kỳ lệnh shell hợp lệ nào.

```yaml
# branch whitelist, only for GitHub Pages
branches:
  only:
  - gh-pages     # test the gh-pages branch
  - /pages-(.*)/ # test every branch which starts with "pages-"
```

Bạn muốn đảm bảo các bản dựng Travis cho trang web của bạn chỉ được chạy trên
nhánh hoặc các nhánh chứa trang web của bạn. Một phương tiện để đảm bảo sự cô lập này
là bao gồm một danh sách trắng nhánh trong tệp cấu hình Travis của bạn.
Bằng cách chỉ định nhánh `gh-pages`, bạn sẽ đảm bảo tập lệnh kiểm tra liên quan
(đã thảo luận ở trên) chỉ được thực thi trên các nhánh trang web. Nếu bạn sử dụng
một luồng yêu cầu kéo để đề xuất các thay đổi, bạn có thể muốn thực thi một
quy ước cho các bản dựng của mình sao cho tất cả các nhánh chứa các chỉnh sửa đều
được thêm tiền tố, được minh họa ở trên với biểu thức chính quy `/pages-(.*)/`.

Chỉ thị `branches` là hoàn toàn tùy chọn. Travis sẽ xây dựng từ mọi
lần đẩy đến bất kỳ nhánh nào của kho lưu trữ của bạn nếu bỏ qua nó.

<div class="note warning">
  <h5>Hãy chắc chắn loại trừ <code>vendor</code> khỏi
   <code>_config.yml</code> của bạn</h5>
  <p>Travis đóng gói tất cả các gem trong thư mục <code>vendor</code> trên các máy chủ xây dựng của nó,
   điều mà Jekyll sẽ đọc nhầm và phát nổ.</p>
</div>

```yaml
exclude: [vendor]
```

Để tăng tốc độ xây dựng, bạn nên lưu trữ các gói gem được tạo bởi `bundler`.
Travis có một [chiến lược bộ nhớ đệm được xác định trước cho công cụ này][6] nên có
tất cả các cấu hình mặc định để làm chính xác điều đó.

```yaml
cache: bundler
```

Tùy chọn, nếu bạn không quan tâm đến các thông báo email xây dựng, bạn
có thể vô hiệu hóa chúng với cấu hình này. Travis hỗ trợ một loạt các
dịch vụ thông báo, bạn có thể thấy [một cái khác hữu ích hơn (ví dụ: slack)][7].

```yaml
notifications:
  email: false
```

### Khắc phục sự cố

**Lỗi Travis:** *"You are trying to install in deployment mode after changing
your Gemfile. Run bundle install elsewhere and add the updated Gemfile.lock
to version control."*

**Giải pháp:** Hoặc chạy `bundle install` cục bộ và cam kết các thay đổi của bạn vào
`Gemfile.lock`, hoặc xóa tệp `Gemfile.lock` khỏi kho lưu trữ của bạn và thêm
một mục trong tệp `.gitignore` để tránh nó bị check-in lại.

### Câu hỏi?

Toàn bộ hướng dẫn này là mã nguồn mở. Hãy tiếp tục và [chỉnh sửa nó][3] nếu bạn có một
bản sửa lỗi hoặc [yêu cầu trợ giúp][4] nếu bạn gặp sự cố và cần một số trợ giúp.

[3]: https://github.com/jekyll/jekyll/edit/master/docs/_docs/continuous-integration/travis-ci.md
[4]: https://jekyllrb.com/help/
[5]: https://docs.travis-ci.com/user/languages/ruby/#Specifying-Ruby-versions-and-implementations
[6]: https://docs.travis-ci.com/user/caching/#Caching-directories-(Bundler%2C-dependencies)
[7]: https://docs.travis-ci.com/user/notifications/
