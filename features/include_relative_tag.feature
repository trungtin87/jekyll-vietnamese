Tính năng: Tag include_relative
  Để chia sẻ nội dung qua nhiều trang liên quan chặt chẽ
  Là một hacker thích viết blog
  Tôi muốn có khả năng include các đoạn mã trong các trang và tài liệu của site tương đối với file hiện tại

  Kịch bản: Include một file tương đối với một bài viết
    Giả sử tôi có thư mục _posts
    Và tôi có thư mục _posts/snippets
    Và tôi có bài viết sau:
      | title     | date       | content                                         |
      | Star Wars | 2018-09-02 | {% include_relative snippets/welcome_para.md %} |
    Và tôi có file "_posts/snippets/welcome_para.md" chứa nội dung "Welcome back Dear Reader!"
    Khi tôi chạy jekyll build
    Thì tôi nên nhận được trạng thái thoát bằng không
    Và thư mục _site nên tồn tại
    Và tôi nên thấy "Welcome back Dear Reader!" trong "_site/2018/09/02/star-wars.html"

  Kịch bản: Include một file lồng nhau tương đối với một bài viết
    Giả sử tôi có thư mục _posts
    Và tôi có thư mục _posts/snippets
    Và tôi có thư mục _posts/snippets/welcome_para
    Và tôi có bài viết sau:
      | title     | date       | content                                         |
      | Star Wars | 2018-09-02 | {% include_relative snippets/welcome_para.md %} |
    Và tôi có file "_posts/snippets/welcome_para.md" chứa nội dung "{% include_relative snippets/welcome_para/greeting.md %} Dear Reader!"
    Và tôi có file "_posts/snippets/welcome_para/greeting.md" chứa nội dung "Welcome back"
    Khi tôi chạy jekyll build
    Thì tôi nên nhận được trạng thái thoát bằng không
    Và thư mục _site nên tồn tại
    Và tôi nên thấy "Welcome back Dear Reader!" trong "_site/2018/09/02/star-wars.html"

  Kịch bản: Include một file lồng nhau tương đối với một bài viết làm excerpt
    Giả sử tôi có thư mục _posts
    Và tôi có thư mục _posts/snippets
    Và tôi có thư mục _posts/snippets/welcome_para
    Và tôi có file "_posts/2018-09-02-star-wars.md" với nội dung:
      """
      {% include_relative snippets/welcome_para.md %}

      Hello World
      """
    Và tôi có file "_posts/snippets/welcome_para.md" chứa nội dung "{% include_relative snippets/welcome_para/greeting.md %} Dear Reader!"
    Và tôi có file "_posts/snippets/welcome_para/greeting.md" chứa nội dung "Welcome back"
    Và tôi có trang "index.md" chứa nội dung "{% for post in site.posts %}{{ post.excerpt }}{% endfor %}"
    Khi tôi chạy jekyll build
    Thì tôi nên nhận được trạng thái thoát bằng không
    Và thư mục _site nên tồn tại
    Và tôi nên thấy "Welcome back Dear Reader!" trong "_site/2018/09/02/star-wars.html"
    Và tôi nên thấy "Welcome back Dear Reader!" trong "_site/index.html"

  Kịch bản: Include một file lồng nhau tương đối với một trang ở root
    Giả sử tôi có thư mục snippets
    Và tôi có thư mục snippets/welcome_para
    Và tôi có trang "index.md" chứa nội dung "{% include_relative snippets/welcome_para.md %}"
    Và tôi có file "snippets/welcome_para.md" chứa nội dung "{% include_relative snippets/welcome_para/greeting.md %} Dear Reader!"
    Và tôi có file "snippets/welcome_para/greeting.md" chứa nội dung "Welcome back"
    Khi tôi chạy jekyll build
    Thì tôi nên nhận được trạng thái thoát bằng không
    Và thư mục _site nên tồn tại
    Và tôi nên thấy "Welcome back Dear Reader!" trong "_site/index.html"

  Kịch bản: Include nhiều file tương đối với một trang ở root
    Giả sử tôi có trang "apple.md" với foo "bar" chứa nội dung "{{ page.path }}, {{ page.foo }}"
    Và tôi có trang "banana.md" với nội dung:
      """
        {% include_relative apple.md %}
        {% include_relative cherry.md %}

        {{ page.path }}
      """
    Và tôi có trang "cherry.md" với foo "lipsum" chứa nội dung "{{ page.path }}, {{ page.foo }}"
    Khi tôi chạy jekyll build
    Thì tôi nên nhận được trạng thái thoát bằng không
    Và thư mục _site nên tồn tại
    Và tôi nên thấy "<p>apple.md, bar</p>" trong "_site/apple.html"
    Và tôi nên thấy "<hr />\n<p>foo: bar" trong "_site/banana.html"
    Và tôi nên thấy "<hr />\n<p>foo: lipsum" trong "_site/banana.html"
    Và tôi nên thấy "<p>cherry.md, lipsum</p>" trong "_site/cherry.html"
    Nhưng tôi không nên thấy "foo: lipsum" trong "_site/cherry.html"
