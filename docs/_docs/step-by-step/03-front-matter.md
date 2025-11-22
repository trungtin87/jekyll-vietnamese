---
layout: step
title: Front Matter
position: 3
---
Front matter là một đoạn mã [YAML](http://yaml.org/) được đặt giữa hai dòng gạch ngang ba ở đầu tệp.

Bạn có thể sử dụng front matter để đặt biến cho trang:

```yaml
---
my_number: 5
---
```

Bạn có thể gọi các biến front matter trong Liquid bằng cách sử dụng biến `page`. Ví dụ, để xuất giá trị của biến `my_number` ở trên:

{% raw %}

```liquid
{{ page.my_number }}
```

{% endraw %}

## Sử dụng front matter

Thay đổi `<title>` trên trang web của bạn để sử dụng front matter:

{% raw %}

```liquid
---
title: Trang chủ
---
<!doctype html>
<html>
  <head>
    <meta charset="utf-8">
    <title>{{ page.title }}</title>
  </head>
  <body>
    <h1>{{ "Hello World!" | downcase }}</h1>
  </body>
</html>
```

{% endraw %}

{: .note .info }
Bạn _phải_ bao gồm front matter trên trang để Jekyll xử lý bất kỳ thẻ Liquid nào trên đó.

Để làm cho Jekyll xử lý một trang mà không xác định các biến trong front matter, hãy sử dụng:

```yaml
---
---
```

Tiếp theo, bạn sẽ tìm hiểu thêm về bố cục và lý do tại sao các trang của bạn sử dụng nhiều mã nguồn hơn HTML thuần tú.
