Tính năng: Rendering
  Là một hacker thích viết blog
  Tôi muốn có khả năng tạo một static site
  Để chia sẻ các ý tưởng tuyệt vời của tôi với internet
  Nhưng tôi muốn làm nó đơn giản nhất có thể
  Vì vậy render với Liquid và đặt trong Layouts

  Kịch bản: Rendering một site với dấu ngoặc đơn trong tên đường dẫn
    Giả sử tôi có một blank site trong "omega(beta)"
    Và   tôi có trang "omega(beta)/test.md" với layout "simple" chứa nội dung "Hello World"
    Và   tôi có thư mục omega(beta)/_includes
    Và   tôi có file "omega(beta)/_includes/head.html" chứa nội dung "Snippet"
    Và   tôi có file cấu hình với "source" được đặt thành "omega(beta)"
    Và   tôi có thư mục omega(beta)/_layouts
    Và   tôi có file "omega(beta)/_layouts/simple.html" chứa nội dung "{% include head.html %}: {{ content }}"
    Khi  tôi chạy jekyll build --profile
    Thì  tôi nên nhận được trạng thái thoát bằng không
    Và   tôi nên thấy "Snippet: <p>Hello World</p>" trong "_site/test.html"
    Và   tôi nên thấy "_layouts/simple.html" trong kết quả build

  Kịch bản: Khi nhận Liquid không hợp lệ
    Giả sử tôi có trang "index.html" với layout "simple" chứa nội dung "{% include invalid.html %}"
    Và   tôi có layout simple chứa nội dung "{{ content }}"
    Khi  tôi chạy jekyll build
    Thì  tôi nên nhận được trạng thái thoát khác không
    Và   tôi nên thấy "Liquid Exception" trong kết quả build

  Kịch bản: Khi nhận lỗi cú pháp liquid trong file included
    Giả sử tôi có thư mục _includes
    Và   tôi có file "_includes/invalid.html" chứa nội dung "{% INVALID %}"
    Và   tôi có trang "index.html" với layout "simple" chứa nội dung "{% include invalid.html %}"
    Và   tôi có layout simple chứa nội dung "{{ content }}"
    Khi  tôi chạy jekyll build
    Thì  tôi nên nhận được trạng thái thoát khác không
    Và   tôi nên thấy "Liquid Exception: Liquid syntax error \\(.+/invalid\\.html line 1\\): Unknown tag 'INVALID' included in index\\.html" trong kết quả build

  Kịch bản: Khi nhận lỗi liquid chung trong file included
    Giả sử tôi có thư mục _includes
    Và   tôi có file "_includes/invalid.html" chứa nội dung "{{ site.title | prepend 'Prepended Text' }}"
    Và   tôi có trang "index.html" với layout "simple" chứa nội dung "{% include invalid.html %}"
    Và   tôi có layout simple chứa nội dung "{{ content }}"
    Khi  tôi chạy jekyll build
    Thì  tôi nên nhận được trạng thái thoát khác không
    Và   tôi nên thấy "Liquid Exception: Liquid error \\(.+/_includes/invalid\\.html line 1\\): wrong number of arguments (\\(given 1, expected 2\\)|\\(1 for 2\\)) included in index\\.html" trong kết quả build

  Kịch bản: Rendering một default site chứa file với Liquid constructs không hợp lệ
    Giả sử tôi có trang "index.html" với title "Simple Test" chứa nội dung "{{ page.title | foobar }}\\n\\n{{ page.author }}"
    Khi  tôi chạy jekyll build
    Thì  tôi nên nhận được trạng thái thoát bằng không
    Và   tôi không nên thấy "Liquid Exception:" trong kết quả build

  Kịch bản: Rendering một default site chứa file với biến Liquid không tồn tại
    Giả sử tôi có file "index.html" với nội dung:
    """
    ---
    title: Simple Test
    ---
    {{ site.lorem.ipsum }}
    {{ site.title }}
    """
    Và  tôi có file cấu hình với "title" được đặt thành "Hello World"
    Khi tôi chạy jekyll build
    Thì tôi nên nhận được trạng thái thoát bằng không
    Và  thư mục _site nên tồn tại

  Kịch bản: Rendering một custom site chứa file với biến Liquid không tồn tại
    Giả sử tôi có file "index.html" với nội dung:
    """
    ---
    title: Simple Test
    ---
    {{ page.title }}

    {{ page.author }}
    """
    Và   tôi có file "_config.yml" với nội dung:
    """
    liquid:
      strict_variables: true
    """
    Khi  tôi chạy jekyll build
    Thì  tôi nên nhận được trạng thái thoát khác không
    Và   tôi nên thấy "Liquid error \\(line 3\\): undefined variable author in index.html" trong kết quả build

  Kịch bản: Rendering một custom site chứa file với bộ lọc Liquid không tồn tại
    Giả sử tôi có file "index.html" với nội dung:
    """
    ---
    author: John Doe
    ---
    {{ page.title }}

    {{ page.author | foobar }}
    """
    Và   tôi có file "_config.yml" với nội dung:
    """
    liquid:
      strict_filters: true
    """
    Khi  tôi chạy jekyll build
    Thì  tôi nên nhận được trạng thái thoát khác không
    Và   tôi nên thấy "Liquid error \\(line 3\\): undefined filter foobar in index.html" trong kết quả build

  Kịch bản: Render Liquid và đặt trong layout
    Giả sử tôi có trang "index.html" với layout "simple" chứa nội dung "Hi there, Jekyll {{ jekyll.environment }}!"
    Và tôi có layout simple chứa nội dung "{{ content }}Ahoy, indeed!"
    Khi tôi chạy jekyll build
    Thì tôi nên nhận được trạng thái thoát bằng không
    Và thư mục _site nên tồn tại
    Và tôi nên thấy "Hi there, Jekyll development!\\nAhoy, indeed" trong "_site/index.html"

  Kịch bản: Không đặt asset files trong layout
    Giả sử tôi có trang "index.scss" với layout "simple" chứa nội dung ".foo-bar { color:black; }"
    Và tôi có trang "index.coffee" với layout "simple" chứa nội dung "whatever()"
    Và tôi có file cấu hình với "plugins" được đặt thành "[jekyll-coffeescript]"
    Và tôi có layout simple chứa nội dung "{{ content }}Ahoy, indeed!"
    Khi tôi chạy jekyll build
    Thì tôi nên nhận được trạng thái thoát bằng không
    Và thư mục _site nên tồn tại
    Và tôi không nên thấy "Ahoy, indeed!" trong "_site/index.css"
    Và tôi không nên thấy "Ahoy, indeed!" trong "_site/index.js"

  Kịch bản: Bỏ qua defaults và không đặt pages và documents với layout được đặt thành 'none'
    Giả sử tôi có trang "index.md" với layout "none" chứa nội dung "Hi there, {{ site.author }}!"
    Và tôi có thư mục _trials
    Và tôi có trang "_trials/no-layout.md" với layout "none" chứa nội dung "Hi there, {{ site.author }}!"
    Và tôi có trang "_trials/test.md" với layout "null" chứa nội dung "Hi there, {{ site.author }}!"
    Và tôi có layout none chứa nội dung "{{ content }}Welcome!"
    Và tôi có layout page chứa nội dung "{{ content }}Check this out!"
    Và tôi có file cấu hình với:
    | key             | value                                          |
    | author          | John Doe                                       |
    | collections     | {trials: {output: true}}                       |
    | defaults        | [{scope: {path: ""}, values: {layout: page}}]  |
    Khi tôi chạy jekyll build
    Thì tôi nên nhận được trạng thái thoát bằng không
    Và thư mục _site nên tồn tại
    Và tôi không nên thấy "Welcome!" trong "_site/trials/no-layout.html"
    Và tôi không nên thấy "Check this out!" trong "_site/trials/no-layout.html"
    Nhưng tôi nên thấy "Check this out!" trong "_site/trials/test.html"
    Và tôi nên thấy "Hi there, John Doe!" trong "_site/index.html"
    Và tôi không nên thấy "Welcome!" trong "_site/index.html"
    Và tôi không nên thấy "Build Warning:" trong kết quả build

  Kịch bản: Không đặt pages và documents với layout được đặt thành 'none'
    Giả sử tôi có trang "index.md" với layout "none" chứa nội dung "Hi there, {{ site.author }}!"
    Và tôi có thư mục _trials
    Và tôi có trang "_trials/no-layout.md" với layout "none" chứa nội dung "Hi there, {{ site.author }}!"
    Và tôi có trang "_trials/test.md" với layout "page" chứa nội dung "Hi there, {{ site.author }}!"
    Và tôi có layout none chứa nội dung "{{ content }}Welcome!"
    Và tôi có layout page chứa nội dung "{{ content }}Check this out!"
    Và tôi có file cấu hình với:
    | key             | value                     |
    | author          | John Doe                  |
    | collections     | {trials: {output: true}}  |
    Khi tôi chạy jekyll build
    Thì tôi nên nhận được trạng thái thoát bằng không
    Và thư mục _site nên tồn tại
    Và tôi không nên thấy "Welcome!" trong "_site/trials/no-layout.html"
    Và tôi không nên thấy "Welcome!" trong "_site/index.html"
    Nhưng tôi nên thấy "Check this out!" trong "_site/trials/test.html"
    Và tôi nên thấy "Hi there, John Doe!" trong "_site/index.html"
    Và tôi không nên thấy "Build Warning:" trong kết quả build

  Kịch bản: Render liquid trong Sass
    Giả sử tôi có trang "index.scss" chứa nội dung ".foo-bar { color:{{site.color}}; }"
    Và tôi có file cấu hình với "color" được đặt thành "red"
    Khi tôi chạy jekyll build
    Thì tôi nên nhận được trạng thái thoát bằng không
    Và thư mục _site nên tồn tại
    Và tôi nên thấy ".foo-bar {\\n  color: red;\\n}\\n\\n\\/\\*# sourceMappingURL=index.css.map \\*\\/" trong "_site/index.css"

  Kịch bản: Không render liquid trong CoffeeScript mà không bao gồm jekyll-coffeescript một cách rõ ràng
    Giả sử tôi có trang "index.coffee" với animal "cicada" chứa nội dung "hey='for {{page.animal}}'"
    Khi tôi chạy jekyll build
    Thì tôi nên nhận được trạng thái thoát bằng không
    Và thư mục _site nên tồn tại
    Và file "_site/index.js" không nên tồn tại

  Kịch bản: Render liquid trong CoffeeScript với jekyll-coffeescript được bật
    Giả sử tôi có trang "index.coffee" với animal "cicada" chứa nội dung "hey='for {{page.animal}}'"
    Và tôi có file cấu hình với "plugins" được đặt thành "[jekyll-coffeescript]"
    Khi tôi chạy jekyll build
    Thì tôi nên nhận được trạng thái thoát bằng không
    Và thư mục _site nên tồn tại
    Và tôi nên thấy "hey = 'for cicada';" trong "_site/index.js"

  Kịch bản: Rendering các biểu thức Liquid trả về chuỗi chứa biểu thức Liquid
    Giả sử tôi có file "index.md" với nội dung:
      """
      ---
      prequel: "{% link series/first-part.md %}"
      sequel: "{% link series/last-part.md %}"
      ---

      This is the second-part of the series named {{ site.novel }}.
      The first part is at {{ page.prequel }}.

      Lorem ipsum

      {% capture sequel_link %}{{ page.sequel }}{% endcapture %}
      The last part of the series can be read at {{ sequel_link }}
      """
    Và tôi có file cấu hình với "novel" được đặt thành "'{{ site.title }}'"
    Khi tôi chạy jekyll build
    Thì tôi nên nhận được trạng thái thoát bằng không
    Và tôi nên thấy "series named {{ site.title }}" trong "_site/index.html"
    Và tôi nên thấy "{% link series/first-part.md %}" trong "_site/index.html"
    Và tôi nên thấy "{% link series/last-part.md %}" trong "_site/index.html"

  Kịch bản: Render nội dung của một trang khác
    Giả sử tôi có trang "index.md" chứa nội dung "__Hello World__"
    Và tôi có trang "about.md" chứa nội dung "{{ page.name }}"
    Và tôi có file "test.json" với nội dung:
      """
      ---
      ---

      {
        "hpages": [
          {%- for page in site.html_pages %}
          {
            "url"    : {{ page.url     | jsonify }},
            "name"   : {{ page.name    | jsonify }},
            "path"   : {{ page.path    | jsonify }},
            "title"  : {{ page.title   | jsonify }},
            "layout" : {{ page.layout  | jsonify }},
            "content": {{ page.content | jsonify }},
            "excerpt": {{ page.excerpt | jsonify }}
          }{% unless forloop.last %},{% endunless -%}
          {% endfor %}
        ]
      }
      """
    Khi tôi chạy jekyll build
    Thì tôi nên nhận được trạng thái thoát bằng không
    Và thư mục _site nên tồn tại
    Nhưng tôi không nên thấy "content\\\": \\\"{{ page.name }}\" trong "_site/test.json"
    Và tôi không nên thấy "content\\\": \\\"__Hello World__\" trong "_site/test.json"
    Nhưng tôi nên thấy "content\\\": \\\"<p>about.md</p>\" trong "_site/test.json"
    Và tôi nên thấy "content\\\": \\\"<p><strong>Hello World</strong></p>\" trong "_site/test.json"
