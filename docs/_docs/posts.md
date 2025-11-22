---
title: Bài viết (Posts)
permalink: /docs/posts/
redirect_from:
  - /docs/drafts/
---

Viết blog được tích hợp sẵn trong Jekyll. Bạn viết các bài đăng blog dưới dạng tệp văn bản và Jekyll
cung cấp mọi thứ bạn cần để biến nó thành một blog.

## Thư mục Bài viết

Thư mục `_posts` là nơi các bài đăng blog của bạn sinh sống. Bạn thường viết các bài đăng
bằng [Markdown](https://daringfireball.net/projects/markdown/), HTML cũng
được hỗ trợ.

## Tạo Bài viết

Để tạo một bài viết, hãy thêm một tệp vào thư mục `_posts` của bạn với định dạng
sau:

```
YEAR-MONTH-DAY-title.MARKUP
```

Trong đó `YEAR` là một số có bốn chữ số, `MONTH` và `DAY` đều là số có hai chữ số,
và `MARKUP` là phần mở rộng tệp đại diện cho định dạng được sử dụng trong
tệp. Ví dụ, sau đây là các ví dụ về tên tệp bài viết hợp lệ:

```
2011-12-31-new-years-eve-is-awesome.md
2012-09-12-how-to-write-a-blog.md
```

Tất cả các tệp bài đăng blog phải bắt đầu bằng [front matter](/docs/front-matter/) thường
được sử dụng để đặt [bố cục](/docs/layouts/) hoặc dữ liệu meta khác. Đối với một ví dụ
đơn giản, nó có thể chỉ để trống:

```markdown
---
layout: post
title:  "Chào mừng đến với Jekyll!"
---

# Chào mừng

**Xin chào thế giới**, đây là bài đăng blog Jekyll đầu tiên của tôi.

Tôi hy vọng bạn thích nó!
```

<div class="note">
  <h5>Mẹo chuyên nghiệp™: Liên kết đến các bài viết khác</h5>
  <p>
    Sử dụng thẻ <a href="/docs/liquid/tags/#linking-to-posts"><code>post_url</code></a>
    để liên kết đến các bài viết khác mà không phải lo lắng về việc các URL
    bị hỏng khi kiểu liên kết tĩnh của trang web thay đổi.
  </p>
</div>

<div class="note info">
  <h5>Hãy chú ý đến bộ ký tự</h5>
  <p>
    Các bộ xử lý nội dung có thể sửa đổi một số ký tự nhất định để làm cho chúng trông đẹp hơn.
    Ví dụ, phần mở rộng <code>smart</code> trong Redcarpet chuyển đổi các ký tự trích dẫn ASCII
    tiêu chuẩn thành các ký tự Unicode cong. Để trình duyệt
    hiển thị các ký tự đó đúng cách, hãy xác định giá trị meta charset bằng cách
    bao gồm <code>&lt;meta charset=&quot;utf-8&quot;&gt;</code> trong
    <code>&lt;head&gt;</code> của bố cục của bạn.
  </p>
</div>

## Bao gồm hình ảnh và tài nguyên

Tại một số điểm, bạn sẽ muốn bao gồm hình ảnh, tệp tải xuống hoặc các
tài sản kỹ thuật số khác cùng với nội dung văn bản của bạn. Một giải pháp phổ biến là tạo
một thư mục trong thư mục gốc của thư mục dự án được gọi là một cái gì đó như `assets`,
vào đó bất kỳ hình ảnh, tệp hoặc tài nguyên nào khác được đặt. Sau đó, từ bên trong
bất kỳ bài viết nào, chúng có thể được liên kết đến bằng cách sử dụng thư mục gốc của trang web làm đường dẫn cho tài sản
cần bao gồm. Cách tốt nhất để làm điều này phụ thuộc vào cách (tên miền phụ) và đường dẫn
của trang web của bạn được cấu hình, nhưng đây là một số ví dụ đơn giản trong Markdown:

Bao gồm một tài sản hình ảnh trong một bài viết:

```markdown
... được hiển thị trong ảnh chụp màn hình bên dưới:
![Ảnh chụp màn hình hữu ích của tôi](/assets/screenshot.jpg)
```

Liên kết đến một tệp PDF để người đọc tải xuống:

```markdown
... bạn có thể [lấy tệp PDF](/assets/mydoc.pdf) trực tiếp.
```

## Hiển thị chỉ mục các bài viết

Tạo một chỉ mục các bài viết trên một trang khác sẽ dễ dàng nhờ vào
[Liquid](https://shopify.github.io/liquid/) và các thẻ của nó. Đây là một
ví dụ đơn giản về cách tạo danh sách các liên kết đến các bài đăng blog của bạn:

{% raw %}

```liquid
<ul>
  {% for post in site.posts %}
    <li>
      <a href="{{ post.url }}">{{ post.title }}</a>
    </li>
  {% endfor %}
</ul>
```

{% endraw %}

Bạn có toàn quyền kiểm soát cách (và nơi) bạn hiển thị các bài viết của mình,
và cách bạn cấu trúc trang web của mình. Bạn nên đọc thêm về [cách các mẫu
hoạt động](/docs/templates/) với Jekyll nếu bạn muốn biết thêm.

Lưu ý rằng biến `post` chỉ tồn tại bên trong vòng lặp `for` ở trên. Nếu
bạn muốn truy cập các biến của trang/bài viết đang hiển thị (các
biến của bài viết/trang có vòng lặp `for` trong đó), hãy sử dụng biến `page`
thay thế.

## Thẻ và Danh mục

Jekyll có hỗ trợ hạng nhất cho *thẻ* và *danh mục* trong các bài đăng blog.

### Thẻ (Tags)

Thẻ cho một bài viết được định nghĩa trong front matter của bài viết bằng cách sử dụng khóa
`tag` cho một mục nhập duy nhất hoặc `tags` cho nhiều mục nhập. <br/> Vì Jekyll
mong đợi nhiều mục được ánh xạ tới khóa `tags`, nó sẽ tự động *tách*
một mục nhập chuỗi nếu nó chứa khoảng trắng. Ví dụ, trong khi front matter
`tag: classic hollywood` sẽ được xử lý thành một thực thể duy nhất
`"classic hollywood"`, front matter `tags: classic hollywood` sẽ được xử lý
thành một mảng các mục nhập `["classic", "hollywood"]`.

Bất kể khóa front matter được chọn là gì, Jekyll lưu trữ siêu dữ liệu được ánh xạ
tới khóa số nhiều được hiển thị cho các mẫu Liquid.

Tất cả các thẻ được đăng ký trong trang web hiện tại được hiển thị cho các mẫu Liquid thông qua
`site.tags`. Lặp lại `site.tags` trên một trang sẽ tạo ra một mảng khác với
hai mục, trong đó mục đầu tiên là tên của thẻ và mục thứ hai là
*một mảng các bài viết* có thẻ đó.

{% raw %}

```liquid
{% for tag in site.tags %}
  <h3>{{ tag[0] }}</h3>
  <ul>
    {% for post in tag[1] %}
      <li><a href="{{ post.url }}">{{ post.title }}</a></li>
    {% endfor %}
  </ul>
{% endfor %}
```

{% endraw %}

### Danh mục (Categories)

Danh mục của một bài viết hoạt động tương tự như các thẻ ở trên:

* Chúng có thể được định nghĩa thông qua front matter bằng cách sử dụng các khóa `category` hoặc
    `categories` (tuân theo logic tương tự như đối với thẻ)
* Tất cả các danh mục được đăng ký trong trang web được hiển thị cho các mẫu Liquid thông qua
    `site.categories` có thể được lặp lại (tương tự như vòng lặp cho thẻ
    ở trên.)

*Tuy nhiên, sự tương đồng giữa danh mục và thẻ kết thúc ở đó.*

Không giống như thẻ, danh mục cho các bài viết cũng có thể được định nghĩa bởi đường dẫn tệp của bài viết.
Bất kỳ thư mục nào phía trên `_posts` sẽ được đọc vào như một danh mục. Ví dụ,
nếu một bài viết ở đường dẫn `movies/horror/_posts/2019-05-21-bride-of-chucky.markdown`,
thì `movies` và `horror` được tự động đăng ký là danh mục cho bài viết đó.

Khi bài viết cũng có front matter định nghĩa danh mục, chúng chỉ được thêm vào
danh sách hiện có nếu chưa có sẵn.

Sự khác biệt đặc trưng giữa danh mục và thẻ là danh mục của một bài viết
có thể được tích hợp vào [URL được tạo](/docs/permalinks/#global) cho bài viết,
trong khi thẻ thì không thể.

Do đó, tùy thuộc vào việc front matter có `category: classic hollywood`,
hay `categories: classic hollywood`, bài viết ví dụ ở trên sẽ có URL là
`movies/horror/classic%20hollywood/2019/05/21/bride-of-chucky.html` hoặc
`movies/horror/classic/hollywood/2019/05/21/bride-of-chucky.html` tương ứng.

## Trích dẫn bài viết

Bạn có thể truy cập một đoạn trích nội dung của bài viết bằng cách sử dụng biến `excerpt` trên một
bài viết. Theo mặc định, đây là đoạn văn đầu tiên của nội dung trong bài viết, tuy nhiên nó
có thể được tùy chỉnh bằng cách đặt biến `excerpt_separator` trong front matter hoặc
`_config.yml`.

```markdown
---
excerpt_separator: <!--more-->
---

Trích dẫn với nhiều đoạn văn

Đây là một đoạn văn khác trong trích dẫn.
<!--more-->
Ngoài trích dẫn
```

Đây là một ví dụ về việc xuất danh sách các bài đăng blog với một trích dẫn:

{% raw %}

```liquid
<ul>
  {% for post in site.posts %}
    <li>
      <a href="{{ post.url }}">{{ post.title }}</a>
      {{ post.excerpt }}
    </li>
  {% endfor %}
</ul>
```

{% endraw %}

## Bản nháp (Drafts)

Bản nháp là các bài viết không có ngày tháng trong tên tệp. Chúng là các bài viết bạn vẫn đang
làm việc và chưa muốn xuất bản. Để bắt đầu và chạy với bản nháp,
hãy tạo một thư mục `_drafts` trong thư mục gốc của trang web của bạn và tạo bản nháp đầu tiên của bạn:

```
.
├── _drafts
│   └── a-draft-post.md
...
```

Để xem trước trang web của bạn với các bản nháp, hãy chạy `jekyll serve` hoặc `jekyll build`
với công tắc `--drafts`. Mỗi bản nháp sẽ được gán thời gian sửa đổi giá trị
của tệp bản nháp cho ngày của nó, và do đó bạn sẽ thấy các bản nháp đang được chỉnh sửa hiện tại
là các bài viết mới nhất.
