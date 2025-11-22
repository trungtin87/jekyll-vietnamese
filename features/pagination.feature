Tính năng: Phân trang site
  Để phân trang blog của tôi
  Là người dùng blog
  Tôi muốn chia các bài viết thành nhiều trang

  Dàn ý kịch bản: Phân trang với N bài viết mỗi trang
    Giả sử tôi có file cấu hình với:
      | key      | value             |
      | paginate | <num>             |
      | plugins  | [jekyll-paginate] |
    Và tôi có thư mục _layouts
    Và tôi có trang "index.html" chứa nội dung "{{ paginator.posts.size }}"
    Và tôi có thư mục _posts
    Và tôi có các bài viết sau:
      | title     | date       | layout  | content                                |
      | Wargames  | 2009-03-27 | default | The only winning move is not to play.  |
      | Wargames2 | 2009-04-27 | default | The only winning move is not to play2. |
      | Wargames3 | 2009-05-27 | default | The only winning move is not to play3. |
      | Wargames4 | 2009-06-27 | default | The only winning move is not to play4. |
    Khi tôi chạy jekyll build
    Thì thư mục _site/page<exist> nên tồn tại
    Và file "_site/page<exist>/index.html" nên tồn tại
    Và tôi nên thấy "<posts>" trong "_site/page<exist>/index.html"
    Và file "_site/page<not_exist>/index.html" không nên tồn tại

    Ví dụ:
      | num | exist | posts | not_exist |
      | 1   | 4     | 1     | 5         |
      | 2   | 2     | 2     | 3         |
      | 3   | 2     | 1     | 3         |

  Dàn ý kịch bản: Đặt đường dẫn phân trang tùy chỉnh
    Giả sử tôi có file cấu hình với:
      | key           | value                          |
      | paginate      | 1                              |
      | paginate_path | /blog/page-:num                |
      | permalink     | /blog/:year/:month/:day/:title |
      | plugins       | [jekyll-paginate]              |
    Và tôi có thư mục blog
    Và tôi có trang "blog/index.html" chứa nội dung "{{ paginator.posts.size }}"
    Và tôi có thư mục _posts
    Và tôi có các bài viết sau:
      | title     | date       | layout  | content                                |
      | Wargames  | 2009-03-27 | default | The only winning move is not to play.  |
      | Wargames2 | 2009-04-27 | default | The only winning move is not to play2. |
      | Wargames3 | 2009-05-27 | default | The only winning move is not to play3. |
      | Wargames4 | 2009-06-27 | default | The only winning move is not to play4. |
    Khi tôi chạy jekyll build
    Thì thư mục _site/blog/page-<exist> nên tồn tại
    Và file "_site/blog/page-<exist>/index.html" nên tồn tại
    Và tôi nên thấy "<posts>" trong "_site/blog/page-<exist>/index.html"
    Và file "_site/blog/page-<not_exist>/index.html" không nên tồn tại

    Ví dụ:
      | exist | posts | not_exist |
      | 2     | 1     | 5         |
      | 3     | 1     | 6         |
      | 4     | 1     | 7         |

  Dàn ý kịch bản: Đặt đường dẫn phân trang tùy chỉnh mà không có index.html trong đó
    Giả sử tôi có file cấu hình với:
      | key           | value                          |
      | paginate      | 1                              |
      | paginate_path | /blog/page/:num                |
      | permalink     | /blog/:year/:month/:day/:title |
      | plugins       | [jekyll-paginate]              |
    Và tôi có thư mục blog
    Và tôi có trang "blog/index.html" chứa nội dung "{{ paginator.posts.size }}"
    Và tôi có trang "index.html" chứa nội dung "Don't pick me!"
    Và tôi có thư mục _posts
    Và tôi có các bài viết sau:
      | title     | date       | layout  | content                                |
      | Wargames  | 2009-03-27 | default | The only winning move is not to play.  |
      | Wargames2 | 2009-04-27 | default | The only winning move is not to play2. |
      | Wargames3 | 2009-05-27 | default | The only winning move is not to play3. |
      | Wargames4 | 2009-06-27 | default | The only winning move is not to play4. |
    Khi tôi chạy jekyll build
    Thì thư mục _site/blog/page/<exist> nên tồn tại
    Và file "_site/blog/page/<exist>/index.html" nên tồn tại
    Và tôi nên thấy "<posts>" trong "_site/blog/page/<exist>/index.html"
    Và file "_site/blog/page/<not_exist>/index.html" không nên tồn tại

    Ví dụ:
      | exist | posts | not_exist |
      | 2     | 1     | 5         |
      | 3     | 1     | 6         |
      | 4     | 1     | 7         |
