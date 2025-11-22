Tính năng: Tag Link
  Là một hacker thích viết nhiều loại nội dung
  Tôi muốn có khả năng liên kết đến các trang và tài liệu
  Và render chúng mà không gặp nhiều rắc rối

  Kịch bản: Site cơ bản với hai trang
    Giả sử tôi có trang "index.md" chứa nội dung "[About my projects]({% link about.md %})"
    Và tôi có trang "about.md" chứa nội dung "[Home]({% link index.md %})"
    Khi tôi chạy jekyll build
    Thì tôi nên nhận được trạng thái thoát bằng không
    Và thư mục _site nên tồn tại
    Và tôi nên thấy "<p><a href=\"/about.html\">About my projects</a></p>" trong "_site/index.html"
    Và tôi nên thấy "<p><a href=\"/\">Home</a></p>" trong "_site/about.html"

  Kịch bản: Site cơ bản với permalink trang tùy chỉnh
    Giả sử tôi có trang "index.md" chứa nội dung "[About my projects]({% link about.md %})"
    Và tôi có trang "about.md" với permalink "/about/" chứa nội dung "[Home]({% link index.md %})"
    Khi tôi chạy jekyll build
    Thì tôi nên nhận được trạng thái thoát bằng không
    Và thư mục _site nên tồn tại
    Và tôi nên thấy "<p><a href=\"/about/\">About my projects</a></p>" trong "_site/index.html"
    Và tôi nên thấy "<p><a href=\"/\">Home</a></p>" trong "_site/about/index.html"

  Kịch bản: Site cơ bản với permalink toàn site tùy chỉnh
    Giả sử tôi có trang "index.md" chứa nội dung "[About my projects]({% link about.md %})"
    Và tôi có trang "about.md" chứa nội dung "[Home]({% link index.md %})"
    Và tôi có file cấu hình với "permalink" được đặt thành "pretty"
    Khi tôi chạy jekyll build
    Thì tôi nên nhận được trạng thái thoát bằng không
    Và thư mục _site nên tồn tại
    Và tôi nên thấy "<p><a href=\"/about/\">About my projects</a></p>" trong "_site/index.html"
    Và tôi nên thấy "<p><a href=\"/\">Home</a></p>" trong "_site/about/index.html"

  Kịch bản: Site cơ bản với hai trang và baseurl tùy chỉnh
    Giả sử tôi có trang "index.md" chứa nội dung "[About my projects]({% link about.md %})"
    Và tôi có trang "about.md" chứa nội dung "[Home]({% link index.md %})"
    Và tôi có file cấu hình với "baseurl" được đặt thành "/blog"
    Khi tôi chạy jekyll build
    Thì tôi nên nhận được trạng thái thoát bằng không
    Và thư mục _site nên tồn tại
    Và tôi nên thấy "<p><a href=\"/blog/about.html\">About my projects</a></p>" trong "_site/index.html"
    Và tôi nên thấy "<p><a href=\"/blog/\">Home</a></p>" trong "_site/about.html"

  Kịch bản: Site cơ bản với hai trang và baseurl và permalink tùy chỉnh
    Giả sử tôi có trang "index.md" chứa nội dung "[About my projects]({% link about.md %})"
    Và tôi có trang "about.md" chứa nội dung "[Home]({% link index.md %})"
    Và tôi có file "_config.yml" với nội dung:
    """
    baseurl: /blog
    permalink: pretty
    """
    Khi tôi chạy jekyll build
    Thì tôi nên nhận được trạng thái thoát bằng không
    Và thư mục _site nên tồn tại
    Và tôi nên thấy "<p><a href=\"/blog/about/\">About my projects</a></p>" trong "_site/index.html"
    Và tôi nên thấy "<p><a href=\"/blog/\">Home</a></p>" trong "_site/about/index.html"

  Kịch bản: Liên kết đến một file ảo
    Giả sử tôi có trang "index.md" chứa nội dung "[About my projects]({% link about.md %})"
    Và tôi có trang "about.md" chứa nội dung "[Contact]({% link contact.md %})"
    Khi tôi chạy jekyll build
    Thì tôi nên nhận được trạng thái thoát khác không
    Và thư mục _site không nên tồn tại
    Và tôi nên thấy "Could not find document 'contact.md' in tag 'link'" trong kết quả build

  Kịch bản: Site phức tạp với nhiều loại file
    Giả sử tôi có trang "index.md" chứa nội dung "[About my projects]({% link about.md %})"
    Và tôi có trang "about.md" chứa nội dung "[Latest Hack]({% link _posts/2018-02-15-metaprogramming.md %})"
    Và tôi có thư mục _posts
    Và tôi có trang "_posts/2018-02-15-metaprogramming.md" chứa nội dung "[Download This]({% link script.txt %})"
    Và tôi có file "script.txt" chứa nội dung "Static Alert!"
    Khi tôi chạy jekyll build
    Thì tôi nên nhận được trạng thái thoát bằng không
    Và thư mục _site nên tồn tại
    Và tôi nên thấy "<p><a href=\"/about.html\">About my projects</a></p>" trong "_site/index.html"
    Và tôi nên thấy "<p><a href=\"/2018/02/15/metaprogramming.html\">Latest Hack</a></p>" trong "_site/about.html"
    Và tôi nên thấy "<p><a href=\"/script.txt\">Download This</a></p>" trong "_site/2018/02/15/metaprogramming.html"
    Và tôi nên thấy "Static Alert!" trong "_site/script.txt"
