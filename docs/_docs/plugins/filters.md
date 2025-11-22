---
title: Bộ lọc (Filters)
permalink: /docs/plugins/filters/
---

Bộ lọc là các mô-đun xuất các phương thức của chúng sang liquid.
Tất cả các phương thức sẽ phải nhận ít nhất một tham số đại diện cho đầu vào
của bộ lọc. Giá trị trả về sẽ là đầu ra của bộ lọc.

```ruby
module Jekyll
  module AssetFilter
    def asset_url(input)
      "http://www.example.com/#{input}?#{Time.now.to_i}"
    end
  end
end

Liquid::Template.register_filter(Jekyll::AssetFilter)
```

Để biết thêm chi tiết về việc tạo Bộ lọc Liquid tùy chỉnh, hãy truy cập [tài liệu Liquid](https://github.com/Shopify/liquid/wiki/Liquid-for-Programmers#create-your-own-filters).

<div class="note">
  <h5>Mẹo chuyên nghiệp (ProTip™): Truy cập đối tượng site bằng Liquid</h5>
  <p>
    Jekyll cho phép bạn truy cập đối tượng <code>site</code> thông qua
    tính năng <code>@context.registers</code> của Liquid tại <code>@context.registers[:site]</code>. Ví dụ, bạn có thể
    truy cập tệp cấu hình toàn cầu <code>_config.yml</code> bằng cách sử dụng
    <code>@context.registers[:site].config</code>.
  </p>
</div>
