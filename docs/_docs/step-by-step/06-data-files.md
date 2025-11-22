---
layout: step
title: Tệp dữ liệu
position: 6
---
Jekyll hỗ trợ tải dữ liệu từ các tệp YAML, JSON và CSV nằm trong thư mục `_data`. Các tệp dữ liệu là một cách tuyệt vời để tách nội dung khỏi mã nguồn để làm cho trang web dễ bảo trì hơn.

Trong bước này, bạn sẽ lưu trữ nội dung của điều hướng trong một tệp dữ liệu và sau đó lặp lại nó trong bao gồm điều hướng.

## Sử dụng tệp dữ liệu

[YAML](http://yaml.org/) là một định dạng phổ biến trong hệ sinh thái Ruby. Bạn sẽ sử dụng nó để lưu trữ một mảng các mục điều hướng, mỗi mục có tên và liên kết.

Tạo một tệp dữ liệu cho điều hướng tại `_data/navigation.yml` với nội dung sau:

```yaml
- name: Trang chủ
  link: /
- name: Giới thiệu
  link: /about.html
```

Jekyll làm cho tệp dữ liệu này có sẵn cho bạn tại `site.data.navigation`. Thay vì xuất từng liên kết trong `_includes/navigation.html`, bây giờ bạn có thể lặp lại tệp dữ liệu thay thế:

{% raw %}

```liquid
<nav>
  {% for item in site.data.navigation %}
    <a href="{{ item.link }}" {% if page.url == item.link %}style="color: red;"{% endif %}>
      {{ item.name }}
    </a>
  {% endfor %}
</nav>
```

{% endraw %}

Đầu ra sẽ hoàn toàn giống nhau. Sự khác biệt là bạn đã làm cho việc thêm các mục điều hướng mới và thay đổi cấu trúc HTML dễ dàng hơn.

Một trang web sẽ tốt như thế nào nếu không có CSS, JS và hình ảnh? Hãy xem cách xử lý tài sản trong Jekyll.
