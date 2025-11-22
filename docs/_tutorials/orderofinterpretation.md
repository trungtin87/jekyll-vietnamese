---
title: Thứ tự diễn giải
author: tomjoht
date: 2017-01-29 21:45:03 -0800
---

Công việc chính của Jekyll là chuyển đổi các tệp văn bản thô của bạn thành một trang web tĩnh. Nó thực hiện điều này bằng cách hiển thị Liquid, Markdown và các biến đổi khác khi nó tạo đầu ra HTML tĩnh.

Trong quá trình chuyển đổi này, điều quan trọng là phải hiểu thứ tự diễn giải của Jekyll. Bằng "thứ tự diễn giải", chúng tôi có nghĩa là cái gì được hiển thị, theo thứ tự nào và các quy tắc nào được áp dụng trong việc chuyển đổi nội dung.

Nếu một phần tử không chuyển đổi, bạn có thể khắc phục sự cố bằng cách phân tích thứ tự diễn giải.

## Thứ tự diễn giải

Jekyll chuyển đổi trang web của bạn theo thứ tự sau:

1. **Biến trang web**. Jekyll xem xét các tệp của bạn và điền [biến trang web]({% link _docs/variables.md %}), chẳng hạn như các đối tượng `site`, `page`, `post` và collection. (Từ các đối tượng này, Jekyll xác định các giá trị cho permalink, thẻ, danh mục và các chi tiết khác.)

