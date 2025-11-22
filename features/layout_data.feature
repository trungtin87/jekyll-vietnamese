Tính năng: Dữ liệu layout
  Là một hacker thích tránh lặp lại
  Tôi muốn có khả năng nhúng dữ liệu vào layout của mình
  Để làm cho layout trở nên động một chút

  Kịch bản: Sử dụng dữ liệu layout tùy chỉnh
    Giả sử tôi có thư mục _layouts
    Và tôi có file "_layouts/999.html" với nội dung:
      """
      ---
      ---
      {{ content }} layout content
      """
    Và tôi có trang "index.html" với layout "custom" chứa nội dung "page content"
    Và tôi có file "index.html" với nội dung:
      """
      ---
      layout: 999
      ---
      page content
      """
    Khi tôi chạy jekyll build
    Thì file "_site/index.html" nên tồn tại
    Và tôi nên thấy "page content layout content" trong "_site/index.html"

  Kịch bản: Sử dụng dữ liệu layout tùy chỉnh
    Giả sử tôi có thư mục _layouts
    Và tôi có file "_layouts/custom.html" với nội dung:
      """
      ---
      foo: my custom data
      ---
      {{ content }} foo: {{ layout.foo }}
      """
    Và tôi có trang "index.html" với layout "custom" chứa nội dung "page content"
    Khi tôi chạy jekyll build
    Thì file "_site/index.html" nên tồn tại
    Và tôi nên thấy "page content\n foo: my custom data" trong "_site/index.html"

  Kịch bản: Kế thừa dữ liệu layout tùy chỉnh
    Giả sử tôi có thư mục _layouts
    Và tôi có file "_layouts/custom.html" với nội dung:
      """
      ---
      layout: base
      foo: my custom data
      ---
      {{ content }}
      """
    Và tôi có file "_layouts/base.html" với nội dung:
      """
      {{ content }} foo: {{ layout.foo }}
      """
    Và tôi có trang "index.html" với layout "custom" chứa nội dung "page content"
    Khi tôi chạy jekyll build
    Thì file "_site/index.html" nên tồn tại
    Và tôi nên thấy "page content\n foo: my custom data" trong "_site/index.html"

  Kịch bản: Kế thừa dữ liệu layout tùy chỉnh và xóa khi không có
    Giả sử tôi có thư mục _layouts
    Và tôi có file "_layouts/default.html" với nội dung:
      """
      ---
      bar: i'm default
      ---
      {{ content }} foo: '{{ layout.foo }}' bar: '{{ layout.bar }}'
      """
    Và tôi có file "_layouts/special.html" với nội dung:
      """
      ---
      layout: default
      foo: my special data
      bar: im special
      ---
      {{ content }}
      """
    Và tôi có file "_layouts/page.html" với nội dung:
      """
      ---
      layout: default
      bar: im page
      ---
      {{ content }}
      """
    Và tôi có trang "index.html" với layout "special" chứa nội dung "page content"
    Và tôi có trang "jekyll.html" với layout "page" chứa nội dung "page content"
    Khi tôi chạy jekyll build
    Thì file "_site/index.html" nên tồn tại
    Và tôi nên thấy "page content\n foo: 'my special data' bar: 'im special'" trong "_site/index.html"
    Và tôi nên thấy "page content\n foo: '' bar: 'im page'" trong "_site/jekyll.html"
