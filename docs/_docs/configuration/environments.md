---
title: Môi trường (Environments)
permalink: "/docs/configuration/environments/"
---
Trong các đối số `build` (hoặc `serve`), bạn có thể chỉ định một môi trường Jekyll
và giá trị. Việc xây dựng sau đó sẽ áp dụng giá trị này trong bất kỳ câu lệnh điều kiện nào
trong nội dung của bạn.

Ví dụ, giả sử bạn đặt câu lệnh điều kiện này trong mã của mình:

{% raw %}

```liquid
{% if jekyll.environment == "production" %}
   {% include disqus.html %}
{% endif %}
```

{% endraw %}

Khi bạn xây dựng trang web Jekyll của mình, nội dung bên trong câu lệnh `if` sẽ không được
chạy trừ khi bạn cũng chỉ định môi trường `production` trong lệnh build,
như thế này:

```sh
JEKYLL_ENV=production jekyll build
```

Việc chỉ định giá trị môi trường cho phép bạn làm cho một số nội dung nhất định có sẵn
chỉ trong các môi trường cụ thể.

Giá trị mặc định cho `JEKYLL_ENV` là `development`. Do đó, nếu bạn bỏ qua
`JEKYLL_ENV` khỏi các đối số build, giá trị mặc định sẽ là
`JEKYLL_ENV=development`. Bất kỳ nội dung nào bên trong các thẻ
{% raw %}`{% if jekyll.environment == "development" %}`{% endraw %} sẽ
tự động xuất hiện trong bản build.

Các giá trị môi trường của bạn có thể là bất cứ thứ gì bạn muốn (không chỉ `development` hoặc
`production`). Một số yếu tố bạn có thể muốn ẩn trong các môi trường
phát triển bao gồm biểu mẫu bình luận Disqus hoặc Google Analytics. Ngược lại,
bạn có thể muốn hiển thị nút "Chỉnh sửa tôi trên GitHub" trong môi trường
phát triển nhưng không bao gồm nó trong môi trường sản xuất.

Bằng cách chỉ định tùy chọn trong lệnh build, bạn tránh phải thay đổi
các giá trị trong các tệp cấu hình của mình khi chuyển từ môi trường này sang môi trường khác.

{: .note}
Để chuyển đổi một phần cài đặt cấu hình của bạn tùy thuộc vào môi trường, hãy sử dụng
<a href="{{ '/docs/configuration/options/#build-command-options' | relative_url }}">tùy chọn lệnh build</a>,
ví dụ <code>--config _config.yml,_config_development.yml</code>. Các cài đặt
trong các tệp sau sẽ ghi đè các cài đặt trong các tệp trước đó.
