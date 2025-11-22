Tính năng: Tag PostUrl
  Là một blogger thích viết nhiều loại nội dung
  Tôi muốn có khả năng liên kết đến các bài viết một cách dễ dàng
  Và render chúng mà không gặp nhiều rắc rối

  Kịch bản: Một site đang sử dụng defaults cho permalink
    Giả sử tôi có thư mục _posts
    Và tôi có bài viết sau:
      | title       | date       | content           |
      | Hello World | 2019-02-04 | Lorem ipsum dolor |
    Và tôi có trang "index.md" chứa nội dung "[Welcome]({% post_url 2019-02-04-hello-world %})"
    Khi tôi chạy jekyll build
    Thì tôi nên nhận được trạng thái thoát bằng không
    Và thư mục _site nên tồn tại
    Và tôi nên thấy "<p><a href=\"/2019/02/04/hello-world.html\">Welcome</a></p>" trong "_site/index.html"

  Kịch bản: Site với cài đặt permalink tùy chỉnh toàn site
    Giả sử tôi có thư mục _posts
    Và tôi có các bài viết sau:
      | title         | date       | content           |
      | Hello World   | 2019-02-04 | Lorem ipsum dolor |
      | We Meet Again | 2019-02-05 | Alpha beta gamma  |
    Và tôi có file cấu hình với "permalink" được đặt thành "/:title:output_ext"
    Và tôi có trang "index.md" chứa nội dung "[Welcome]({% post_url 2019-02-04-hello-world %})"
    Khi tôi chạy jekyll build
    Thì tôi nên nhận được trạng thái thoát bằng không
    Và thư mục _site nên tồn tại
    Và tôi nên thấy "<p><a href=\"/hello-world.html\">Welcome</a></p>" trong "_site/index.html"

  Kịch bản: Site với cài đặt permalink tùy chỉnh trên mỗi bài viết
    Giả sử tôi có thư mục _posts
    Và tôi có các bài viết sau:
      | title         | date       | permalink               | content           |
      | Hello World   | 2019-02-04 | "/2019/hello-world/"    | Lorem ipsum dolor |
      | We Meet Again | 2019-02-05 | "/2019/second-meeting/" | Alpha beta gamma  |
    Và tôi có file cấu hình với "permalink" được đặt thành "/:title:output_ext"
    Và tôi có trang "index.md" chứa nội dung "[Welcome]({% post_url 2019-02-04-hello-world %})"
    Khi tôi chạy jekyll build
    Thì tôi nên nhận được trạng thái thoát bằng không
    Và thư mục _site nên tồn tại
    Và tôi nên thấy "<p><a href=\"/2019/hello-world/\">Welcome</a></p>" trong "_site/index.html"

  Kịch bản: Site không có bài viết
    Giả sử tôi có trang "index.md" chứa nội dung "[Welcome]({% post_url 2019-02-04-hello-world %})"
    Khi tôi chạy jekyll build
    Thì tôi nên nhận được trạng thái thoát khác không
    Và thư mục _site không nên tồn tại
    Nhưng tôi nên thấy "Could not find post \"2019-02-04-hello-world\" in tag 'post_url'." trong kết quả build

  Kịch bản: Site với bài viết có ngày trong tương lai
    Giả sử tôi có thư mục _posts
    Và tôi có các bài viết sau:
      | title         | date       | content           |
      | Hello World   | 2019-02-04 | Lorem ipsum dolor |
      | We Meet Again | 2119-02-04 | Alpha beta gamma  |
    Và tôi có file cấu hình với "permalink" được đặt thành "/:title:output_ext"
    Và tôi có trang "index.md" chứa nội dung "[Welcome Again]({% post_url 2119-02-04-we-meet-again %})"
    Khi tôi chạy jekyll build --future
    Thì tôi nên nhận được trạng thái thoát bằng không
    Và thư mục _site nên tồn tại
    Và tôi nên thấy "<p><a href=\"/we-meet-again.html\">Welcome Again</a></p>" trong "_site/index.html"

  Kịch bản: Site với baseurl đã cấu hình
    Giả sử tôi có thư mục _posts
    Và tôi có các bài viết sau:
      | title         | date       | content           |
      | Hello World   | 2019-02-04 | Lorem ipsum dolor |
      | We Meet Again | 2019-02-05 | Alpha beta gamma  |
    Và tôi có file cấu hình với "baseurl" được đặt thành "blog"
    Và tôi có trang "index.md" chứa nội dung "[Welcome]({% post_url 2019-02-04-hello-world %})"
    Khi tôi chạy jekyll build
    Thì tôi nên nhận được trạng thái thoát bằng không
    Và thư mục _site nên tồn tại
    Và tôi nên thấy "<p><a href=\"/blog/2019/02/04/hello-world.html\">Welcome</a></p>" trong "_site/index.html"

  Kịch bản: Posts với categories
    Giả sử tôi có thư mục _posts
    Và tôi có bài viết sau:
      | title        | date       | content           |
      | Hello World  | 2019-02-04 | Lorem ipsum dolor |
    Và tôi có thư mục movies/_posts
    Và tôi có bài viết sau trong "movies":
      | title        | date       | content           |
      | Hello Movies | 2019-02-05 | Lorem ipsum dolor |
    Và tôi có bài viết sau trong "movies":
      | title        | date       | category | content                |
      | Star Wars    | 2019-02-06 | film     | Luke, I am your father |
    Và tôi có trang "index.md" với nội dung:
      """
      [Welcome]({% post_url 2019-02-04-hello-world %})

      [Movies]({% post_url movies/2019-02-05-hello-movies %})

      [Film]({% post_url movies/2019-02-06-star-wars %})
      """
    Khi tôi chạy jekyll build
    Thì tôi nên nhận được trạng thái thoát bằng không
    Và thư mục _site nên tồn tại
    Và tôi nên thấy "<p><a href=\"/2019/02/04/hello-world.html\">Welcome</a></p>" trong "_site/index.html"
    Và tôi nên thấy "<p><a href=\"/movies/2019/02/05/hello-movies.html\">Movies</a></p>" trong "_site/index.html"
    Và tôi nên thấy "<p><a href=\"/movies/film/2019/02/06/star-wars.html\">Film</a></p>" trong "_site/index.html"

  Kịch bản: Posts trùng lặp với categories
    Giả sử tôi có thư mục _posts
    Và tôi có bài viết sau:
      | title       | date       | content           |
      | Hello World | 2019-02-04 | Lorem ipsum dolor |
    Và tôi có thư mục movies/_posts
    Và tôi có bài viết sau trong "movies":
      | title       | date       | content           |
      | Hello World | 2019-02-04 | Lorem ipsum dolor |
    Và tôi có trang "index.md" với nội dung:
      """
      [Welcome]({% post_url 2019-02-04-hello-world %})

      [Movies]({% post_url movies/2019-02-04-hello-world %})
      """
    Khi tôi chạy jekyll build
    Thì tôi nên nhận được trạng thái thoát bằng không
    Và thư mục _site nên tồn tại
    Và tôi nên thấy "<p><a href=\"/2019/02/04/hello-world.html\">Welcome</a></p>" trong "_site/index.html"
    Và tôi nên thấy "<p><a href=\"/movies/2019/02/04/hello-world.html\">Movies</a></p>" trong "_site/index.html"

  Kịch bản: Cách sử dụng deprecated để liên kết bài viết lồng nhau
    Giả sử tôi có thư mục movies/_posts
    Và tôi có bài viết sau trong "movies":
      | title       | date       | content           |
      | Hello World | 2019-02-04 | Lorem ipsum dolor |
    Và tôi có trang "index.md" chứa nội dung "[Movies]({% post_url 2019-02-04-hello-world %})"
    Khi tôi chạy jekyll build
    Thì tôi nên nhận được trạng thái thoát bằng không
    Và tôi nên thấy "Deprecation: A call to '{% post_url 2019-02-04-hello-world %}' did not match a post" trong kết quả build
    Nhưng thư mục _site nên tồn tại
    Và tôi nên thấy "<p><a href=\"/movies/2019/02/04/hello-world.html\">Movies</a></p>" trong "_site/index.html"

  Kịch bản: Posts lồng nhau trong thư mục có tên chứa khoảng trắng
    Giả sử tôi có thư mục Cats and Dogs/_posts
    Và tôi có bài viết sau trong "Cats and Dogs":
      | title       | date       | content           |
      | Hello World | 2019-02-04 | Lorem ipsum dolor |
    Và tôi có thư mục _posts/Salt and Pepper
    Và tôi có bài viết sau dưới "Salt and Pepper":
      | title       | date       | content           |
      | Hello Again | 2019-02-05 | Lorem ipsum dolor |
    Và tôi có file "index.md" với nội dung:
      """
      ---
      ---

      [Post 1]({% post_url Cats and Dogs/2019-02-04-hello-world %})

      [Post 2]({% post_url Salt and Pepper/2019-02-05-hello-again %})
      """
    Khi tôi chạy jekyll build
    Thì tôi nên nhận được trạng thái thoát bằng không
    Và tôi không nên thấy "Deprecation: A call to '{% post_url" trong kết quả build
    Nhưng thư mục _site nên tồn tại
    Và tôi nên thấy "<p><a href=\"/cats%20and%20dogs/2019/02/04/hello-world.html\">Post 1</a></p>" trong "_site/index.html"
    Và tôi nên thấy "<p><a href=\"/2019/02/05/hello-again.html\">Post 2</a></p>" trong "_site/index.html"

  Kịch bản: Gọi một bài viết qua một biến liquid
    Giả sử tôi có thư mục _posts
    Và tôi có bài viết sau:
      | title       | date       | content           |
      | Hello World | 2019-02-04 | Lorem ipsum dolor |
    Và tôi có trang "index.md" với nội dung:
      """
      {% assign value='2019-02-04-hello-world' %}
      [Welcome]({% post_url {{ value }} %})
      """
    Khi tôi chạy jekyll build
    Thì tôi nên nhận được trạng thái thoát bằng không
    Và thư mục _site nên tồn tại
    Và tôi nên thấy "<p><a href=\"/2019/02/04/hello-world.html\">Welcome</a></p>" trong "_site/index.html"

  Kịch bản: Gọi các bài viết qua một biến liquid trong vòng lặp for
    Giả sử tôi có thư mục _posts
    Và tôi có bài viết sau:
      | title         | date       | content           |
      | Hello World   | 2019-02-04 | Lorem ipsum dolor |
      | We Meet Again | 2019-02-05 | Alpha beta gamma  |
    Và tôi có trang "index.md" với nội dung:
      """
      {% assign posts = '2019-02-04-hello-world;2019-02-05-we-meet-again' | split: ';' %}
      {%- for slug in posts -%}
        [{{ slug }}]({% post_url {{ slug }} %})
      {%- endfor %}
      """
    Khi tôi chạy jekyll build
    Thì tôi nên nhận được trạng thái thoát bằng không
    Và thư mục _site nên tồn tại
    Và tôi nên thấy "<a href=\"/2019/02/04/hello-world.html\">2019-02-04-hello-world</a>" trong "_site/index.html"
    Và tôi nên thấy "<a href=\"/2019/02/05/we-meet-again.html\">2019-02-05-we-meet-again</a>" trong "_site/index.html"
