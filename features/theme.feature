Tính năng: Viết theme
  Là một hacker thích chia sẻ chuyên môn của mình
  Tôi muốn có khả năng tạo một theme dạng gem
  Để chia sẻ kỹ năng phong cách tuyệt vời của tôi với những Jekyllite khác

  Kịch bản: Tạo một khung theme mới
    Khi tôi chạy jekyll new-theme my-cool-theme
    Thì tôi nên nhận được trạng thái thoát bằng không
    Và thư mục my-cool-theme nên tồn tại

  Kịch bản: Tạo một khung theme mới với code of conduct
    Khi tôi chạy jekyll new-theme my-cool-theme --code-of-conduct
    Thì tôi nên nhận được trạng thái thoát bằng không
    Và thư mục my-cool-theme nên tồn tại
    Và file "my-cool-theme/CODE_OF_CONDUCT.md" nên tồn tại

  Kịch bản: Một theme với SCSS
    Giả sử tôi có file cấu hình với "theme" được đặt thành "test-theme"
    Khi tôi chạy jekyll build
    Thì tôi nên nhận được trạng thái thoát bằng không
    Và thư mục _site nên tồn tại
    Và tôi nên thấy ".sample {\n  color: red;\n}\n\n\/\*# sourceMappingURL=style.css.map \*\/" trong "_site/assets/style.css"

  Kịch bản: Ghi đè một theme với SCSS
    Giả sử tôi có file cấu hình với "theme" được đặt thành "test-theme"
    Và tôi có thư mục assets
    Và tôi có trang "assets/style.scss" chứa nội dung "@import 'test-theme-black';"
    Khi tôi chạy jekyll build
    Thì tôi nên nhận được trạng thái thoát bằng không
    Và thư mục _site nên tồn tại
    Và tôi nên thấy ".sample {\n  color: black;\n}\n\n\/\*# sourceMappingURL=style.css.map \*\/" trong "_site/assets/style.css"

  Kịch bản: Một theme với một include
    Giả sử tôi có file cấu hình với "theme" được đặt thành "test-theme"
    Và tôi có thư mục _includes
    Và tôi có file "_includes/in_project.html" chứa nội dung "I'm in the project."
    Và tôi có trang "index.html" chứa nội dung "{% include in_project.html %} {% include include.html %}"
    Khi tôi chạy jekyll build
    Thì tôi nên nhận được trạng thái thoát bằng không
    Và thư mục _site nên tồn tại
    Và tôi nên thấy "I'm in the project." trong "_site/index.html"
    Và tôi nên thấy "<span class=\"sample\">include.html from test-theme</span>" trong "_site/index.html"

  Kịch bản: Một theme không có data
    Giả sử tôi có file cấu hình với "theme" được đặt thành "test-theme-skinny"
    Và tôi có thư mục _data
    Và tôi có file "_data/greetings.yml" với nội dung:
      """
      foo: "Hello! I'm foo. And who are you?"
      """
    Và tôi có trang "index.html" chứa nội dung "{{ site.data.greetings.foo }}"
    Khi tôi chạy jekyll build
    Thì tôi nên nhận được trạng thái thoát bằng không
    Và thư mục _site nên tồn tại
    Và tôi nên thấy "Hello! I'm foo. And who are you?" trong "_site/index.html"

  Kịch bản: Một theme với data bị ghi đè bởi data trong thư mục nguồn
    Giả sử tôi có file cấu hình với "theme" được đặt thành "test-theme"
    Và tôi có thư mục _data
    Và tôi có file "_data/greetings.yml" với nội dung:
      """
      foo: "Hello! I'm foo. And who are you?"
      """
    Và tôi có trang "index.html" chứa nội dung "{{ site.data.greetings.foo }}"
    Khi tôi chạy jekyll build
    Thì tôi nên nhận được trạng thái thoát bằng không
    Và thư mục _site nên tồn tại
    Và tôi nên thấy "Hello! I'm foo. And who are you?" trong "_site/index.html"
    Và tôi không nên thấy "Hello! I'm bar. What's up so far?" trong "_site/index.html"

  Kịch bản: Một theme với một layout
    Giả sử tôi có file cấu hình với "theme" được đặt thành "test-theme"
    Và tôi có thư mục _layouts
    Và tôi có file "_layouts/post.html" chứa nội dung "post.html from the project: {{ content }}"
    Và tôi có trang "index.html" với layout "default" chứa nội dung "I'm content."
    Và tôi có trang "post.html" với layout "post" chứa nội dung "I'm more content."
    Khi tôi chạy jekyll build
    Thì tôi nên nhận được trạng thái thoát bằng không
    Và thư mục _site nên tồn tại
    Và tôi nên thấy "default.html from test-theme: I'm content." trong "_site/index.html"
    Và tôi nên thấy "post.html from the project: I'm more content." trong "_site/post.html"

  Kịch bản: Một theme với assets
    Giả sử tôi có file cấu hình với "theme" được đặt thành "test-theme"
    Và tôi có thư mục assets
    Và tôi có file "assets/application.coffee" chứa nội dung "From your site."
    Và tôi có file "assets/base.js" chứa nội dung "From your site."
    Khi tôi chạy jekyll build
    Thì tôi nên nhận được trạng thái thoát bằng không
    Và thư mục _site nên tồn tại
    Và tôi nên thấy "From your site." trong "_site/assets/application.coffee"
    Và tôi nên thấy "From your site." trong "_site/assets/base.js"

  Kịch bản: Một theme chỉ có layouts
    Giả sử tôi có file cấu hình với "theme" được đặt thành "test-theme-skinny"
    Và tôi có trang "index.html" với layout "home" chứa nội dung "The quick brown fox."
    Khi tôi chạy jekyll build
    Thì tôi nên nhận được trạng thái thoát bằng không
    Và thư mục _site nên tồn tại
    Và tôi nên thấy "Message: The quick brown fox." trong "_site/index.html"
    Nhưng tôi không nên thấy "_includes" trong kết quả build
    Và tôi không nên thấy "_sass" trong kết quả build
    Và tôi không nên thấy "assets" trong kết quả build

  Kịch bản: Yêu cầu các dependency của một theme
    Giả sử tôi có file cấu hình với "theme" được đặt thành "test-dependency-theme"
    Khi tôi chạy jekyll build
    Thì tôi nên nhận được trạng thái thoát bằng không
    Và thư mục _site nên tồn tại
    Và file "_site/test.txt" nên tồn tại

  Kịch bản: Site phức tạp kết hợp tất cả mọi thứ
    Giả sử tôi có file cấu hình với "theme" được đặt thành "test-theme"
    Và tôi có thư mục _posts
    Và tôi có các bài viết sau:
      | title  | date       | layout  | content             |
      | entry1 | 2016-04-21 | post    | I am using a local layout. {% include include.html %} |
      | entry2 | 2016-04-21 | default | I am using a themed layout. {% include include.html %} {% include in_project.html %} |
    Và tôi có thư mục _layouts
    Và tôi có trang "_layouts/post.html" với layout "default" chứa nội dung "I am a post layout! {{ content }}"
    Và tôi có thư mục _includes
    Và tôi có file "_includes/in_project.html" chứa nội dung "I am in the project, not the theme."
    Khi tôi chạy jekyll build
    Thì tôi nên nhận được trạng thái thoát bằng không
    Và thư mục _site nên tồn tại
    Và tôi nên thấy "I am in the project, not the theme." trong "_site/2016/04/21/entry2.html"
    Và tôi nên thấy "<span class=\"sample\">include.html from test-theme</span>" trong "_site/2016/04/21/entry2.html"
    Và tôi nên thấy "default.html from test-theme:" trong "_site/2016/04/21/entry2.html"
    Và tôi nên thấy "I am using a themed layout." trong "_site/2016/04/21/entry2.html"
    Và tôi không nên thấy "I am a post layout!" trong "_site/2016/04/21/entry2.html"
    Và tôi không nên thấy "I am in the project, not the theme." trong "_site/2016/04/21/entry1.html"
    Và tôi nên thấy "<span class=\"sample\">include.html from test-theme</span>" trong "_site/2016/04/21/entry1.html"
    Và tôi nên thấy "default.html from test-theme:" trong "_site/2016/04/21/entry1.html"
    Và tôi nên thấy "I am using a local layout." trong "_site/2016/04/21/entry1.html"
    Và tôi nên thấy "I am a post layout!" trong "_site/2016/04/21/entry1.html"

  Kịch bản: Site phức tạp kết hợp tất cả mọi thứ liên quan đến thư mục data
    Giả sử tôi có file cấu hình với "theme" được đặt thành "test-theme"
    Và tôi có thư mục _data
    Và tôi có file "_data/i18n.yml" với nội dung:
      """
      testimonials:
        header: Kundenstimmen
      """
    Và tôi có trang "index.html" chứa nội dung "{% include testimonials.html %}"
    Khi tôi chạy jekyll build
    Thì tôi nên nhận được trạng thái thoát bằng không
    Và thư mục _site nên tồn tại
    Và tôi không nên thấy "Testimonials" trong "_site/index.html"
    Và tôi nên thấy "Kundenstimmen" trong "_site/index.html"
    Và tôi nên thấy "Design by FTC" trong "_site/index.html"
