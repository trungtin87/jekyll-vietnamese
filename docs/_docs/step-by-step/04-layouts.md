---
layout: step
title: Bố cục
position: 4
---
Jekyll hỗ trợ [Markdown](https://daringfireball.net/projects/markdown/syntax) ngoài HTML khi xây dựng các trang. Markdown là một lựa chọn tuyệt vời cho các trang có cấu trúc nội dung đơn giản (chỉ các đoạn văn, tiêu đề và hình ảnh), vì nó ít dài dòng hơn HTML thô.

Tạo một tệp Markdown mới có tên `about.md` trong thư mục gốc trang web của bạn.

Bạn có thể sao chép nội dung của `index` và sửa đổi nó cho trang Giới thiệu. Tuy nhiên, điều này tạo ra mã trùng lặp phải được tùy chỉnh cho mỗi trang mới bạn thêm vào trang web của mình.

Ví dụ, việc thêm một bảng định kiểu mới vào trang web của bạn sẽ liên quan đến việc thêm liên kết đến bảng định kiểu vào `<head>` của mỗi trang. Đối với các trang web có nhiều trang, đây là một sự lãng phí thời gian.

## Tạo một bố cục

Bố cục là các mẫu có thể được sử dụng bởi bất kỳ trang nào trong trang web của bạn và bao quanh nội dung trang. Chúng được lưu trữ trong một thư mục có tên `_layouts`.

Tạo thư mục `_layouts` trong thư mục gốc trang web của bạn và tạo một tệp `default.html` mới với nội dung sau:

{% raw %}

```liquid
<!doctype html>
<html>
  <head>
    <meta charset="utf-8">
    <title>{{ page.title }}</title>
  </head>
  <body>
    {{ content }}
  </body>
</html>
```

{% endraw %}

HTML này gần như giống hệt với `index.html` ngoại trừ việc không có front matter và nội dung của trang được thay thế bằng một biến `content`.

`content` là một biến đặc biệt trả về nội dung được hiển thị của trang mà nó được gọi.

## Sử dụng bố cục

Để làm cho `index.html` sử dụng bố cục mới của bạn, hãy đặt biến `layout` trong front matter. Tệp sẽ trông như thế này:

{% raw %}

```liquid
---
layout: default
title: Trang chủ
---
<h1>{{ "Hello World!" | downcase }}</h1>
```

{% endraw %}

Khi bạn tải lại trang web, đầu ra vẫn giữ nguyên.

Vì bố cục bao quanh nội dung trên trang, bạn có thể gọi front matter giống như `page` trong tệp bố cục. Khi bạn áp dụng bố cục cho một trang, nó sử dụng front matter trên trang đó.

## Xây dựng trang Giới thiệu

Thêm phần sau vào `about.md` để sử dụng bố cục mới của bạn trong trang Giới thiệu:

```markdown
---
layout: default
title: Giới thiệu
---
# Trang giới thiệu

Trang này cho bạn biết một chút về tôi.
```

Mở <a href="http://localhost:4000/about.html" target="_blank" data-proofer-ignore>http://localhost:4000/about.html</a> trong trình duyệt của bạn và xem trang mới của bạn.

Chúc mừng, bây giờ bạn đã có một trang web hai trang!

Tiếp theo, bạn sẽ tìm hiểu về điều hướng từ trang này sang trang khác trong trang web của mình.
