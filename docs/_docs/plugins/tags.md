---
title: Thẻ (Tags)
permalink: /docs/plugins/tags/
---

Nếu bạn muốn bao gồm các thẻ liquid tùy chỉnh trong trang web của mình, bạn có thể làm như vậy bằng cách
móc nối vào hệ thống gắn thẻ. Các ví dụ tích hợp được thêm bởi Jekyll bao gồm các thẻ
`highlight` và `include`. Dưới đây là một ví dụ về thẻ liquid tùy chỉnh sẽ
xuất ra thời gian trang được hiển thị:

```ruby
module Jekyll
  class RenderTimeTag < Liquid::Tag

    def initialize(tag_name, text, tokens)
      super
      @text = text
    end

    def render(context)
      "#{@text} #{Time.now}"
    end
  end
end

Liquid::Template.register_tag('render_time', Jekyll::RenderTimeTag)
```

Tối thiểu, các thẻ liquid phải triển khai:

<div class="mobile-side-scroller">
<table>
  <thead>
    <tr>
      <th>Phương thức</th>
      <th>Mô tả</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>
        <p><code>render</code></p>
      </td>
      <td>
        <p>Xuất nội dung của thẻ.</p>
      </td>
    </tr>
  </tbody>
</table>
</div>

Bạn cũng phải đăng ký thẻ tùy chỉnh với công cụ mẫu Liquid như
sau:

```ruby
Liquid::Template.register_tag('render_time', Jekyll::RenderTimeTag)
```

Trong ví dụ trên, chúng ta có thể đặt thẻ sau ở bất kỳ đâu trong một trong các
trang của chúng ta:

{% raw %}

```liquid
<p>{% render_time page rendered at: %}</p>
```

{% endraw %}

Và chúng ta sẽ nhận được một cái gì đó như thế này trên trang:

```html
<p>page rendered at: Tue June 22 23:38:47 –0500 2010</p>
```

## Khối Thẻ

Thẻ `render_time` thấy ở trên cũng có thể được viết lại dưới dạng một khối thẻ bằng cách
kế thừa lớp `Liquid::Block`. Hãy xem ví dụ dưới đây:

```ruby
module Jekyll
  class RenderTimeTagBlock < Liquid::Block

    def render(context)
      text = super
      "<p>#{text} #{Time.now}</p>"
    end

  end
end

Liquid::Template.register_tag('render_time', Jekyll::RenderTimeTagBlock)
```

Bây giờ chúng ta có thể sử dụng khối thẻ ở bất cứ đâu:

{% raw %}

```liquid
{% render_time %}
page rendered at:
{% endrender_time %}
```

{% endraw %}

Và chúng ta vẫn sẽ nhận được cùng một đầu ra như trên trang:

```html
<p>page rendered at: Tue June 22 23:38:47 –0500 2010</p>
```

{: .note .info}
Trong ví dụ trên, khối thẻ và thẻ đều được đăng ký với
tên <code>render_time</code>, nhưng việc đăng ký một thẻ và một khối thẻ sử dụng
cùng một tên trong cùng một dự án không được khuyến khích vì điều này có thể dẫn đến
xung đột.
