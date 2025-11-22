Tính năng: Trích đoạn bài viết
  Là một hacker thích viết blog
  Tôi muốn có khả năng tạo một trang web tĩnh
  Để chia sẻ những ý tưởng tuyệt vời của tôi với cộng đồng internet
  Nhưng một số người chỉ có thể tập trung trong vài khoảnh khắc
  Vì vậy chỉ cần cho họ một chút hương vị

  Kịch bản: Một trích đoạn không có layout
    Giả sử tôi có trang "index.html" chứa nội dung "{% for post in site.posts %}{{ post.excerpt }}{% endfor %}"
    Và tôi có thư mục _posts
    Và tôi có các bài viết sau:
      | title  | date       | layout | content             |
      | entry1 | 2007-12-31 | post   | content for entry1. |
    Khi tôi chạy jekyll build
    Thì tôi nên nhận được trạng thái thoát bằng không
    Và thư mục _site nên tồn tại
    Và tôi nên thấy chính xác "<p>content for entry1.</p>" trong "_site/index.html"

  Kịch bản: Một trích đoạn từ một bài viết có layout
    Giả sử tôi có trang "index.html" chứa nội dung "{% for post in site.posts %}{{ post.excerpt }}{% endfor %}"
    Và tôi có thư mục _posts
    Và tôi có thư mục _layouts
    Và tôi có layout post chứa nội dung "{{ page.excerpt }}"
    Và tôi có các bài viết sau:
      | title  | date       | layout | content             |
      | entry1 | 2007-12-31 | post   | content for entry1. |
    Khi tôi chạy jekyll build
    Thì tôi nên nhận được trạng thái thoát bằng không
    Và thư mục _site nên tồn tại
    Và thư mục _site/2007 nên tồn tại
    Và thư mục _site/2007/12 nên tồn tại
    Và thư mục _site/2007/12/31 nên tồn tại
    Và file "_site/2007/12/31/entry1.html" nên tồn tại
    Và tôi nên thấy chính xác "<p>content for entry1.</p>" trong "_site/2007/12/31/entry1.html"
    Và tôi nên thấy chính xác "<p>content for entry1.</p>" trong "_site/index.html"

  Kịch bản: Một trích đoạn với cấu trúc Liquid từ một bài viết có layout
    Giả sử tôi có trang "index.html" chứa nội dung "{% for post in site.posts %}{{ post.excerpt }}{% endfor %}"
    Và tôi có file cấu hình với "baseurl" được đặt thành "/blog"
    Và tôi có thư mục _posts
    Và tôi có thư mục _layouts
    Và tôi có layout post chứa nội dung "{{ page.excerpt }}"
    Và tôi có các bài viết sau:
      | title  | date       | layout | content                                  |
      | entry1 | 2007-12-31 | post   | {{ 'assets/style.css' \| relative_url }} |
    Khi tôi chạy jekyll build
    Thì tôi nên nhận được trạng thái thoát bằng không
    Và thư mục _site nên tồn tại
    Và thư mục _site/2007 nên tồn tại
    Và thư mục _site/2007/12 nên tồn tại
    Và thư mục _site/2007/12/31 nên tồn tại
    Và file "_site/2007/12/31/entry1.html" nên tồn tại
    Và tôi nên thấy chính xác "<p>/blog/assets/style.css</p>" trong "_site/2007/12/31/entry1.html"
    Và tôi nên thấy chính xác "<p>/blog/assets/style.css</p>" trong "_site/index.html"

  Kịch bản: Một trích đoạn từ một bài viết có layout với ngữ cảnh
    Giả sử tôi có trang "index.html" chứa nội dung "{% for post in site.posts %}{{ post.excerpt }}{% endfor %}"
    Và tôi có thư mục _posts
    Và tôi có thư mục _layouts
    Và tôi có layout post chứa nội dung "<html><head></head><body>{{ page.excerpt }}</body></html>"
    Và tôi có các bài viết sau:
      | title  | date       | layout | content             |
      | entry1 | 2007-12-31 | post   | content for entry1. |
    Khi tôi chạy jekyll build
    Thì tôi nên nhận được trạng thái thoát bằng không
    Và thư mục _site nên tồn tại
    Và thư mục _site/2007 nên tồn tại
    Và thư mục _site/2007/12 nên tồn tại
    Và thư mục _site/2007/12/31 nên tồn tại
    Và file "_site/2007/12/31/entry1.html" nên tồn tại
    Và tôi nên thấy "<p>content for entry1.</p>" trong "_site/index.html"
    Và tôi nên thấy "<html><head></head><body><p>content for entry1.</p>\n</body></html>" trong "_site/2007/12/31/entry1.html"

  Kịch bản: Trích đoạn từ các bài viết có 'render_with_liquid' trong front matter
    Giả sử tôi có trang "index.html" chứa nội dung "{% for post in site.posts %}{{ post.excerpt }}{% endfor %}"
    Và tôi có thư mục _posts
    Và tôi có thư mục _layouts
    Và tôi có layout post chứa nội dung "{{ page.excerpt }}"
    Và tôi có các bài viết sau:
      | title           | layout | render_with_liquid | date       | content                                  |
      | Unrendered Post | post   | false              | 2017-07-06 | Liquid is not rendered at {{ page.url }} |
      | Rendered Post   | post   | true               | 2017-07-06 | Liquid is rendered at {{ page.url }}     |
    Khi tôi chạy jekyll build
    Thì tôi nên nhận được trạng thái thoát bằng không
    Và thư mục _site/2017/07/06 nên tồn tại
    Và file "_site/2017/07/06/unrendered-post.html" nên tồn tại
    Và file "_site/2017/07/06/rendered-post.html" nên tồn tại
    Và tôi nên thấy "Liquid is not rendered at {{ page.url }}" trong "_site/2017/07/06/unrendered-post.html"
    Nhưng tôi nên thấy "<p>Liquid is rendered at /2017/07/06/rendered-post.html</p>" trong "_site/2017/07/06/rendered-post.html"
    Và tôi nên thấy "<p>Liquid is not rendered at {{ page.url }}</p>\n<p>Liquid is rendered at /2017/07/06/rendered-post.html</p>" trong "_site/index.html"

  Kịch bản: Trích đoạn từ các bài viết với liên kết Markdown kiểu tham chiếu
    Giả sử tôi có file cấu hình với:
      | key       | value                   |
      | permalink | "/:title:output_ext"    |
      | kramdown  | { show_warnings: true } |
    Và tôi có trang "index.html" chứa nội dung "{% for post in site.posts %}{{ post.excerpt }}{% endfor %}"
    Và tôi có thư mục _layouts
    Và tôi có layout post chứa nội dung "{{ page.excerpt }}"
    Và tôi có thư mục _posts
    Và tôi có các bài viết sau:
      | title                        | layout | date       | content                                                   |
      | Just Text Excerpt            | post   | 2019-03-06 | Install Jekyll\n\nNext Para [^1]\n\n[^1]: Lorem ipsum     |
      | Text and Footnote            | post   | 2019-03-07 | Alpha [^1]\n\nNext Para\n\n[^1]: Omega sigma              |
      | Text and Reference Link      | post   | 2019-03-08 | Read [docs][link]\n\nNext Para\n\n[link]: docs.jekyll.com |
      | Text and Self-referencing Link | post   | 2019-03-09 | Check out [jekyll]\n\nNext Para\n\n[jekyll]: jekyllrb.com |
    Khi tôi chạy jekyll build
    Thì tôi nên nhận được trạng thái thoát bằng không
    Và tôi không nên thấy "Kramdown warning" trong kết quả build
    Nhưng tôi nên thấy chính xác "<p>Install Jekyll</p>" trong "_site/just-text-excerpt.html"
    Và tôi nên thấy "<p>Alpha <sup id=\"fnref:1\"><a href=\"#fn:1\" class=\"footnote\" rel=\"footnote\" role=\"doc-noteref\">1</a></sup></p>" trong "_site/text-and-footnote.html"
    Và tôi nên thấy "<p>Omega sigma <a href=\"#fnref:1\" class=\"reversefootnote\" role=\"doc-backlink\">&#8617;</a></p>" trong "_site/text-and-footnote.html"
    Và tôi nên thấy "<p>Read <a href=\"docs.jekyll.com\">docs</a></p>" trong "_site/text-and-reference-link.html"
    Và tôi nên thấy "<p>Check out <a href=\"jekyllrb.com\">jekyll</a></p>" trong "_site/text-and-self-referencing-link.html"
