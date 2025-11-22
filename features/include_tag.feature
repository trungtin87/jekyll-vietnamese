Tính năng: Tag Include
  Để chia sẻ nội dung của họ qua nhiều trang
  Là một hacker thích viết blog
  Tôi muốn có khả năng include các file trong các bài viết blog của mình

  Kịch bản: Include một file với tham số
    Giả sử tôi có thư mục _includes
    Và tôi có file "_includes/header.html" chứa nội dung "<header>My awesome blog header: {{include.param}}</header>"
    Và tôi có file "_includes/params.html" chứa nội dung "Parameters:<ul>{% for param in include %}<li>{{param[0]}} = {{param[1]}}</li>{% endfor %}</ul>"
    Và tôi có file "_includes/ignore.html" chứa nội dung "<footer>My blog footer</footer>"
    Và tôi có thư mục _posts
    Và tôi có các bài viết sau:
      | title                               | date       | type | content                                                                                                                 |
      | Include Files                       | 2013-03-21 | html | {% include header.html param="myparam" %}                                                                               |
      | Ignore params if unused             | 2013-03-21 | html | {% include ignore.html date="today" %}                                                                                  |
      | List multiple parameters            | 2013-03-21 | html | {% include params.html date="today" start="tomorrow" %}                                                                 |
      | Dont keep parameters                | 2013-03-21 | html | {% include ignore.html param="test" %}\n{% include header.html %}                                                       |
      | Allow params with spaces and quotes | 2013-04-07 | html | {% include params.html cool="param with spaces" super="\\"quoted\\"" single='has "quotes"' escaped='\\'single\\' quotes' %} |
      | Parameter syntax                    | 2013-04-12 | html | {% include params.html param1_or_2="value" %}                                                                           |
      | Pass a variable                     | 2013-06-22 | html | {% assign var = 'some text' %}{% include params.html local=var title=page.title %}                                    |
    Khi tôi chạy jekyll build
    Thì tôi nên nhận được trạng thái thoát bằng không
    Và thư mục _site nên tồn tại
    Và tôi nên thấy "<header>My awesome blog header: myparam</header>" trong "_site/2013/03/21/include-files.html"
    Và tôi không nên thấy "myparam" trong "_site/2013/03/21/ignore-params-if-unused.html"
    Và tôi nên thấy "<li>date = today</li>" trong "_site/2013/03/21/list-multiple-parameters.html"
    Và tôi nên thấy "<li>start = tomorrow</li>" trong "_site/2013/03/21/list-multiple-parameters.html"
    Và tôi không nên thấy "<header>My awesome blog header: myparam</header>" trong "_site/2013/03/21/dont-keep-parameters.html"
    Nhưng tôi nên thấy "<header>My awesome blog header: </header>" trong "_site/2013/03/21/dont-keep-parameters.html"
    Và tôi nên thấy "<li>cool = param with spaces</li>" trong "_site/2013/04/07/allow-params-with-spaces-and-quotes.html"
    Và tôi nên thấy "<li>super = \\\"quoted\\\"</li>" trong "_site/2013/04/07/allow-params-with-spaces-and-quotes.html"
    Và tôi nên thấy "<li>single = has \\\"quotes\\\"</li>" trong "_site/2013/04/07/allow-params-with-spaces-and-quotes.html"
    Và tôi nên thấy "<li>escaped = 'single' quotes</li>" trong "_site/2013/04/07/allow-params-with-spaces-and-quotes.html"
    Và tôi nên thấy "<li>param1_or_2 = value</li>" trong "_site/2013/04/12/parameter-syntax.html"
    Và tôi nên thấy "<li>local = some text</li>" trong "_site/2013/06/22/pass-a-variable.html"
    Và tôi nên thấy "<li>title = Pass a variable</li>" trong "_site/2013/06/22/pass-a-variable.html"

  Kịch bản: Include một file từ một biến
    Giả sử tôi có thư mục _includes
    Và tôi có file "_includes/snippet.html" chứa nội dung "a snippet"
    Và tôi có file "_includes/parametrized.html" chứa nội dung "works with {{include.what}}"
    Và tôi có file cấu hình với:
    | key           | value             |
    | include_file1 | snippet.html      |
    | include_file2 | parametrized.html |
    Và tôi có trang "index.html" chứa nội dung "{% include {{site.include_file1}} %} that {% include {{site.include_file2}} what='parameters' %}"
    Khi tôi chạy jekyll build
    Thì tôi nên nhận được trạng thái thoát bằng không
    Và thư mục _site nên tồn tại
    Và tôi nên thấy "a snippet that works with parameters" trong "_site/index.html"

  Kịch bản: Include một file biến trong một vòng lặp
    Giả sử tôi có thư mục _includes
    Và tôi có file "_includes/one.html" chứa nội dung "one"
    Và tôi có file "_includes/two.html" chứa nội dung "two"
    Và tôi có trang "index.html" với files "[one.html, two.html]" chứa nội dung "{% for file in page.files %}{% include {{file}} %} {% endfor %}"
    Khi tôi chạy jekyll build
    Thì tôi nên nhận được trạng thái thoát bằng không
    Và thư mục _site nên tồn tại
    Và tôi nên thấy "one two" trong "_site/index.html"

  Kịch bản: Include một file với biến và bộ lọc
    Giả sử tôi có thư mục _includes
    Và tôi có file "_includes/one.html" chứa nội dung "one included"
    Và tôi có file cấu hình với:
    | key          | value |
    | include_file | one   |
    Và tôi có trang "index.html" chứa nội dung "{% include {{ site.include_file | append: '.html' }} %}"
    Khi tôi chạy jekyll build
    Thì tôi nên nhận được trạng thái thoát bằng không
    Và thư mục _site nên tồn tại
    Và tôi nên thấy "one included" trong "_site/index.html"

  Kịch bản: Include một file với biến một phần
    Giả sử tôi có thư mục _includes
    Và tôi có file "_includes/one.html" chứa nội dung "one included"
    Và tôi có file cấu hình với:
    | key          | value |
    | include_file | one   |
    Và tôi có trang "index.html" chứa nội dung "{% include {{ site.include_file }}.html %}"
    Khi tôi chạy jekyll build
    Thì tôi nên nhận được trạng thái thoát bằng không
    Và thư mục _site nên tồn tại
    Và tôi nên thấy "one included" trong "_site/index.html"

  Kịch bản: Include một file và rebuild khi nội dung include thay đổi
    Giả sử tôi có thư mục _includes
    Và tôi có file "_includes/one.html" chứa nội dung "include"
    Và tôi có trang "index.html" chứa nội dung "{% include one.html %}"
    Khi tôi chạy jekyll build
    Thì tôi nên nhận được trạng thái thoát bằng không
    Và thư mục _site nên tồn tại
    Và tôi nên thấy "include" trong "_site/index.html"
    Khi tôi đợi 1 giây
    Thì tôi có file "_includes/one.html" chứa nội dung "include content changed"
    Khi tôi chạy jekyll build
    Thì tôi nên thấy "include content changed" trong "_site/index.html"

  Kịch bản: Include một file với nhiều biến
    Giả sử tôi có thư mục _includes
    Và tôi có file "_includes/header-en.html" chứa nội dung "include"
    Và tôi có trang "index.html" chứa nội dung "{% assign name = 'header' %}{% assign locale = 'en' %}{% include {{name}}-{{locale}}.html %}"
    Khi tôi chạy jekyll build
    Thì tôi nên nhận được trạng thái thoát bằng không
    Và thư mục _site nên tồn tại
    Và tôi nên thấy "include" trong "_site/index.html"

  Kịch bản: Include một đường dẫn file với chuỗi ký tự không phải chữ và số
    Giả sử tôi có thư mục _includes
    Và tôi có file "_includes/header-en.html" chứa nội dung "include"
    Và tôi có trang "index.html" chứa nội dung "{% include ./header-en.html %}"
    Khi tôi chạy jekyll build
    Thì tôi nên nhận được trạng thái thoát khác không
    Và tôi nên thấy "Invalid syntax for include tag." trong kết quả build
    Khi tôi có trang "index.html" chứa nội dung "{% include foo/.header-en.html %}"
    Khi tôi chạy jekyll build
    Thì tôi nên nhận được trạng thái thoát khác không
    Và tôi nên thấy "Invalid syntax for include tag." trong kết quả build
    Khi tôi có trang "index.html" chứa nội dung "{% include //header-en.html %}"
    Khi tôi chạy jekyll build
    Thì tôi nên nhận được trạng thái thoát khác không
    Và tôi nên thấy "Invalid syntax for include tag." trong kết quả build
    Khi tôi có trang "index.html" chứa nội dung "{% include ..header-en.html %}"
    Khi tôi chạy jekyll build
    Thì tôi nên nhận được trạng thái thoát khác không
    Và tôi nên thấy "Invalid syntax for include tag." trong kết quả build
    Khi tôi có trang "index.html" chứa nội dung "{% include header-en.html %}"
    Khi tôi chạy jekyll build
    Thì tôi nên nhận được trạng thái thoát bằng không
    Và thư mục _site nên tồn tại
    Và tôi nên thấy "include" trong "_site/index.html"
