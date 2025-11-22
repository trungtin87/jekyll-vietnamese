---
title: Bộ chuyển đổi (Converters)
permalink: /docs/plugins/converters/
---

Nếu bạn có một ngôn ngữ đánh dấu mới mà bạn muốn sử dụng với trang web của mình, bạn có thể
bao gồm nó bằng cách triển khai bộ chuyển đổi của riêng bạn. Cả ngôn ngữ đánh dấu Markdown và
[Textile](https://github.com/jekyll/jekyll-textile-converter)
đều được triển khai bằng phương pháp này.

<div class="note info">
  <h5>Hãy nhớ Front Matter của bạn</h5>
  <p>
    Jekyll sẽ chỉ chuyển đổi các tệp có tiêu đề YAML ở đầu, ngay cả đối với
    các bộ chuyển đổi bạn thêm bằng plugin.
  </p>
</div>

Dưới đây là một bộ chuyển đổi sẽ lấy tất cả các bài đăng kết thúc bằng `.upcase` và xử lý
chúng bằng cách sử dụng `UpcaseConverter`:

```ruby
module Jekyll
  class UpcaseConverter < Converter
    safe true
    priority :low

    def matches(ext)
      ext =~ /^\.upcase$/i
    end

    def output_ext(ext)
      ".html"
    end

    def convert(content)
      content.upcase
    end
  end
end
```

Các bộ chuyển đổi nên triển khai tối thiểu 3 phương thức:

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
        <p><code>matches</code></p>
      </td>
      <td><p>
        Phần mở rộng đã cho có khớp với danh sách các phần mở rộng chấp nhận được của bộ chuyển đổi này không?
        Nhận một đối số: phần mở rộng của tệp (bao gồm cả dấu chấm).
        Phải trả về <code>true</code> nếu khớp, ngược lại là <code>false</code>.
      </p></td>
    </tr>
    <tr>
      <td>
        <p><code>output_ext</code></p>
      </td>
      <td><p>
        Phần mở rộng được cung cấp cho tệp đầu ra (bao gồm cả dấu chấm).
        Thông thường đây sẽ là <code>".html"</code>.
      </p></td>
    </tr>
    <tr>
      <td>
        <p><code>convert</code></p>
      </td>
      <td><p>
        Logic để thực hiện chuyển đổi nội dung. Nhận một đối số: nội dung thô
        của tệp (không có front matter). Phải trả về một Chuỗi (String).
      </p></td>
    </tr>
  </tbody>
</table>
</div>

Trong ví dụ của chúng tôi, `UpcaseConverter#matches` kiểm tra xem phần mở rộng tên tệp của chúng tôi có phải là
`.upcase` hay không, và sẽ hiển thị bằng bộ chuyển đổi nếu đúng. Nó sẽ gọi
`UpcaseConverter#convert` để xử lý nội dung. Trong bộ chuyển đổi đơn giản của chúng tôi, chúng tôi
chỉ đơn giản là viết hoa toàn bộ chuỗi nội dung. Cuối cùng, khi nó lưu trang,
nó sẽ làm như vậy với phần mở rộng `.html`.