2. **Liquid**. Jekyll xử lý bất kỳ định dạng [Liquid](https://github.com/Shopify/liquid) nào trong các trang có [front matter]({% link _docs/front-matter.md %}). Bạn có thể xác định Liquid như sau:
   * **Thẻ Liquid** bắt đầu bằng {% raw %}`{%`{% endraw %} và kết thúc bằng {% raw %}`%}`{% endraw %}. Ví dụ: {% raw %}`{% highlight %}`{% endraw %} hoặc {% raw %}`{% seo %}`{% endraw %}. Thẻ có thể định nghĩa khối hoặc nội tuyến. Thẻ định nghĩa khối cũng sẽ đi kèm với thẻ kết thúc tương ứng &mdash; ví dụ: {% raw %}`{% endhighlight %}`{% endraw %}.
   * **Biến Liquid** bắt đầu và kết thúc bằng dấu ngoặc nhọn kép. Ví dụ: {% raw %}`{{ site.myvariable }}`{% endraw %} hoặc {% raw %}`{{ content }}`{% endraw %}.
   * **Bộ lọc Liquid** bắt đầu bằng ký tự pipe (`|`) và chỉ có thể được sử dụng trong **biến Liquid** sau chuỗi biến. Ví dụ: bộ lọc `relative_url` trong {% raw %}`{{ "css/main.css" | relative_url }}`{% endraw %}.

3. **Markdown**. Jekyll chuyển đổi Markdown thành HTML bằng bộ lọc Markdown được chỉ định trong tệp cấu hình của bạn. Các tệp phải có phần mở rộng tệp Markdown và front matter để Jekyll chuyển đổi chúng.

4. **Bố cục**. Jekyll đẩy nội dung vào các bố cục được chỉ định bởi front matter của trang (hoặc như được chỉ định trong tệp cấu hình). Nội dung từ mỗi trang được đẩy vào các thẻ {% raw %}`{{ content }}`{% endraw %} trong các bố cục.

5. **Tệp**. Jekyll ghi nội dung đã tạo vào các tệp trong [cấu trúc thư mục]({% link _docs/structure.md %}) trong `_site`. Trang, bài đăng và bộ sưu tập được cấu trúc dựa trên cài đặt [permalink]({% link _docs/permalinks.md %}) của chúng. Các thư mục bắt đầu bằng `_` (chẳng hạn như `_includes` và `_data`) thường bị ẩn trong đầu ra.

## Các tình huống mà cấu hình không chính xác tạo ra vấn đề

Phần lớn, bạn không phải nghĩ về thứ tự diễn giải khi xây dựng trang web Jekyll của mình. Những chi tiết này chỉ trở nên quan trọng khi biết khi có gì đó không hiển thị.

Các tình huống sau đây làm nổi bật các vấn đề tiềm ẩn bạn có thể gặp phải. Những vấn đề này đến từ việc hiểu sai thứ tự diễn giải và có thể được sửa chữa dễ dàng.

### Biến trên trang không được hiển thị vì biến được gán trong bố cục

Trong tệp bố cục của bạn (`_layouts/default.html`), giả sử bạn có một biến được gán:

{% raw %}

```liquid
{% assign myvar = "joe" %}
```

{% endraw %}

Trên một trang sử dụng bố cục, bạn tham chiếu biến đó:

{% raw %}

```liquid
{{ myvar }}
```

{% endraw %}

Biến sẽ không hiển thị vì thứ tự diễn giải của trang là hiển thị Liquid trước và sau đó xử lý Bố cục. Khi việc hiển thị Liquid xảy ra, việc gán biến không có sẵn.

Để làm cho mã hoạt động, bạn có thể đặt việc gán biến vào front matter của trang.

### Markdown trong tệp include không được xử lý

Giả sử bạn có một tệp Markdown tại `_includes/mycontent.md`. Trong tệp Markdown, bạn có một số định dạng Markdown:

```markdown
This is a list:
* first item
* second item
```

Bạn bao gồm tệp vào một tệp HTML như sau:

{% raw %}

```liquid
{% include mycontent.md %}
```

{% endraw %}

Markdown không được xử lý vì trước tiên Liquid (thẻ `include`) được xử lý, chèn `mycontent.md` vào tệp HTML. *Sau đó* Markdown sẽ được xử lý.

Nhưng vì nội dung được bao gồm vào một trang *HTML*, Markdown không được hiển thị. Bộ lọc Markdown chỉ xử lý nội dung trong các tệp Markdown.

Để làm cho mã hoạt động, hãy sử dụng định dạng HTML trong các include được chèn vào các tệp HTML.

Lưu ý rằng các thẻ `highlight` không yêu cầu Markdown để xử lý. Giả sử include của bạn chứa như sau:

{% raw %}

```liquid
{% highlight javascript %}
console.log('alert');
{% endhighlight %}
```

{% endraw %}

Thẻ `highlight` *là* Liquid. (Liquid chuyển nội dung cho Rouge để làm nổi bật cú pháp.) Kết quả là, mã này sẽ thực sự chuyển đổi thành HTML với làm nổi bật cú pháp. Jekyll không cần bộ lọc Markdown để xử lý các thẻ `highlight`.

### Liquid trộn với JavaScript không được hiển thị

Giả sử bạn cố gắng trộn thẻ `assign` của Liquid với JavaScript, như thế này:

{% raw %}

```javascript
<button onclick="someFunction()">Click me</button>

<p id="intro"></p>

<script>
{% assign someContent = "This is some content" %}
function someFunction() {
    document.getElementById("intro").innerHTML = someContent;
}
</script>
```

{% endraw %}

Điều này sẽ không hoạt động vì thẻ `assign` chỉ có sẵn trong giai đoạn hiển thị Liquid của trang web. Trong ví dụ JavaScript này, script thực thi khi người dùng nhấp vào nút ("Click me") trên trang HTML. Vào thời điểm đó, logic Liquid không còn khả dụng nữa, vì vậy thẻ `assign` sẽ không trả về gì.

Tuy nhiên, bạn có thể sử dụng các biến trang web của Jekyll hoặc Liquid để *điền* một script được thực thi sau đó. Ví dụ: giả sử bạn có thuộc tính sau trong front matter của mình: `someContent: "This is some content"`. Bạn có thể làm như sau:

{% raw %}

```javascript
<button onclick="someFunction()">Click me</button>

<p id="intro"></p>

<script>

function someFunction() {
    document.getElementById("intro").innerHTML = "{{ page.someContent }}";
}
</script>
```

{% endraw %}

Khi Jekyll xây dựng trang web, thuộc tính `someContent` này điền các giá trị của script, chuyển đổi {% raw %}`{{ page.someContent }}`{% endraw %} thành `"This is some content"`.

Điều quan trọng cần nhớ là Liquid hiển thị khi Jekyll xây dựng trang web của bạn. Liquid không có sẵn tại thời gian chạy trong trình duyệt khi người dùng thực thi một sự kiện.

## Lưu ý về việc sử dụng Liquid trong YAML

Có một chi tiết nữa cần nhớ: Liquid không hiển thị khi được nhúng trong các tệp YAML hoặc front matter. (Điều này không liên quan đến thứ tự diễn giải, nhưng đáng đề cập vì đây là một câu hỏi phổ biến về hiển thị phần tử.)

Ví dụ: giả sử bạn có thẻ `highlight` trong tệp `_data/mydata.yml` của mình:

{% raw %}

```liquid
myvalue: >
  {% highlight javascript %}
  console.log('alert');
  {% endhighlight %}
```

{% endraw %}

Trên một trang, bạn cố gắng chèn giá trị:

{% raw %}

```liquid
{{ site.data.mydata.myvalue }}
```

{% endraw %}

Điều này sẽ chỉ hiển thị dưới dạng chuỗi thay vì một mẫu mã với làm nổi bật cú pháp. Để làm cho mã hiển thị, hãy xem xét sử dụng include thay thế.

