---
title: Includes
permalink: /docs/includes/
---

Thẻ `include` cho phép bạn bao gồm nội dung từ một tệp khác được lưu trữ trong thư mục `_includes`:

{% raw %}

```liquid
{% include footer.html %}
```

{% endraw %}

Jekyll sẽ tìm tệp được tham chiếu (trong trường hợp này là `footer.html`) trong thư mục `_includes` tại thư mục gốc của thư mục nguồn của bạn và chèn nội dung của nó.

### Bao gồm tệp tương đối với tệp khác

Bạn có thể chọn bao gồm các đoạn tệp tương đối với tệp hiện tại bằng cách sử dụng thẻ `include_relative`:

{% raw %}

```liquid
{% include_relative somedir/footer.html %}
```

{% endraw %}

Bạn sẽ không cần đặt nội dung được bao gồm của mình trong thư mục `_includes`. Thay vào đó,
việc bao gồm là cụ thể tương đối với tệp nơi thẻ đang được sử dụng. Ví dụ,
nếu `_posts/2014-09-03-my-file.markdown` sử dụng thẻ `include_relative`, tệp được bao gồm
phải nằm trong thư mục `_posts` hoặc một trong các thư mục con của nó.

Lưu ý rằng bạn không thể sử dụng cú pháp `../` để chỉ định vị trí bao gồm tham chiếu đến thư mục cấp cao hơn.

Tất cả các khả năng khác của thẻ `include` đều có sẵn cho thẻ `include_relative`,
chẳng hạn như các biến.

### Sử dụng tên biến cho tệp bao gồm

Tên của tệp bạn muốn nhúng có thể được chỉ định dưới dạng một biến thay vì tên tệp thực tế. Ví dụ, giả sử bạn đã xác định một biến trong front matter của trang của mình như thế này:

```yaml
---
title: Trang của tôi
my_variable: footer_company_a.html
---
```

Sau đó, bạn có thể tham chiếu biến đó trong thẻ include của mình:

{% raw %}

```liquid
{% if page.my_variable %}
  {% include {{ page.my_variable }} %}
{% endif %}
```

{% endraw %}

Trong ví dụ này, thẻ include sẽ chèn tệp `footer_company_a.html` từ thư mục `_includes/footer_company_a.html`.

### Truyền tham số cho includes

Bạn cũng có thể truyền tham số cho một thẻ include. Ví dụ, giả sử bạn có một tệp tên là `note.html` trong thư mục `_includes` của bạn chứa định dạng này:

{% raw %}

```liquid
<div markdown="span" class="alert alert-info" role="alert">
<i class="fa fa-info-circle"></i> <b>Lưu ý:</b>
{{ include.content }}
</div>
```

{% endraw %}

{% raw %}`{{ include.content }}`{% endraw %} là một tham số được điền khi bạn gọi thẻ include và chỉ định giá trị cho tham số đó, như thế này:

{% raw %}

```liquid
{% include note.html content="Đây là ghi chú mẫu của tôi." %}
```

{% endraw %}

Giá trị của `content` (là `Đây là ghi chú mẫu của tôi.`) sẽ được chèn vào tham số {% raw %}`{{ include.content }}`{% endraw %}.

Truyền tham số cho includes đặc biệt hữu ích khi bạn muốn ẩn định dạng phức tạp khỏi nội dung Markdown của mình.

Ví dụ, giả sử bạn có một cú pháp hình ảnh đặc biệt với định dạng phức tạp, và bạn không muốn các tác giả của mình phải nhớ định dạng phức tạp đó. Kết quả là, bạn quyết định đơn giản hóa định dạng bằng cách sử dụng một thẻ include với các tham số. Dưới đây là một ví dụ về cú pháp hình ảnh đặc biệt mà bạn có thể muốn điền bằng một thẻ include:

```html
<figure>
   <a href="https://jekyllrb.com">
   <img src="logo.png" style="max-width: 200px;"
      alt="Jekyll logo" />
   </a>
   <figcaption>Đây là logo Jekyll</figcaption>
</figure>
```

Bạn có thể tạo mẫu cho nội dung này trong thẻ include của mình và làm cho mỗi giá trị có sẵn dưới dạng một tham số, như thế này:

{% raw %}

```liquid
<figure>
   <a href="{{ include.url }}">
   <img src="{{ include.file }}" style="max-width: {{ include.max-width }};"
      alt="{{ include.alt }}"/>
   </a>
   <figcaption>{{ include.caption }}</figcaption>
</figure>
```

{% endraw %}

Thẻ include này chứa 5 tham số:

* `url`
* `max-width`
* `file`
* `alt`
* `caption`

Dưới đây là một ví dụ truyền tất cả các tham số cho thẻ include này (tệp include được đặt tên là `image.html`):

{% raw %}

```liquid
{% include image.html url="http://jekyllrb.com"
max-width="200px" file="logo.png" alt="Logo Jekyll"
caption="Đây là logo Jekyll." %}
```

{% endraw %}

Kết quả là mã HTML gốc được hiển thị trước đó.

To safeguard situations where users don't supply a value for the parameter, you can use [Liquid's default filter](https://shopify.github.io/liquid/filters/default/).
Để bảo vệ các tình huống mà người dùng không cung cấp giá trị cho tham số, bạn có thể sử dụng [bộ lọc default của Liquid](https://shopify.github.io/liquid/filters/default/).

Nhìn chung, bạn có thể tạo các thẻ include hoạt động như các mẫu cho nhiều mục đích sử dụng &mdash; chèn clip âm thanh hoặc video, cảnh báo, định dạng đặc biệt, và nhiều hơn nữa. Lưu ý rằng bạn nên tránh sử dụng quá nhiều thẻ include, vì điều này sẽ làm chậm thời gian xây dựng trang web của bạn. Ví dụ, đừng sử dụng thẻ include mỗi khi bạn chèn một hình ảnh. (Kỹ thuật trên cho thấy một trường hợp sử dụng cho các hình ảnh đặc biệt.)

### Truyền biến tham số cho includes

Giả sử tham số bạn muốn truyền cho thẻ include là một biến thay vì một chuỗi. Ví dụ, bạn có thể đang sử dụng {% raw %}`{{ site.product_name }}`{% endraw %} để tham chiếu đến mọi phiên bản của sản phẩm của bạn thay vì tên được mã hóa cứng thực tế. (Trong trường hợp này, tệp `_config.yml` của bạn sẽ có một khóa gọi là `product_name` với giá trị là tên sản phẩm của bạn.)

Chuỗi bạn truyền cho tham số include của mình không thể chứa dấu ngoặc nhọn. Ví dụ, bạn không thể truyền một tham số chứa điều này: {% raw %}`"Phiên bản mới nhất của {{ site.product_name }} hiện đã có sẵn."`{% endraw %}

Nếu bạn muốn bao gồm biến này trong tham số mà bạn truyền cho một thẻ include, bạn cần lưu trữ toàn bộ tham số dưới dạng một biến trước khi truyền nó cho thẻ include. Bạn có thể sử dụng thẻ `capture` để tạo biến:

{% raw %}

```liquid
{% capture download_note %}
Phiên bản mới nhất của {{ site.product_name }} hiện đã có sẵn.
{% endcapture %}
```

{% endraw %}

Sau đó truyền biến đã chụp này vào tham số cho thẻ include. Bỏ qua dấu ngoặc kép xung quanh nội dung tham số vì nó không còn là một chuỗi nữa (nó là một biến):

{% raw %}

```liquid
{% include note.html content=download_note %}
```

{% endraw %}
