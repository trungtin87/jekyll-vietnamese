---
title: Chuyển đổi trang web HTML sang Jekyll
author: tomjoht
date: 2017-02-10 21:58:56 -0800
---

Nếu bạn đang tìm kiếm giao diện cho trang web Jekyll của mình, bạn không phải giới hạn bản thân với các giao diện Jekyll hiện có. Khá dễ dàng để chuyển đổi hầu hết bất kỳ tệp HTML tĩnh nào thành một trang web Jekyll.

Theo nhiều cách, bất kỳ trang web nào hiện đang là trang web tĩnh *đã* là một trang web Jekyll. Jekyll chỉ cho phép bạn tự động hóa các phần của trang web (như chèn các trang vào template, hiển thị danh sách để điều hướng, tạo nguồn cấp dữ liệu và sơ đồ trang web, v.v.) khi nó xử lý các tệp.

Hiểu cách chuyển đổi bất kỳ trang web HTML nào thành template Jekyll sẽ mở ra thế giới của bạn với nhiều tùy chọn hơn cho các giao diện Jekyll. Thay vì [tìm kiếm trực tuyến các *giao diện Jekyll*](https://duckduckgo.com/?q=Jekyll+themes), bạn có thể chọn từ nhiều template HTML cho trang web của mình, nhanh chóng Jekyll-hóa các template HTML khi bạn cần và xây dựng đầu ra với Jekyll.

Mặc dù các trang web có thể có các tính năng và điều khiển phức tạp, chúng ta sẽ giữ mọi thứ đơn giản trong hướng dẫn này.

## Trang web Jekyll là gì?

Đầu tiên, hãy bắt đầu với nền tảng cơ bản. Tách một trang web Jekyll xuống mức cơ bản nhất sẽ giúp làm rõ những gì xảy ra trong một trang web Jekyll. Nếu bạn chưa cài đặt gem jekyll, [hãy cài đặt nó]({% link _docs/installation.md %}).

Chúng ta sẽ bắt đầu với một *trang web Jekyll cơ bản* bao gồm ba tệp:

```
.
├── _config.yml
├── _layouts
│   └── default.html
└── index.md
```

Tạo thủ công ba tệp này trong một thư mục có tên `my_jekyll_site` hoặc bất cứ tên nào phù hợp nhất với bạn, và đặt `default.html` bên trong một thư mục có tên `_layouts`.

```sh
touch _config.yml index.md default.html
mkdir _layouts && mv default.html _layouts
```

Khởi động trình soạn thảo yêu thích của bạn và điền nội dung của các tệp `default.html` và `index.md` như sau:

**_config.yml**

```yaml
name: Trang web Jekyll của tôi
```

**_layouts/default.html**

{% raw %}

```html
<!DOCTYPE html>
<html>
  <body>
     {{ content }}
  </body>
</html>
```

{% endraw %}

**index.md**

{% raw %}

```markdown
---
title: Trang của tôi
layout: default
---

# {{ page.title }}

Nội dung được viết bằng [Markdown](https://learnxinyminutes.com/docs/markdown/).
Định dạng văn bản thuần túy cho phép bạn tập trung vào **nội dung** của mình.

<!--
Bạn có thể sử dụng các phần tử HTML trong Markdown, chẳng hạn như phần tử comment, và chúng sẽ không
bị ảnh hưởng bởi trình phân tích markdown. Tuy nhiên, nếu bạn tạo một phần tử HTML trong
tệp markdown của mình, bạn không thể sử dụng cú pháp markdown trong nội dung của phần tử đó.
-->
```

{% endraw %}

Bây giờ `cd` vào `my_jekyll_site` và phục vụ trang web với máy chủ tích hợp:

```sh
cd my_jekyll_site
jekyll serve
```

{: .note .info}
Nếu bạn có Gemfile, [hãy sử dụng Bundler](/docs/ruby-101/#bundler) bằng cách nhập `bundle exec jekyll serve` thay thế.

Khi bạn phục vụ trang web, bạn nhận được URL xem trước như `http://127.0.0.1:4000/` (giống với `http://localhost:4000/`). Các tệp của trang web được xây dựng vào thư mục `_site` theo mặc định.

Đây là một trang web Jekyll ở cấp độ chức năng cơ bản nhất. Đây là những gì đang xảy ra:

* Tệp `_config.yml` chứa các cài đặt mà Jekyll sử dụng khi xử lý trang web của bạn. Một tệp cấu hình trống sẽ sử dụng các giá trị mặc định để xây dựng trang web Jekyll. Ví dụ: để chuyển đổi [Markdown](https://learnxinyminutes.com/docs/markdown/) thành HTML, Jekyll sẽ tự động sử dụng [bộ lọc Markdown kramdown](https://rubygems.org/gems/kramdown/), mà không cần chỉ định nó.
* Jekyll tìm kiếm các tệp có [thẻ front matter]({% link _docs/front-matter.md %}) (hai bộ dòng gạch ngang `---` như trong `index.md`) và xử lý các tệp (điền các biến trang web, hiển thị bất kỳ [Liquid](https://shopify.github.io/liquid/) nào và chuyển đổi Markdown thành HTML).
* Jekyll đẩy nội dung từ tất cả các trang và bài đăng vào biến {% raw %}`{{ content }}`{% endraw %} trong bố cục được chỉ định (`default`) trong các thẻ front matter.
* Các tệp đã xử lý được ghi dưới dạng tệp `.html` trong thư mục `_site`.

Bạn có thể đọc thêm về cách Jekyll xử lý các tệp trong [thứ tự Diễn giải]({% link _tutorials/orderofinterpretation.md %}).

Với sự hiểu biết cơ bản này về cách hoạt động của trang web Jekyll, bạn có thể chuyển đổi hầu hết bất kỳ giao diện HTML nào cho Jekyll. Các phần sau đây sẽ hướng dẫn bạn từng bước để làm như vậy.

## 1. Tạo template cho bố cục mặc định của bạn

Tìm giao diện HTML của bạn và lưu nó dưới dạng bố cục `default`. Nếu bạn đang chuyển đổi hoặc sao chép một trang web hiện có, bạn có thể nhấp chuột phải vào trang và xem mã nguồn.

Ví dụ: giả sử bạn đang sao chép trang web công ty của mình để tạo một trang web tài liệu với cùng thương hiệu. Hoặc giả sử bạn có một trang web cá nhân mà bạn đã xây dựng bằng HTML và bây giờ muốn biến nó thành một trang web Jekyll. Lấy mã nguồn HTML cho trang web của bạn.

{: .note .info}
Bất kể trang web nào, hãy kiểm tra giấy phép và đảm bảo bạn có quyền sao chép và sử dụng mã.

Sao chép và dán mã nguồn vào một tệp có tên `default.html`. Đặt tệp `default.html` bên trong thư mục `_layouts`. Đây sẽ là template bố cục mặc định cho các trang và bài đăng của bạn &mdash; tức là, mỗi trang hoặc bài đăng sẽ sử dụng bố cục này khi Jekyll xây dựng trang web.

Lưu ý rằng khi tìm kiếm template, bạn muốn đầu ra HTML của template. Nếu template có thẻ PHP hoặc các script động khác, các phần tử động này sẽ cần được chuyển đổi thành HTML hoặc thành [Liquid](https://shopify.github.io/liquid/). Liquid là [hệ thống template Jekyll](/docs/liquid/) để lấy nội dung động.

Mở `default.html` vào trình duyệt của bạn cục bộ để đảm bảo trang web trông và hoạt động giống như trực tuyến. Bạn có thể sẽ cần điều chỉnh đường dẫn CSS, JS và hình ảnh để chúng hoạt động.

Ví dụ: nếu các đường dẫn là tương đối trên trang web bạn đã sao chép, bạn sẽ cần tải xuống cùng các tài sản vào trang web Jekyll của mình hoặc sử dụng đường dẫn tuyệt đối đến cùng các tài sản trên đám mây. (Cú pháp như `src="//` yêu cầu tiền tố như `src="http://` để hoạt động trong trình duyệt cục bộ của bạn.)

Jekyll cung cấp một số [bộ lọc](/docs/liquid/filters/) để thêm URL trang web trước đường dẫn. Ví dụ: bạn có thể thêm tiền tố cho stylesheet của mình như thế này:

{% raw %}

```liquid
{{ "/assets/style.css" | relative_url }}
```

{% endraw %}

Bộ lọc `relative_url` sẽ thêm tiền tố giá trị [`baseurl`](https://byparker.com/blog/2014/clearing-up-confusion-around-baseurl/) từ tệp cấu hình của bạn (ví dụ: `blog`) vào đầu vào. Điều này hữu ích nếu trang web của bạn được lưu trữ tại một đường dẫn con thay vì tại gốc của tên miền (ví dụ: `http://mysite.com/blog/`).

Bạn cũng có thể sử dụng bộ lọc `absolute_url`. Bộ lọc này sẽ thêm tiền tố giá trị `url` *và* `baseurl` vào đầu vào:

{% raw %}

```liquid
{{ "/assets/style.css" | absolute_url }}
```

{% endraw %}

Một lần nữa, cả `url` và `baseurl` đều có thể được định nghĩa trong tệp cấu hình của trang web của bạn, như thế này:

```yaml
url: http://mysite.com
baseurl: /blog
```

Kết quả trong đầu ra sẽ là `http://mysite.com/blog/assets/style.css`.

Lưu ý rằng thuộc tính `url` của bất kỳ trang nào bắt đầu bằng dấu gạch chéo (`/`), vì vậy hãy bỏ qua điều này ở cuối thuộc tính `url` hoặc `baseurl` của bạn.

Bạn không phải thêm tiền tố bộ lọc vào đường dẫn liên kết như thế này. Bạn cũng có thể sử dụng liên kết tương đối trên toàn bộ trang web của mình. Tuy nhiên, bạn quyết định mã hóa đường dẫn đến tài sản của mình như thế nào, hãy đảm bảo chúng hiển thị chính xác.

Trang `default.html` cục bộ của bạn có trông đẹp trong trình duyệt của bạn không? Tất cả hình ảnh, kiểu và các yếu tố khác có hiển thị chính xác không? Nếu vậy, tuyệt vời. Tiếp tục. Bạn có thể sử dụng template này làm bố cục cho tất cả các trang và bài đăng của mình hoặc tạo bao nhiêu template tùy thích.

Trong phần tiếp theo, bạn sẽ xóa trống nội dung của bố cục và thay thế nó bằng các thẻ giữ chỗ được điền động với các trang Jekyll của bạn.

## 2. Xác định phần nội dung của bố cục

Trong `default.html`, tìm nơi nội dung trang bắt đầu (thường là ở thẻ `h1` hoặc `h2`). Thay thế tiêu đề xuất hiện bên trong các thẻ này bằng {% raw %}`{{ page.title }}`{% endraw %}.

Xóa phần nội dung (giữ mọi thứ khác: menu điều hướng, thanh bên, chân trang, v.v.) và thay thế nó bằng {% raw %}`{{ content }}`{% endraw %}.

Kiểm tra lại bố cục trong trình duyệt của bạn và đảm bảo bạn không làm hỏng hoặc thay đổi nó bằng cách vô tình xóa thẻ `div` quan trọng hoặc phần tử khác. Thay đổi duy nhất phải là tiêu đề và nội dung trang, hiện đang bị xóa trống hoặc hiển thị thẻ giữ chỗ.

## 3. Tạo một vài tệp với thẻ front matter

Tạo một vài tệp (`index.md` và `about.md`) trong thư mục gốc của bạn.

Trong tệp `index.md` của bạn, thêm một số thẻ front matter chứa thuộc tính `title` và `layout`, như thế này:

```markdown
---
title: Trang chủ
layout: default
---

Một số nội dung trang ở đây...
```

Tạo một trang khác để thử nghiệm có tên `about.md` với các thẻ front matter tương tự.

{: .note .info}
Nếu bạn không chỉ định bố cục trong các trang của mình, Jekyll sẽ chỉ hiển thị trang đó dưới dạng trang HTML cơ bản không có kiểu.

## 4. Thêm tệp cấu hình

Thêm tệp `_config.yml` trong thư mục gốc của bạn. Trong `_config.yml`, bạn có thể tùy chọn chỉ định bộ lọc markdown bạn muốn. Theo mặc định, [bộ xử lý GitHub Flavored Markdown (GFM)](https://github.com/kramdown/parser-gfm) cho [kramdown](https://kramdown.gettalong.org/) được sử dụng. Nếu không có bộ lọc nào khác được chỉ định, tệp cấu hình của bạn sẽ tự động áp dụng như sau dưới dạng cài đặt [mặc định](/docs/configuration/default/):

```yaml
markdown: kramdown
kramdown:
  input: GFM
```

Bạn có thể tìm thấy thêm [Tùy chọn Markdown](/docs/configuration/markdown/) trong tài liệu Jekyll, mặc dù không chắc bạn sẽ cần chúng.

## 5. Kiểm tra các trang của bạn

Bây giờ chạy `jekyll serve` và chuyển đổi giữa các trang `index.html` và `about.html` của bạn. Bố cục mặc định sẽ tải cho cả hai trang.

Bây giờ bạn đã trích xuất nội dung của mình ra các tệp riêng biệt và định nghĩa một bố cục chung cho các trang.

Bạn có thể định nghĩa bất kỳ số lượng bố cục nào bạn muốn cho các trang. Sau đó chỉ cần xác định bố cục bạn muốn trang cụ thể đó sử dụng. Ví dụ:

```yaml
---
title: Trang mẫu
layout: homepage
---
```

Trang này sau đó sẽ sử dụng template `homepage.html` trong thư mục `_layouts`.

Bạn thậm chí có thể đặt [thẻ front matter mặc định](/docs/configuration/front-matter-defaults/) cho các trang, bài đăng hoặc [bộ sưu tập]({% link _docs/collections.md %}) trong tệp `_config.yml` của bạn để bạn không phải chỉ định bố cục trong các biến front matter. Dù sao, việc đặt mặc định nằm ngoài phạm vi của hướng dẫn này, hãy quay lại làm việc.

## 6. Cấu hình biến trang web

Bạn đã cấu hình tiêu đề trang bằng thẻ {% raw %}`{{ page.title }}`{% endraw %}. Nhưng còn nhiều thẻ `title` hơn để điền. Các trang cũng có thẻ [`title`](https://moz.com/learn/seo/title-tag) xuất hiện trong tab hoặc cửa sổ trình duyệt. Thông thường bạn đặt tiêu đề trang theo sau là tiêu đề trang web ở đây.

Trong bố cục `default.html` của bạn, tìm thẻ `title` bên dưới thẻ `head` của bạn:

```
<title>Trang web ACME</title>
```

Chèn các biến trang web sau:

{% raw %}

```liquid
<title>{{ page.title }} | {{ site.title }}</title>
```

{% endraw %}

Mở `_config.yml` và thêm thuộc tính `title` cho tên trang web của bạn.

```yaml
title: Trang web ACME
```

Bất kỳ thuộc tính nào bạn thêm trong tệp `_config.yml` của mình đều có thể truy cập thông qua không gian tên `site`. Tương tự, bất kỳ thuộc tính nào trong front matter của trang của bạn đều có thể truy cập thông qua không gian tên `page`. Sử dụng ký hiệu dấu chấm sau `site` hoặc `page` để truy cập giá trị.

Dừng máy chủ Jekyll của bạn bằng <kbd>Ctrl</kbd> + <kbd>C</kbd> và khởi động lại nó. Xác minh rằng các thẻ `title` đang được điền chính xác.

{: .note .info}
Mỗi khi bạn sửa đổi tệp cấu hình của mình, bạn phải khởi động lại Jekyll để các thay đổi có hiệu lực. Khi bạn sửa đổi các tệp khác, Jekyll tự động nhận các thay đổi khi nó xây dựng lại.

Nếu bạn có các biến khác để điền vào trang web của mình, hãy lặp lại.

## 7. Hiển thị bài đăng trên một trang

Thông thường là hiển thị danh sách các bài đăng trên trang chủ. Đầu tiên, hãy tạo một số bài đăng để chúng ta có thứ để trưng bày.

Thêm một số bài đăng trong thư mục `_posts` theo định dạng bài đăng tiêu chuẩn `YYYY-MM-DD-title.md`:

* `2017-01-02-my-first-post.md`
* `2017-01-15-my-second-post.md`
* `2017-02-08-my-third-post.md`

Trong mỗi bài đăng, thêm một số nội dung cơ bản:

```markdown
---
title: Bài đăng đầu tiên của tôi
layout: default
---

Một số nội dung mẫu...
```

Bây giờ hãy tạo một bố cục sẽ hiển thị các bài đăng. Tạo một tệp mới trong `_layouts` có tên `home.html` và thêm logic sau:

{% raw %}

```liquid
---
layout: default
---

{{ content }}
<ul class="myposts">
{% for post in site.posts %}
    <li><a href="{{ post.url }}">{{ post.title}}</a>
    <span class="postDate">{{ post.date | date: "%b %-d, %Y" }}</span>
    </li>
{% endfor %}
</ul>
```

{% endraw %}

Tạo một tệp có tên `blog.md` trong thư mục gốc của bạn và chỉ định bố cục `home`:

```yaml
---
title: Blog
layout: home
---
```

Trong trường hợp này, nội dung của `blog.md` sẽ được đẩy vào thẻ {% raw %}`{{ content }}`{% endraw %} trong bố cục `home`. Sau đó bố cục `home` sẽ được đẩy vào thẻ {% raw %}`{{ content }}`{% endraw %} của bố cục `default`.

### Cách hoạt động của bố cục

Khi một bố cục chỉ định một bố cục khác, điều đó có nghĩa là nội dung của bố cục đầu tiên sẽ được nhồi vào thẻ {% raw %}`{{ content }}`{% endraw %} của bố cục thứ hai. Như một phép loại suy, hãy nghĩ về búp bê Nga vừa vặn vào nhau. Mỗi bố cục vừa vặn vào một bố cục khác mà nó chỉ định.

Sơ đồ sau đây cho thấy cách hoạt động của bố cục trong Jekyll:

<img src="../../img/jekylllayoutconcept.png" alt="Khái niệm bố cục Jekyll" />

{: .image-description}
Trong ví dụ này, nội dung từ tài liệu Markdown `document.md` chỉ định `layout: docs` được đẩy vào thẻ {% raw %}`{{ content }}`{% endraw %} của tệp bố cục `docs.html`. Vì bố cục `docs` tự chỉ định `layout: page`, nội dung từ `docs.html` được đẩy vào thẻ {% raw %}`{{ content }}`{% endraw %} trong tệp bố cục `page.html`. Cuối cùng vì bố cục `page` chỉ định `layout: default`, nội dung từ `page.html` được đẩy vào thẻ {% raw %}`{{ content }}`{% endraw %} của tệp bố cục `default.html`.

Bạn không cần nhiều bố cục. Bạn chỉ có thể sử dụng một: `default`. Bạn có các tùy chọn về cách bạn thiết kế trang web của mình. Nói chung, thông thường là định nghĩa một bố cục cho các trang và một bố cục khác cho các bài đăng, nhưng cả hai bố cục này đều kế thừa template `default` (thường định nghĩa các phần trên và dưới của trang web).

Trong trình duyệt của bạn, hãy truy cập `blog.html` và xem danh sách các bài đăng.
Lưu ý rằng bạn không phải sử dụng phương pháp được mô tả ở đây. Bạn có thể chỉ cần thêm vòng lặp `for` vào bất kỳ trang nào, chẳng hạn như `index.md`, để hiển thị các bài đăng này. Nhưng với việc bạn có thể có logic phức tạp hơn cho các tính năng khác, có thể hữu ích khi lưu trữ logic của bạn trong các template riêng biệt với khu vực trang nơi bạn thường xuyên nhập nội dung của mình.

{: .note .info}
Ở mức tối thiểu, một bố cục phải chứa {% raw %}`{{ content }}`{% endraw %}, hoạt động như một bộ nhận cho *nội dung* được hiển thị.

### Vòng lặp For

Nhân tiện, hãy tạm dừng ở đây để xem xét logic vòng lặp `for` kỹ hơn một chút. [Vòng lặp For trong Liquid](https://shopify.github.io/liquid/tags/iteration/) là một trong những thẻ Liquid được sử dụng phổ biến nhất. *Vòng lặp For* cho phép bạn lặp qua nội dung trong trang web Jekyll của bạn và xây dựng kết quả. Vòng lặp `for` cũng có [các thuộc tính nhất định có sẵn](https://help.shopify.com/themes/liquid/objects/for-loops) (như lần lặp đầu tiên hoặc cuối cùng) dựa trên vị trí của vòng lặp trong vòng lặp.

Chúng ta chỉ mới chạm bề mặt những gì bạn có thể làm với vòng lặp `for` trong việc lấy các bài đăng. Ví dụ: nếu bạn muốn hiển thị các bài đăng từ một danh mục cụ thể, bạn có thể làm như vậy bằng cách thêm thuộc tính `categories` vào front matter của bài đăng của bạn và sau đó tìm trong các danh mục đó. Hơn nữa, bạn có thể giới hạn số lượng kết quả bằng cách thêm thuộc tính `limit`. Đây là một ví dụ:

{% raw %}

```liquid
<ul class="myposts">
{% for post in site.categories.podcasts limit:3 %}
    <li><a href="{{ post.url }}">{{ post.title}}</a>
    <span class="postDate">{{ post.date | date: "%b %-d, %Y" }}</span>
    </li>
{% endfor %}
</ul>
```

{% endraw %}

Vòng lặp này sẽ lấy ba bài đăng mới nhất có danh mục gọi là `podcasts` trong front matter.

## 8. Cấu hình điều hướng

Bây giờ bạn đã cấu hình các bài đăng, hãy cấu hình điều hướng trang. Hầu hết các trang web đều có một số điều hướng trong thanh bên hoặc khu vực tiêu đề.

Trong hướng dẫn này, chúng ta sẽ giả sử bạn có một danh sách đơn giản các trang bạn muốn tạo. Nếu bạn chỉ có một số trang, bạn có thể liệt kê chúng bằng cách sử dụng vòng lặp `for` để lặp qua đối tượng `site.pages` và sau đó sắp xếp chúng theo thuộc tính front matter.

Xác định phần mã của bạn nơi danh sách các trang xuất hiện. Thông thường đây là một phần tử `<ul>` với các phần tử con `<li>` khác nhau. Thay thế mã bằng như sau:

{% raw %}

```liquid
<ul>
  {% assign mypages = site.pages | sort: "order" %}
    {% for page in mypages %}
    <li><a href="{{ page.url | absolute_url }}">{{ page.title }}</a></li>
    {% endfor %}
</ul>
```

{% endraw %}

Ví dụ này giả định mỗi trang sẽ có front matter chứa cả thuộc tính `title` và `order` như thế này:

```yaml
---
title: Trang của tôi
order: 2
---
```

Ở đây thuộc tính `order` sẽ xác định cách các trang được sắp xếp, với `1` xuất hiện đầu tiên trong danh sách.

Bạn cũng có thể lặp qua danh sách các trang mà bạn duy trì trong một tệp dữ liệu riêng biệt. Điều này có thể phù hợp hơn nếu bạn có nhiều trang hoặc bạn có các thuộc tính khác về các trang bạn muốn lưu trữ.

Để quản lý liên kết trang theo cách này, hãy tạo một thư mục trong dự án Jekyll của bạn có tên `_data`. Trong thư mục này, tạo một tệp có tên ví dụ: `navigation.yml` với nội dung này:

```yaml
- title: Trang mẫu 1
  url: /page-1-permalink/

- title: Trang mẫu 2
  url: /page-2-permalink/

- title: Trang mẫu 3
  url: /page-3-permalink/
```

{: .note .info}
Nếu bạn chưa bao giờ viết YAML trước đây, bạn sẽ nhanh chóng làm quen với nó. Hãy xem [những gì bạn có thể làm với YAML](https://learnxinyminutes.com/docs/yaml/).

Bạn có thể lưu trữ các thuộc tính bổ sung cho mỗi mục trong tệp dữ liệu này theo mong muốn. Sắp xếp các mục danh sách theo thứ tự bạn muốn chúng xuất hiện.

Để in danh sách các trang từ tệp dữ liệu, hãy sử dụng mã như thế này:

{% raw %}

```liquid
<ul>
    {% for link in site.data.navigation %}
    <li><a href="{{ link.url }}">{{ link.title }}</a></li>
    {% endfor %}
</ul>
```

{% endraw %}

Nếu bạn có yêu cầu phức tạp hơn về điều hướng, chẳng hạn như khi xây dựng trang web tài liệu, hãy xem [hướng dẫn chi tiết về điều hướng](/tutorials/navigation/).

## 9. Đơn giản hóa trang web của bạn với includes

Giả sử tệp `default.html` của bạn rất lớn và khó làm việc. Bạn có thể chia bố cục của mình bằng cách đặt một số mã HTML trong các tệp *include*.

Thêm một thư mục có tên `_includes` trong thư mục gốc của bạn. Trong thư mục đó, thêm một tệp có tên `sidebar.html`.

Xóa mã thanh bên của bạn khỏi bố cục `default.html` và chèn nó vào tệp `sidebar.html`.

Nơi mã thanh bên trước đây tồn tại trong `default.html`, kéo "include" của bạn như thế này:

{% raw %}

```liquid
{% include sidebar.html %}
```

{% endraw %}

Bạn có thể chia các yếu tố khác của giao diện của mình như thế này, chẳng hạn như tiêu đề hoặc chân trang của bạn. Sau đó, bạn có thể áp dụng các yếu tố chung này cho các tệp bố cục khác. Bằng cách này, bạn sẽ không có mã trùng lặp.

## 10. Nguồn cấp RSS

Trang web Jekyll của bạn cần một nguồn cấp RSS. Đây là [cú pháp nguồn cấp RSS cơ bản](http://www.w3schools.com/xml/xml_rss.asp). Để tạo tệp RSS trong Jekyll, hãy tạo một tệp có tên `feed.xml` trong thư mục gốc của bạn và thêm như sau:

{% raw %}

```liquid
---
layout: null
---

<?xml version="1.0" encoding="UTF-8" ?>
<rss version="2.0" xmlns:atom="http://www.w3.org/2005/Atom">

    <channel>
        <title>{{ site.title }}</title>
        <link>{{ site.url }}</link>
        <atom:link href="{{ page.url | prepend: site.url }}" rel="self" type="application/rss+xml" />
        <description>{{ site.description }}</description>
        <lastBuildDate>{{ site.time | date_to_rfc822 }}</lastBuildDate>
        {% for post in site.posts %}
        <item>
            <title>{{ post.title }}</title>
            <link>
                {{ post.url | prepend: site.url }}
            </link>
            <description>
                {{ post.content | escape | truncate: '400' }}
            </description>
            <pubDate>{{ post.date | date_to_rfc822 }}</pubDate>
            <guid>
                {{ post.url | prepend: site.url }}
            </guid>
        </item>
        {% endfor %}
    </channel>
</rss>
```

{% endraw %}

Đảm bảo tệp `_config.yml` của bạn có các thuộc tính cho `title`, `url` và `description`.

Mã này sử dụng vòng lặp `for` để xem qua 20 bài đăng cuối cùng của bạn. Nội dung từ các bài đăng được thoát và cắt ngắn xuống 400 ký tự cuối cùng bằng cách sử dụng [bộ lọc Liquid](https://help.shopify.com/themes/liquid/filters).

Trong bố cục `default.html` của bạn, tìm tham chiếu đến nguồn cấp RSS hoặc Atom trong tiêu đề của bạn và thay thế nó bằng tham chiếu đến tệp bạn vừa tạo. Ví dụ:

{% raw %}

```liquid
<link rel="alternate" type="application/rss+xml"  href="{{ site.url }}/feed.xml" title="{{ site.title }}">
```

{% endraw %}

Bạn cũng có thể tự động tạo nguồn cấp bài đăng của mình bằng cách thêm một gem có tên [`jekyll-feed`](https://help.github.com/articles/atom-rss-feeds-for-github-pages/). Gem này cũng sẽ hoạt động trên GitHub Pages.

## 11. Thêm sơ đồ trang web

Cuối cùng, thêm một [sơ đồ trang web](https://www.sitemaps.org/protocol.html). Tạo tệp `sitemap.xml` trong thư mục gốc của bạn và thêm mã này:

{% raw %}

```liquid
---
layout: null
search: exclude
---

<?xml version="1.0" encoding="UTF-8"?>
<urlset xmlns="http://www.sitemaps.org/schemas/sitemap/0.9">

    {% for page in site.pages %}
    <url>
        <loc>{{page.url}}</loc>
        <lastmod>{{site.time | date: '%Y-%m-%d' }}</lastmod>
        <changefreq>daily</changefreq>
        <priority>0.5</priority>
    </url>
    {% endfor %}

    {% for post in site.posts %}
    <url>
        <loc>{{post.url}}</loc>
        <lastmod>{{site.time | date: '%Y-%m-%d' }}</lastmod>
        <changefreq>daily</changefreq>
        <priority>0.5</priority>
    </url>
    {% endfor %}

</urlset>
```

{% endraw %}

Một lần nữa, chúng ta đang sử dụng vòng lặp `for` ở đây để lặp qua tất cả các bài đăng và trang để thêm chúng vào sơ đồ trang web.

Bạn cũng có thể tự động tạo sơ đồ trang web của mình bằng cách thêm một gem có tên [`jekyll-sitemap`](https://help.github.com/articles/sitemaps-for-github-pages/). Gem này cũng sẽ hoạt động trên GitHub Pages.

## 12. Thêm dịch vụ bên ngoài

Đối với các dịch vụ khác bạn có thể cần (chẳng hạn như biểu mẫu liên hệ, tìm kiếm, nhận xét và hơn thế nữa), [hãy tìm kiếm các dịch vụ bên thứ ba](https://serverless.css-tricks.com/services/major). Chúng tôi đã liệt kê một số [tích hợp trên trang tài nguyên của chúng tôi](/resources/#integrations) nhưng trong thế giới SaaS và API ngày nay, danh sách là vô tận.

Các trang Jekyll của bạn bao gồm HTML, CSS và JavaScript, vì vậy hầu hết bất kỳ mã nào bạn cần nhúng sẽ hoạt động mà không có vấn đề gì.

Khi bạn tích hợp mã cho các dịch vụ này, lưu ý rằng **nếu một trang trong trang web Jekyll của bạn không có thẻ front matter, Jekyll sẽ không xử lý bất kỳ nội dung nào trong trang đó.** Trang sẽ chỉ được chuyển vào thư mục `_site` khi bạn xây dựng trang web của mình.

Nếu bạn muốn Jekyll xử lý một số nội dung trang (ví dụ: để điền một biến mà bạn định nghĩa trong tệp cấu hình của trang web của mình), chỉ cần thêm thẻ front matter vào trang. Nếu bạn không muốn bất kỳ bố cục nào được áp dụng cho trang, hãy chỉ định `layout: null` như thế này:

```yaml
---
layout: null
---
```

## 13. Kết luận

Mặc dù các trang web có thể triển khai các tính năng và chức năng phức tạp hơn, chúng tôi đã đề cập đến những điều cơ bản trong hướng dẫn này. Bây giờ bạn đã có một trang web Jekyll hoạt động đầy đủ.

Để triển khai trang web của bạn, hãy xem xét sử dụng [GitHub Pages](https://pages.github.com/), [Netlify](https://www.netlify.com/), [Vercel](https://vercel.com), [Render](https://render.com), [Amazon AWS S3](https://aws.amazon.com/s3/) sử dụng [plugin s3_website](https://github.com/laurilehmijoki/s3_website), hoặc chỉ cần FTP các tệp của bạn lên máy chủ web của bạn.

Bạn cũng có thể đóng gói bố cục, includes và tài sản của mình thành một `gem` Ruby và [biến nó thành một giao diện Jekyll](/docs/themes/).

## Tài nguyên bổ sung

Dưới đây là một số hướng dẫn bổ sung về tạo trang web Jekyll:

* [Chuyển đổi trang web tĩnh sang Jekyll](http://jekyll.tips/jekyll-casts/converting-a-static-site-to-jekyll/)
* [Xây dựng trang web Jekyll – Phần 1 trong 3: Chuyển đổi trang web tĩnh sang Jekyll](https://css-tricks.com/building-a-jekyll-site-part-1-of-3/)
