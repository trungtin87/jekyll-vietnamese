Tính năng: Markdown
  Là một hacker thích viết blog
  Tôi muốn có khả năng tạo một trang web tĩnh
  Để chia sẻ những ý tưởng tuyệt vời của mình với internet

  Kịch bản: Markdown trong danh sách trên trang index
    Giả sử tôi có file cấu hình với "paginate" được đặt thành "5"
    Và tôi có trang "index.html" chứa nội dung "Index - {% for post in site.posts %} {{ post.content }} {% endfor %}"
    Và tôi có thư mục _posts
    Và tôi có bài viết sau:
      | title   | date       | content    | type     |
      | Hackers | 2009-03-27 | # My Title | markdown |
    Khi tôi chạy jekyll build
    Thì tôi nên nhận được trạng thái thoát bằng không
    Và thư mục _site nên tồn tại
    Và tôi nên thấy "Index" trong "_site/index.html"
    Và tôi nên thấy "<h1 id=\"my-title\">My Title</h1>" trong "_site/2009/03/27/hackers.html"
    Và tôi nên thấy "<h1 id=\"my-title\">My Title</h1>" trong "_site/index.html"

  Kịch bản: Markdown trong phân trang trên trang index
    Giả sử tôi có file cấu hình với:
      | key      | value             |
      | paginate | 5                 |
      | plugins  | [jekyll-paginate] |
    Và tôi có trang "index.html" chứa nội dung "Index - {% for post in paginator.posts %} {{ post.content }} {% endfor %}"
    Và tôi có thư mục _posts
    Và tôi có bài viết sau:
      | title   | date       | content    | type     |
      | Hackers | 2009-03-27 | # My Title | markdown |
    Khi tôi chạy jekyll build
    Thì tôi nên nhận được trạng thái thoát bằng không
    Và thư mục _site nên tồn tại
    Và tôi nên thấy "Index" trong "_site/index.html"
    Và tôi nên thấy "<h1 id=\"my-title\">My Title</h1>" trong "_site/index.html"
