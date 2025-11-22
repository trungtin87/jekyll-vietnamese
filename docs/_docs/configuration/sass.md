---
title: Tùy chọn Sass/SCSS (Sass/SCSS Options)
permalink: "/docs/configuration/sass/"
---

Jekyll đi kèm với plugin [jekyll-sass-converter](https://github.com/jekyll/jekyll-sass-converter). Theo mặc định, Jekyll sẽ tìm kiếm các Sass partials trong thư mục `_sass` tương đối với thư mục `source` của trang web của bạn.

Bạn có thể cấu hình thêm plugin bằng cách thêm các tùy chọn vào cấu hình Jekyll của bạn dưới thuộc tính `sass`. Xem [tài liệu của plugin](https://github.com/jekyll/jekyll-sass-converter#usage) để biết chi tiết và các giá trị mặc định của nó.

{:.note .info}
Nếu bạn thấy cảnh báo trong VSCode liên quan đến `@import "main";`, bạn có thể bỏ qua nó vì điều tương tự không ảnh hưởng đến chức năng của mã SCSS trong Jekyll. Tuy nhiên, Jekyll 4 không cho phép nhập một `main` sass partial (`_sass/main.scss`) từ một trang sass cùng tên, tức là `css/main.scss`.

<div class="note info">
  <p>
    Lưu ý rằng các đường dẫn thư mục được chỉ định trong cấu hình <code>sass</code>
    được giải quyết tương đối với <code>source</code> của trang web của bạn, không tương đối với vị trí của tệp <code>_config.yml</code>.
  </p>
</div>
