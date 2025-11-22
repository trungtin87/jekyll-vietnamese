---
title: Liquid
permalink: /docs/liquid/
redirect_from: "/docs/templates/"
---

Jekyll sử dụng ngôn ngữ mẫu [Liquid](https://shopify.github.io/liquid/)
để xử lý các mẫu.

Nói chung trong Liquid, bạn xuất nội dung bằng cách sử dụng hai dấu ngoặc nhọn, ví dụ:
{% raw %}`{{ variable }}`{% endraw %} và thực hiện các câu lệnh logic bằng cách
bao quanh chúng trong dấu ngoặc nhọn và dấu phần trăm, ví dụ:
{% raw %}`{% if statement %}`{% endraw %}. Để tìm hiểu thêm về Liquid, hãy xem
[Tài liệu Liquid chính thức](https://shopify.github.io/liquid/).

Jekyll cung cấp một số bổ sung Liquid hữu ích để giúp bạn xây dựng trang web của mình:

* [Bộ lọc (Filters)]({{ '/docs/liquid/filters/' | relative_url }})
* [Thẻ (Tags)]({{ '/docs/liquid/tags/' | relative_url }})
