---
title: Tài sản (Assets)
permalink: /docs/assets/
---

Jekyll cung cấp hỗ trợ tích hợp cho [Sass](https://sass-lang.com/)
và có thể làm việc với [CoffeeScript](https://coffeescript.org/) thông qua một Ruby gem.
Để sử dụng chúng, trước tiên bạn phải tạo một tệp với phần mở rộng tên thích hợp
(một trong các `.sass`, `.scss`, hoặc `.coffee`) và
***bắt đầu tệp với hai dòng dấu gạch ngang ba***, như thế này:

```sass
---
---

// bắt đầu nội dung
.my-definition
  font-size: 1.2em
```

Jekyll xử lý các tệp này giống như một trang thông thường, ở chỗ tệp đầu ra
sẽ được đặt trong cùng thư mục mà nó đến. Ví dụ, nếu bạn
có một tệp tên là `css/styles.scss` trong thư mục nguồn trang web của bạn, Jekyll
sẽ xử lý nó và đặt nó vào thư mục đích của trang web của bạn dưới dạng
`css/styles.css`.

<div class="note info">
  <h5>Jekyll xử lý tất cả các bộ lọc và thẻ Liquid trong các tệp tài sản</h5>
  <p>Nếu bạn đang sử dụng <a href="https://mustache.github.io">Mustache</a>
     hoặc một ngôn ngữ mẫu JavaScript khác xung đột với
     <a href="{{ '/docs/templates/' | relative_url }}">cú pháp mẫu Liquid</a>, bạn
     sẽ cần đặt các thẻ <code>{&#37; raw &#37;}</code> và
     <code>{&#37; endraw &#37;}</code> xung quanh mã của bạn.</p>
</div>

## Sass/SCSS

Jekyll cho phép bạn tùy chỉnh chuyển đổi Sass theo một số cách nhất định.

Đặt tất cả các thành phần (partials) của bạn vào `sass_dir`, mặc định là
`<source>/_sass`. Đặt các tệp SCSS hoặc Sass chính của bạn vào nơi bạn muốn
chúng ở trong tệp đầu ra, chẳng hạn như `<source>/css`. Để xem ví dụ, hãy
xem [trang web ví dụ này sử dụng hỗ trợ Sass trong Jekyll][example-sass].

Nếu bạn đang sử dụng các câu lệnh `@import` của Sass, bạn sẽ cần đảm bảo rằng
`sass_dir` của bạn được đặt thành thư mục cơ sở chứa các tệp Sass của bạn:

```yaml
sass:
    sass_dir: _sass
```

Bộ chuyển đổi Sass sẽ mặc định tùy chọn cấu hình `sass_dir` thành
`_sass`.

[example-sass]: https://github.com/jekyll/jekyll-sass-converter/tree/master/docs

<div class="note info">
  <h5><code>sass_dir</code> chỉ được sử dụng bởi Sass</h5>
  <p>

    Lưu ý rằng <code>sass_dir</code> trở thành đường dẫn tải cho các nhập khẩu Sass,
    không gì hơn. Điều này có nghĩa là Jekyll không biết về các tệp này
    một cách trực tiếp. Bất kỳ tệp nào ở đây không nên chứa front matter trống như
    được mô tả ở trên. Nếu có, chúng sẽ không được chuyển đổi như mô tả ở trên. Thư mục này
    chỉ nên chứa các nhập khẩu.

  </p>
</div>

Bạn cũng có thể chỉ định kiểu đầu ra với tùy chọn `style` trong tệp
`_config.yml` của bạn:

```yaml
sass:
    style: compressed
```

Những tùy chọn này được chuyển đến Sass, vì vậy bất kỳ tùy chọn kiểu đầu ra nào mà Sass hỗ trợ đều hợp lệ
ở đây cũng vậy.

Để biết thêm thông tin về các tùy chọn cấu hình Sass, xem tài liệu [cấu hình Sass]({{ '/docs/configuration/sass/' | relative_url }}).

## Coffeescript

Để kích hoạt Coffeescript trong Jekyll 3.0 trở lên, bạn phải

* Cài đặt gem `jekyll-coffeescript`
* Đảm bảo rằng `_config.yml` của bạn được cập nhật và bao gồm những điều sau:

```yaml
plugins:
  - jekyll-coffeescript
```
