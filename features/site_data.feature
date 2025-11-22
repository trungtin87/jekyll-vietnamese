Tính năng: Dữ liệu site
  Là một hacker thích viết blog
  Tôi muốn có khả năng nhúng dữ liệu vào site của mình
  Để làm cho site trở nên động một chút

  Kịch bản: Sử dụng biến page trong một trang
    Giả sử tôi có trang "contact.html" với title "Contact" chứa nội dung "{{ page.title }}: email@example.com"
    Khi tôi chạy jekyll build
    Thì tôi nên nhận được trạng thái thoát bằng không
    Và thư mục _site nên tồn tại
    Và tôi nên thấy "Contact: email@example.com" trong "_site/contact.html"

  Dàn ý kịch bản: Sử dụng biến page.path trong một trang
    Giả sử tôi có thư mục <dir>
    Và tôi có trang "<path>" chứa nội dung "Source path: {{ page.path }}"
    Khi tôi chạy jekyll build
    Thì tôi nên nhận được trạng thái thoát bằng không
    Và thư mục _site nên tồn tại
    Và tôi nên thấy "Source path: <path>" trong "_site/<path>"

    Ví dụ:
      | dir        | path                 |
      | .          | index.html           |
      | dir        | dir/about.html       |
      | dir/nested | dir/nested/page.html |

  Kịch bản: Ghi đè page.path
    Giả sử tôi có trang "override.html" với path "custom-override.html" chứa nội dung "Custom path: {{ page.path }}"
    Khi tôi chạy jekyll build
    Thì tôi nên nhận được trạng thái thoát bằng không
    Và thư mục _site nên tồn tại
    Và tôi nên thấy "Custom path: custom-override.html" trong "_site/override.html"

  Kịch bản: Sử dụng biến site.time
    Giả sử tôi có trang "index.html" chứa nội dung "{{ site.time }}"
    Khi tôi chạy jekyll build
    Thì tôi nên nhận được trạng thái thoát bằng không
    Và thư mục _site nên tồn tại
    Và tôi nên thấy thời gian hôm nay trong "_site/index.html"

  Kịch bản: Sử dụng biến site.posts cho bài viết mới nhất
    Giả sử tôi có thư mục _posts
    Và tôi có trang "index.html" chứa nội dung "{{ site.posts.first.title }}: {{ site.posts.first.url }}"
    Và tôi có các bài viết sau:
      | title       | date       | content        |
      | First Post  | 2009-03-25 | My First Post  |
      | Second Post | 2009-03-26 | My Second Post |
      | Third Post  | 2009-03-27 | My Third Post  |
    Khi tôi chạy jekyll build
    Thì tôi nên nhận được trạng thái thoát bằng không
    Và thư mục _site nên tồn tại
    Và tôi nên thấy "Third Post: /2009/03/27/third-post.html" trong "_site/index.html"

  Kịch bản: Sử dụng biến site.posts trong một vòng lặp
    Giả sử tôi có thư mục _posts
    Và tôi có trang "index.html" chứa nội dung "{% for post in site.posts %} {{ post.title }} {% endfor %}"
    Và tôi có các bài viết sau:
      | title       | date       | content        |
      | First Post  | 2009-03-25 | My First Post  |
      | Second Post | 2009-03-26 | My Second Post |
      | Third Post  | 2009-03-27 | My Third Post  |
    Khi tôi chạy jekyll build
    Thì tôi nên nhận được trạng thái thoát bằng không
    Và thư mục _site nên tồn tại
    Và tôi nên thấy "Third Post  Second Post  First Post" trong "_site/index.html"

  Kịch bản: Sử dụng biến site.categories.code
    Giả sử tôi có thư mục _posts
    Và tôi có trang "index.html" chứa nội dung "{% for post in site.categories.code %} {{ post.title }} {% endfor %}"
    Và tôi có các bài viết sau:
      | title          | date       | category | content            |
      | Awesome Hack   | 2009-03-26 | code     | puts 'Hello World' |
      | Delicious Beer | 2009-03-26 | food     | 1) Yuengling       |
    Khi tôi chạy jekyll build
    Thì tôi nên nhận được trạng thái thoát bằng không
    Và thư mục _site nên tồn tại
    Và tôi nên thấy "Awesome Hack" trong "_site/index.html"

  Kịch bản: Sử dụng biến site.tags
    Giả sử tôi có thư mục _posts
    Và tôi có trang "index.html" chứa nội dung "{% for post in site.tags.beer %} {{ post.content }} {% endfor %}"
    Và tôi có các bài viết sau:
      | title          | date       | tag  | content      |
      | Delicious Beer | 2009-03-26 | beer | 1) Yuengling |
    Khi tôi chạy jekyll build
    Thì tôi nên nhận được trạng thái thoát bằng không
    Và thư mục _site nên tồn tại
    Và tôi nên thấy "Yuengling" trong "_site/index.html"

  Kịch bản: Sắp xếp các bài viết theo tên khi cùng ngày
  Giả sử tôi có thư mục _posts
  Và tôi có trang "index.html" chứa nội dung "{% for post in site.posts %}{{ post.title }}:{{ post.previous.title}},{{ post.next.title}} {% endfor %}"
  Và tôi có các bài viết sau:
    | title | date       | content |
    | first | 2009-02-26 | first   |
    | A     | 2009-03-26 | A       |
    | B     | 2009-03-26 | B       |
    | C     | 2009-03-26 | C       |
    | last  | 2009-04-26 | last    |
  Khi tôi chạy jekyll build
  Thì tôi nên nhận được trạng thái thoát bằng không
    Và thư mục _site nên tồn tại
  Và tôi nên thấy "last:C, C:B,last B:A,C A:first,B first:,A" trong "_site/index.html"

  Kịch bản: Sử dụng dữ liệu cấu hình trong site payload
    Giả sử tôi có trang "index.html" chứa nội dung "{{ site.url }}"
    Và tôi có file cấu hình với "url" được đặt thành "http://example.com"
    Khi tôi chạy jekyll build
    Thì tôi nên nhận được trạng thái thoát bằng không
    Và thư mục _site nên tồn tại
    Và tôi nên thấy "http://example.com" trong "_site/index.html"

  Kịch bản: Truy cập phiên bản Jekyll qua jekyll.version
    Giả sử tôi có trang "index.html" chứa nội dung "{{ jekyll.version }}"
    Khi tôi chạy jekyll build
    Thì tôi nên nhận được trạng thái thoát bằng không
    Và thư mục _site nên tồn tại
    Và tôi nên thấy "\d+\.\d+\.\d+" trong "_site/index.html"
