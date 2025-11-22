Tính năng: Bài viết nháp
  Là một hacker thích viết blog
  Tôi muốn có khả năng xem trước các bản nháp ở local
  Để xem chúng có ổn không trước khi xuất bản

  Kịch bản: Xem trước một bản nháp
    Giả sử tôi có file cấu hình với "permalink" được đặt thành "none"
    Và tôi có thư mục _drafts
    Và tôi có bản nháp sau:
      | title  | date       | layout  | content        |
      | Recipe | 2009-03-27 | default | Not baked yet. |
    Khi tôi chạy jekyll build --drafts
    Thì tôi nên nhận được trạng thái thoát bằng không
    Và thư mục _site nên tồn tại
    Và tôi nên thấy "Not baked yet." trong "_site/recipe.html"

  Kịch bản: Không xem trước bản nháp
    Giả sử tôi có file cấu hình với "permalink" được đặt thành "none"
    Và tôi có trang "index.html" chứa nội dung "Totally index"
    Và tôi có thư mục _drafts
    Và tôi có bản nháp sau:
      | title  | date       | layout  | content        |
      | Recipe | 2009-03-27 | default | Not baked yet. |
    Khi tôi chạy jekyll build
    Thì tôi nên nhận được trạng thái thoát bằng không
    Và thư mục _site nên tồn tại
    Và file "_site/recipe.html" không nên tồn tại

  Kịch bản: Không xem trước bản nháp chưa được xuất bản
    Giả sử tôi có file cấu hình với "permalink" được đặt thành "none"
    Và tôi có trang "index.html" chứa nội dung "Totally index"
    Và tôi có thư mục _drafts
    Và tôi có bản nháp sau:
      | title  | date       | layout  | published | content        |
      | Recipe | 2009-03-27 | default | false     | Not baked yet. |
    Khi tôi chạy jekyll build --drafts
    Thì tôi nên nhận được trạng thái thoát bằng không
    Và thư mục _site nên tồn tại
    Và file "_site/recipe.html" không nên tồn tại

  Kịch bản: Sử dụng biến page.path
    Giả sử tôi có file cấu hình với "permalink" được đặt thành "none"
    Và tôi có thư mục _drafts
    Và tôi có bản nháp sau:
      | title  | date       | layout | content                    |
      | Recipe | 2009-03-27 | simple | Post path: {{ page.path }} |
    Khi tôi chạy jekyll build --drafts
    Thì tôi nên nhận được trạng thái thoát bằng không
    Và thư mục _site nên tồn tại
    Và tôi nên thấy "Post path: _drafts/recipe.markdown" trong "_site/recipe.html"
