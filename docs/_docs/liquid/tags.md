---
title: Bộ lọc Tags (Tags Filters)
permalink: "/docs/liquid/tags/"
---
Tất cả các [thẻ](https://shopify.github.io/liquid/tags/control-flow/) Liquid tiêu chuẩn đều được hỗ trợ.
Jekyll có một vài thẻ tích hợp để giúp bạn xây dựng trang web của mình. Bạn cũng có thể tạo
thẻ của riêng mình bằng cách sử dụng [plugins]({{ '/docs/plugins/' | relative_url }}).

## Bao gồm (Includes)

Nếu bạn có các đoạn mã trang mà bạn sử dụng lặp đi lặp lại trên trang web của mình, một
[include]({{ '/docs/includes/' | relative_url }}) là cách hoàn hảo để làm cho điều này dễ bảo trì hơn.

## Làm nổi bật đoạn mã (Code snippet highlighting)

Jekyll có hỗ trợ tích hợp cho việc làm nổi bật cú pháp của hơn 100 ngôn ngữ
nhờ vào [Rouge](https://github.com/rouge-ruby/rouge). Rouge là trình làm nổi bật mặc định
trong Jekyll 3 trở lên.

{: .note .warning}
Sử dụng Pygments đã bị phản đối và không được hỗ trợ trong
Jekyll 4; cài đặt cấu hình <code>highlighter: pygments</code>
bây giờ tự động quay trở lại sử dụng <em>Rouge</em> được viết bằng Ruby
và tương thích 100% với các bảng định kiểu cho Pygments.

Để hiển thị một khối mã với làm nổi bật cú pháp, hãy bao quanh mã của bạn như sau:

{% raw %}

```liquid
{% highlight ruby %}
def foo
  puts 'foo'
end
{% endhighlight %}
```

{% endraw %}

Đối số cho thẻ `highlight` (`ruby` trong ví dụ trên) là
định danh ngôn ngữ. Để tìm định danh thích hợp để sử dụng cho ngôn ngữ
bạn muốn làm nổi bật, hãy tìm "tên ngắn" (short name) trên [Rouge
wiki](https://github.com/jayferd/rouge/wiki/List-of-supported-languages-and-lexers).

<div class="note">
  <h5>Jekyll xử lý tất cả các bộ lọc Liquid trong các khối mã</h5>
  <p>Nếu bạn đang sử dụng một ngôn ngữ có chứa dấu ngoặc nhọn, bạn
    sẽ có thể cần phải đặt các thẻ <code>{&#37; raw &#37;}</code> và
    <code>{&#37; endraw &#37;}</code> xung quanh mã của bạn.
    Kể từ Jekyll {% include docs_version_badge.html version="4.0" %}, bạn có thể thêm <code>render_with_liquid: false</code> vào front matter của mình để vô hiệu hóa Liquid hoàn toàn cho một tài liệu cụ thể.</p>
</div>

### Số dòng (Line numbers)

Có một đối số thứ hai cho `highlight` được gọi là `linenos` là tùy chọn.
Bao gồm đối số `linenos` sẽ buộc mã được làm nổi bật bao gồm số dòng.
Ví dụ, khối mã sau sẽ bao gồm số dòng bên cạnh
mỗi dòng:

{% raw %}

```liquid
{% highlight ruby linenos %}
def foo
  puts 'foo'
end
{% endhighlight %}
```

{% endraw %}

### Đánh dấu các dòng cụ thể {%- include docs_version_badge.html version="4.4.0" -%}

{: #marking-specific-lines }

Bạn có thể đánh dấu các dòng cụ thể trong một đoạn mã bằng cách sử dụng đối số tùy chọn
`mark_lines`. Đối số này lấy một danh sách các số dòng được phân tách bằng dấu cách
phải được bao bọc trong dấu ngoặc kép. Ví dụ, khối mã sau
sẽ đánh dấu các dòng 1 và 2 nhưng không đánh dấu dòng 3:

{% raw %}

```liquid
{% highlight ruby mark_lines="1 2" %}
def foo
  puts 'foo'
end
{% endhighlight %}
```

{% endraw %}

Một tên lớp mặc định là `hll` sẽ được áp dụng cho các dòng được đánh dấu.

### Bảng định kiểu cho làm nổi bật cú pháp

Để việc làm nổi bật hiển thị, bạn sẽ cần bao gồm một bảng định kiểu làm nổi bật.
Đối với Pygments hoặc Rouge, bạn có thể sử dụng một bảng định kiểu cho Pygments, bạn
có thể tìm thấy một thư viện ví dụ
[tại đây](https://jwarby.github.io/jekyll-pygments-themes/languages/ruby.html)
hoặc từ [kho lưu trữ của nó](https://github.com/jwarby/jekyll-pygments-themes).

Sao chép tệp CSS (`native.css` chẳng hạn) vào thư mục css của bạn và nhập
các kiểu làm nổi bật cú pháp vào `main.css` của bạn:

```css
@import "native.css";
```

## Liên kết (Links)

{: .note}
Kể từ Jekyll {% include docs_version_badge.html version="4.0"%}, bạn không cần phải thêm tiền tố `site.baseurl` vào các thẻ `link` và `post_url`.

### Liên kết đến các trang {#link}

Để liên kết đến một bài đăng, một trang, mục bộ sưu tập, hoặc tệp, thẻ `link` sẽ tạo URL permalink chính xác cho đường dẫn bạn chỉ định. Ví dụ, nếu bạn sử dụng thẻ `link` để liên kết đến `mypage.html`, ngay cả khi bạn thay đổi kiểu permalink của mình để bao gồm phần mở rộng tệp hoặc bỏ qua nó, URL được tạo bởi thẻ `link` sẽ luôn hợp lệ.

Bạn phải bao gồm phần mở rộng gốc của tệp khi sử dụng thẻ `link`. Dưới đây là một số ví dụ:

{% raw %}

```liquid
{% link _collection/name-of-document.md %}
{% link _posts/2016-07-26-name-of-post.md %}
{% link news/index.html %}
{% link /assets/files/doc.pdf %}
```

{% endraw %}

Bạn cũng có thể sử dụng thẻ `link` để tạo một liên kết trong Markdown như sau:

{% raw %}

```liquid
[Link to a document]({% link _collection/name-of-document.md %})
[Link to a post]({% link _posts/2016-07-26-name-of-post.md %})
[Link to a page]({% link news/index.html %})
[Link to a file]({% link /assets/files/doc.pdf %})
```

{% endraw %}

Đường dẫn đến bài đăng, trang, hoặc bộ sưu tập được định nghĩa là đường dẫn tương đối đến thư mục gốc (nơi tệp cấu hình của bạn ở) đến tệp, không phải đường dẫn từ trang hiện tại của bạn đến trang khác.

Ví dụ, giả sử bạn đang tạo một liên kết trong `page_a.md` (được lưu trữ trong `pages/folder1/folder2`) đến `page_b.md` (được lưu trữ trong `pages/folder1`). Đường dẫn của bạn trong liên kết sẽ không phải là `../page_b.html`. Thay vào đó, nó sẽ là `/pages/folder1/page_b.md`.

Nếu bạn không chắc chắn về đường dẫn, hãy thêm {% raw %}`{{ page.path }}`{% endraw %} vào trang và nó sẽ hiển thị đường dẫn.

Một lợi ích chính của việc sử dụng thẻ `link` hoặc `post_url` là xác thực liên kết. Nếu liên kết không tồn tại, Jekyll sẽ không xây dựng trang web của bạn. Đây là một điều tốt, vì nó sẽ cảnh báo bạn về một liên kết bị hỏng để bạn có thể sửa nó (thay vì cho phép bạn xây dựng và triển khai một trang web với các liên kết bị hỏng).

Lưu ý bạn không thể thêm các bộ lọc vào các thẻ `link`. Ví dụ, bạn không thể nối một chuỗi bằng cách sử dụng các bộ lọc Liquid, chẳng hạn như {% raw %}`{% link mypage.html | append: "#section1" %}`{% endraw %}. Để liên kết đến các phần trên một trang, bạn sẽ cần sử dụng các kỹ thuật liên kết HTML hoặc Markdown thông thường.

Tên của tệp bạn muốn liên kết có thể được chỉ định dưới dạng một biến thay vì tên tệp thực tế. Ví dụ, giả sử bạn đã định nghĩa một biến trong front matter của trang của mình như thế này:

```yaml
---
title: My page
my_variable: footer_company_a.html
---
```

Sau đó, bạn có thể tham chiếu biến đó trong liên kết của mình:

{% raw %}

```liquid
{% link {{ page.my_variable }} %}
```

{% endraw %}

Trong ví dụ này, thẻ `link` sẽ hiển thị một liên kết đến tệp `footer_company_a.html`.

### Liên kết đến các bài đăng

Nếu bạn muốn bao gồm một liên kết đến một bài đăng trên trang web của mình, thẻ `post_url` sẽ tạo URL permalink chính xác cho bài đăng bạn chỉ định.

{% raw %}

```liquid
{% post_url 2010-07-21-name-of-post %}
```

{% endraw %}

Nếu bạn tổ chức các bài đăng của mình trong các thư mục con, bạn cần bao gồm đường dẫn thư mục con đến bài đăng:

{% raw %}

```liquid
{% post_url /subdir/2010-07-21-name-of-post %}
```

{% endraw %}

Không cần phải bao gồm phần mở rộng tệp khi sử dụng thẻ `post_url`.

Bạn cũng có thể sử dụng thẻ này để tạo một liên kết đến một bài đăng trong Markdown như sau:

{% raw %}

```liquid
[Name of Link]({% post_url 2010-07-21-name-of-post %})
```

{% endraw %}

Bây giờ hãy nói rằng bạn có một [tệp dữ liệu]({{ '/docs/datafiles/' | relative_url }}) `_data/cool_posts.yaml` được sử dụng để theo dõi
một số bài đăng nhất định mà bạn dự định liệt kê là *Bài đăng thú vị* (Cool Posts):

```yaml
- title: "An Awesome Post"
  slug: "2010-07-21-name-of-post"
- title: "Another Awesome Post"
  slug: "2016-07-26-name-of-post"
```

Bạn cũng có thể liệt kê các bài đăng như vậy bằng cách sử dụng thẻ `post_url` (từ {%- include docs_version_badge.html version="4.5.0" -%}):

{% raw %}

```liquid
Cool posts:

{%- for cool_post in site.data.cool_posts %}
- [{{ cool_post.title }}]({% post_url {{ cool_post.slug }} %})
{%- endfor %}
```

{% endraw %}
