Tính năng: Cấu hình site
  Là một hacker thích viết blog
  Tôi muốn có khả năng cấu hình jekyll
  Để làm cho việc thiết lập một site dễ dàng hơn

  Kịch bản: Thay đổi thư mục source
    Giả sử tôi có một blank site trong "_sourcedir"
    Và tôi có file "_sourcedir/index.html" chứa nội dung "Changing source directory"
    Và tôi có file cấu hình với "source" được đặt thành "_sourcedir"
    Khi tôi chạy jekyll build
    Thì tôi nên nhận được trạng thái thoát bằng không
    Và thư mục _site nên tồn tại
    Và tôi nên thấy "Changing source directory" trong "_site/index.html"

  Kịch bản: Thay đổi thư mục destination
    Giả sử tôi có file "index.html" chứa nội dung "Changing destination directory"
    Và tôi có file cấu hình với "destination" được đặt thành "_mysite"
    Khi tôi chạy jekyll build
    Thì thư mục _mysite nên tồn tại
    Và tôi nên thấy "Changing destination directory" trong "_mysite/index.html"

  Khung kịch bản: Source và destination có tên tương tự
    Giả sử tôi có một blank site trong "<source>"
    Và tôi có trang "<source>/index.md" chứa nội dung "markdown"
    Và tôi có file cấu hình với:
    | key         | value    |
    | source      | <source> |
    | destination | <dest>   |
    Khi tôi chạy jekyll build
    Thì thư mục <source> nên tồn tại
    Và file "<dest>/index.html" nên <file_exist> tồn tại
    Và tôi nên thấy "markdown" trong "<source>/index.md"

    Ví dụ:
      | source        | dest        | file_exist |
      | mysite_source | mysite      |            |
      | mysite        | mysite_dest |            |
      | mysite/       | mysite      | không      |
      | mysite        | ./mysite    | không      |
      | mysite/source | mysite      | không      |
      | mysite        | mysite/dest |            |

  Kịch bản: Exclude files inline
    Giả sử tôi có file "Rakefile" chứa nội dung "I want to be excluded"
    Và tôi có file "README" chứa nội dung "I want to be excluded"
    Và tôi có file "index.html" chứa nội dung "I want to be included"
    Và tôi có file "Gemfile" chứa nội dung "gem 'include-me'"
    Và tôi có file cấu hình với "exclude" được đặt thành "['Rakefile', 'README']"
    Khi tôi chạy jekyll build
    Thì tôi nên thấy "I want to be included" trong "_site/index.html"
    Và file "_site/Gemfile" không nên tồn tại
    Và file "_site/Rakefile" không nên tồn tại
    Và file "_site/README" không nên tồn tại

  Kịch bản: Exclude files với YAML array
    Giả sử tôi có file "Rakefile" chứa nội dung "I want to be excluded"
    Và tôi có file "README" chứa nội dung "I want to be excluded"
    Và tôi có file "index.html" chứa nội dung "I want to be included"
    Và tôi có file "Gemfile" chứa nội dung "gem 'include-me'"
    Và tôi có file cấu hình với "exclude" được đặt thành:
      | value    |
      | README   |
      | Rakefile |
    Khi tôi chạy jekyll build
    Thì tôi nên thấy "I want to be included" trong "_site/index.html"
    Và file "_site/Rakefile" không nên tồn tại
    Và file "_site/README" không nên tồn tại
    Và file "_site/Gemfile" không nên tồn tại

  Kịch bản: Copy các files bị excluded khi thư mục của chúng được include một cách rõ ràng
    Giả sử tôi có file ".gitignore" chứa nội dung ".DS_Store"
    Và tôi có file ".htaccess" chứa nội dung "SomeDirective"
    Và tôi có file "Gemfile" chứa nội dung "gem 'include-me'"
    Và tôi có thư mục node_modules
    Và tôi có file "node_modules/bazinga.js" chứa nội dung "var c = 'Bazinga!';"
    Và tôi có file "node_modules/warning.js" chứa nội dung "var w = 'Winter is coming!';"
    Và tôi có file cấu hình với "include" được đặt thành:
      | value        |
      | .gitignore   |
      | .foo         |
      | Gemfile      |
      | node_modules |
    Khi tôi chạy jekyll build
    Thì tôi nên nhận được trạng thái thoát bằng không
    Và thư mục _site nên tồn tại
    Và file "_site/.htaccess" không nên tồn tại
    Nhưng tôi nên thấy ".DS_Store" trong "_site/.gitignore"
    Và tôi nên thấy "gem 'include-me'" trong "_site/Gemfile"
    Và tôi nên thấy "var c = 'Bazinga!';" trong "_site/node_modules/bazinga.js"
    Và tôi nên thấy "var w = 'Winter is coming!';" trong "_site/node_modules/warning.js"

  Kịch bản: Copy các files bị excluded chỉ khi chúng được include một cách rõ ràng
    Giả sử tôi có file ".gitignore" chứa nội dung ".DS_Store"
    Và tôi có file ".htaccess" chứa nội dung "SomeDirective"
    Và tôi có thư mục node_modules
    Và tôi có file "node_modules/bazinga.js" chứa nội dung "var c = 'Bazinga!';"
    Và tôi có file "node_modules/warning.js" chứa nội dung "var w = 'Winter is coming!';"
    Và tôi có file cấu hình với "include" được đặt thành:
      | value                   |
      | .gitignore              |
      | .foo                    |
      | node_modules/bazinga.js |
    Khi tôi chạy jekyll build
    Thì tôi nên nhận được trạng thái thoát bằng không
    Và thư mục _site nên tồn tại
    Và file "_site/.htaccess" không nên tồn tại
    Nhưng tôi nên thấy ".DS_Store" trong "_site/.gitignore"
    Và tôi nên thấy "var c = 'Bazinga!';" trong "_site/node_modules/bazinga.js"
    Nhưng file "_site/node_modules/warning.js" không nên tồn tại

  Kịch bản: Copy các wild-card files bị excluded chỉ khi chúng được include một cách rõ ràng
    Giả sử tôi có file ".gitignore" chứa nội dung ".DS_Store"
    Và tôi có file ".htaccess" chứa nội dung "SomeDirective"
    Và tôi có file "foo.txt" chứa nội dung "Lorem Ipsum"
    Và tôi có trang "index.md" chứa nội dung "{{ site.title }}"
    Và tôi có trang "about.md" chứa nội dung "{{ site.author }}"
    Và tôi có file cấu hình với:
      | key      | value        |
      | title    | Barren Site  |
      | author   | John Doe     |
      | exclude  | ["**"]       |
    Khi tôi chạy jekyll build
    Thì tôi nên nhận được trạng thái thoát bằng không
    Và thư mục _site nên tồn tại
    Và file "_site/.gitignore" không nên tồn tại
    Và file "_site/foo.txt" không nên tồn tại
    Và file "_site/index.html" không nên tồn tại
    Và file "_site/about.html" không nên tồn tại
    Nhưng file "_site/.htaccess" nên tồn tại
    Giả sử tôi có file cấu hình với:
      | key      | value        |
      | title    | Barren Site  |
      | author   | John Doe     |
      | exclude  | ["**"]       |
      | include  | ["about.md"] |
    Khi tôi chạy jekyll build
    Thì tôi nên nhận được trạng thái thoát bằng không
    Và thư mục _site nên tồn tại
    Và file "_site/.gitignore" không nên tồn tại
    Và file "_site/foo.txt" không nên tồn tại
    Và file "_site/index.html" không nên tồn tại
    Và file "_site/.htaccess" không nên tồn tại
    Nhưng file "_site/about.html" nên tồn tại
    Và tôi nên thấy "John Doe" trong "_site/about.html"

  Kịch bản: Process các files được included chỉ một lần
    Giả sử tôi có trang ".foobar" chứa nội dung "dotfile with front matter"
    Và tôi có file ".htaccess" chứa nội dung "SomeDirective"
    Và tôi có file "_redirects" chứa nội dung "/foo/* /bar/* 301!"
    Và tôi có file "index.md" với nội dung:
      """
      ---
      ---

        Dotpages: {{ site.pages | where: 'path', '.foobar' | size }}
      Dotstatics: {{ site.static_files | where: 'path', '/_redirects' | size }}
      """
    Và tôi có file cấu hình với "title" được đặt thành "Hello World"
    Khi tôi chạy jekyll build
    Thì tôi nên nhận được trạng thái thoát bằng không
    Và thư mục _site nên tồn tại
    Nhưng file "_site/.foobar" không nên tồn tại
    Và file "_site/_redirects" không nên tồn tại
    Và tôi nên thấy "Dotpages: 0" trong "_site/index.html"
    Và tôi nên thấy "Dotstatics: 0" trong "_site/index.html"

    Khi tôi có file cấu hình với:
      | key     | value                 |
      | title   | Hello World           |
      | include | [.foobar, _redirects] |
    Khi tôi chạy jekyll build
    Thì tôi nên nhận được trạng thái thoát bằng không
    Và tôi không nên thấy "Conflict:" trong kết quả build
    Và thư mục _site nên tồn tại
    Và file "_site/.foobar" nên tồn tại
    Và file "_site/_redirects" nên tồn tại
    Và tôi nên thấy "Dotpages: 1" trong "_site/index.html"
    Và tôi nên thấy "Dotstatics: 1" trong "_site/index.html"

  Kịch bản: Sử dụng Kramdown cho markup
    Giả sử tôi có trang "index.markdown" chứa nội dung "[Google](https://www.google.com)"
    Và tôi có file cấu hình với "markdown" được đặt thành "kramdown"
    Khi tôi chạy jekyll build
    Thì tôi nên nhận được trạng thái thoát bằng không
    Và thư mục _site nên tồn tại
    Và tôi nên thấy "<a href=\"https://www.google.com\">Google</a>" trong "_site/index.html"

  Kịch bản: Highlight code với rouge
    Giả sử tôi có trang "index.html" chứa nội dung "{% highlight ruby %} puts 'Hello world!' {% endhighlight %}"
    Và tôi có file cấu hình với "highlighter" được đặt thành "rouge"
    Khi tôi chạy jekyll build
    Thì tôi nên nhận được trạng thái thoát bằng không
    Và thư mục _site nên tồn tại
    Và tôi nên thấy "Hello world!" trong "_site/index.html"
    Và tôi nên thấy "class=\"highlight\"" trong "_site/index.html"

  Kịch bản: Rouge renders code block một lần
    Giả sử tôi có file cấu hình với "highlighter" được đặt thành "rouge"
    Và tôi có thư mục _posts
    Và tôi có bài viết sau:
      | title | date             | layout  | content                                      |
      | foo   | 2014-04-27 11:34 | default | {% highlight text %} test {% endhighlight %} |
    Khi tôi chạy jekyll build
    Thì tôi không nên thấy "highlight(.*)highlight" trong "_site/2014/04/27/foo.html"

  Kịch bản: Đặt time và không có posts có ngày trong tương lai
    Giả sử tôi có thư mục _layouts
    Và tôi có layout page chứa nội dung "Page Layout: {{ site.posts.size }} on {{ site.time | date: \"%Y-%m-%d\" }}"
    Và tôi có layout post chứa nội dung "Post Layout: {{ content }}"
    Và tôi có trang "index.html" với layout "page" chứa nội dung "site index page"
    Và tôi có file cấu hình với:
      | key         | value        |
      | time        | 2010-01-01   |
      | future      | false        |
    Và tôi có thư mục _posts
    Và tôi có các bài viết sau:
      | title  | date       | layout | content             |
      | entry1 | 2007-12-31 | post   | content for entry1. |
      | entry2 | 2020-01-31 | post   | content for entry2. |
    Khi tôi chạy jekyll build
    Thì tôi nên nhận được trạng thái thoát bằng không
    Và thư mục _site nên tồn tại
    Và tôi nên thấy "Page Layout: 1 on 2010-01-01" trong "_site/index.html"
    Và tôi nên thấy "Post Layout: <p>content for entry1.</p>" trong "_site/2007/12/31/entry1.html"
    Và file "_site/2020/01/31/entry2.html" không nên tồn tại

  Kịch bản: Đặt time và cho phép posts có ngày trong tương lai
    Giả sử tôi có thư mục _layouts
    Và tôi có layout page chứa nội dung "Page Layout: {{ site.posts.size }} on {{ site.time | date: \"%Y-%m-%d\" }}"
    Và tôi có layout post chứa nội dung "Post Layout: {{ content }}"
    Và tôi có trang "index.html" với layout "page" chứa nội dung "site index page"
    Và tôi có file cấu hình với:
      | key         | value        |
      | time        | 2010-01-01   |
      | future      | true         |
    Và tôi có thư mục _posts
    Và tôi có các bài viết sau:
      | title  | date       | layout | content             |
      | entry1 | 2007-12-31 | post   | content for entry1. |
      | entry2 | 2020-01-31 | post   | content for entry2. |
    Khi tôi chạy jekyll build
    Thì tôi nên nhận được trạng thái thoát bằng không
    Và thư mục _site nên tồn tại
    Và tôi nên thấy "Page Layout: 2 on 2010-01-01" trong "_site/index.html"
    Và tôi nên thấy "Post Layout: <p>content for entry1.</p>" trong "_site/2007/12/31/entry1.html"
    Và tôi nên thấy "Post Layout: <p>content for entry2.</p>" trong "_site/2020/01/31/entry2.html"

    Kịch bản: Tạo ngày đúng với timezone được đặt rõ ràng (giống với time của posts)
      Giả sử tôi có thư mục _layouts
      Và tôi có layout page chứa nội dung "Page Layout: {{ site.posts.size }}"
      Và tôi có layout post chứa nội dung "Post Layout: {{ content }} built at {{ page.date | date_to_xmlschema }}"
      Và tôi có trang "index.html" với layout "page" chứa nội dung "site index page"
      Và tôi có file cấu hình với:
        | key         | value            |
        | timezone    | America/New_York |
      Và tôi có thư mục _posts
      Và tôi có các bài viết sau:
        | title     | date                   | layout  | content             |
        | entry1    | 2013-04-09 23:22 -0400 | post    | content for entry1. |
        | entry2    | 2013-04-10 03:14 -0400 | post    | content for entry2. |
      Khi tôi chạy jekyll build
      Thì tôi nên nhận được trạng thái thoát bằng không
      Và thư mục _site nên tồn tại
      Và tôi nên thấy "Page Layout: 2" trong "_site/index.html"
      Và tôi nên thấy "Post Layout: <p>content for entry1.</p>\n built at" trong "_site/2013/04/09/entry1.html"
      Và tôi nên thấy "Post Layout: <p>content for entry2.</p>\n built at" trong "_site/2013/04/10/entry2.html"
      Và tôi nên thấy ngày "2013-04-09T23:22:00-04:00" trong "_site/2013/04/09/entry1.html" trừ khi Windows
      Và tôi nên thấy ngày "2013-04-09T22:22:00-05:00" trong "_site/2013/04/09/entry1.html" nếu trên Windows
      Và tôi nên thấy ngày "2013-04-10T03:14:00-04:00" trong "_site/2013/04/10/entry2.html" trừ khi Windows
      Và tôi nên thấy ngày "2013-04-10T02:14:00-05:00" trong "_site/2013/04/10/entry2.html" nếu trên Windows

    Kịch bản: Tạo ngày đúng với timezone được đặt rõ ràng (khác với time của posts)
      Giả sử tôi có thư mục _layouts
      Và tôi có layout page chứa nội dung "Page Layout: {{ site.posts.size }}"
      Và tôi có layout post chứa nội dung "Post Layout: {{ content }} built at {{ page.date | date_to_xmlschema }}"
      Và tôi có trang "index.html" với layout "page" chứa nội dung "site index page"
      Và tôi có file cấu hình với:
        | key         | value                |
        | timezone    | Pacific/Honolulu     |
      Và tôi có thư mục _posts
      Và tôi có các bài viết sau:
        | title     | date                   | layout  | content             |
        | entry1    | 2013-04-09 23:22 +0400 | post    | content for entry1. |
        | entry2    | 2013-04-10 03:14 +0400 | post    | content for entry2. |
      Khi tôi chạy jekyll build
      Thì tôi nên nhận được trạng thái thoát bằng không
    Và thư mục _site nên tồn tại
      Và tôi nên thấy "Page Layout: 2" trong "_site/index.html"
      Và file "_site/2013/04/09/entry1.html" nên tồn tại
      Và file "_site/2013/04/09/entry2.html" nên tồn tại
      Và tôi nên thấy "Post Layout: <p>content for entry1.</p>\n built at 2013-04-09T09:22:00-10:00" trong "_site/2013/04/09/entry1.html"
      Và tôi nên thấy "Post Layout: <p>content for entry2.</p>\n built at 2013-04-09T13:14:00-10:00" trong "_site/2013/04/09/entry2.html"

    Kịch bản: Tạo ngày đúng với timezone được đặt rõ ràng (sử dụng non-half hour offset)
      Giả sử tôi có thư mục _layouts
      Và tôi có layout page chứa nội dung "Page Layout: {{ site.posts.size }}"
      Và tôi có layout post chứa nội dung "Post Layout: {{ content }} built at {{ page.date | date_to_xmlschema }}"
      Và tôi có trang "index.html" với layout "page" chứa nội dung "site index page"
      Và tôi có file cấu hình với:
        | key         | value           |
        | timezone    | Australia/Eucla |
      Và tôi có thư mục _posts
      Và tôi có các bài viết sau:
        | title     | date                   | layout  | content             |
        | entry1    | 2013-04-09 23:22 +0400 | post    | content for entry1. |
        | entry2    | 2013-04-10 03:14 +0400 | post    | content for entry2. |
      Khi tôi chạy jekyll build
      Thì tôi nên nhận được trạng thái thoát bằng không
    Và thư mục _site nên tồn tại
      Và tôi nên thấy "Page Layout: 2" trong "_site/index.html"
      Và file "_site/2013/04/10/entry1.html" nên tồn tại
      Và file "_site/2013/04/10/entry2.html" nên tồn tại
      Và tôi nên thấy "Post Layout: <p>content for entry1.</p>\n built at 2013-04-10T04:07:00\\+08:45" trong "_site/2013/04/10/entry1.html"
      Và tôi nên thấy "Post Layout: <p>content for entry2.</p>\n built at 2013-04-10T07:59:00\\+08:45" trong "_site/2013/04/10/entry2.html"

  Kịch bản: Giới hạn số lượng posts được tạo theo ngày gần nhất
    Giả sử tôi có thư mục _posts
    Và tôi có file cấu hình với:
      | key         | value       |
      | limit_posts | 2           |
    Và tôi có các bài viết sau:
      | title   | date       | content                  |
      | Apples  | 2009-03-27 | An article about apples  |
      | Oranges | 2009-04-01 | An article about oranges |
      | Bananas | 2009-04-05 | An article about bananas |
    Khi tôi chạy jekyll build
    Thì tôi nên nhận được trạng thái thoát bằng không
    Và thư mục _site nên tồn tại
    Và file "_site/2009/04/05/bananas.html" nên tồn tại
    Và file "_site/2009/04/01/oranges.html" nên tồn tại
    Và file "_site/2009/03/27/apples.html" không nên tồn tại

  Kịch bản: Sử dụng một thư mục layouts khác
    Giả sử tôi có thư mục _theme
    Và tôi có theme page chứa nội dung "Page Layout: {{ site.posts.size }} on {{ site.time | date: \"%Y-%m-%d\" }}"
    Và tôi có theme post chứa nội dung "Post Layout: {{ content }}"
    Và tôi có trang "index.html" với layout "page" chứa nội dung "site index page"
    Và tôi có file cấu hình với:
      | key         | value        |
      | time        | 2010-01-01   |
      | future      | true         |
      | layouts_dir | _theme       |
    Và tôi có thư mục _posts
    Và tôi có các bài viết sau:
      | title  | date       | layout | content             |
      | entry1 | 2007-12-31 | post   | content for entry1. |
      | entry2 | 2020-01-31 | post   | content for entry2. |
    Khi tôi chạy jekyll build
    Thì tôi nên nhận được trạng thái thoát bằng không
    Và thư mục _site nên tồn tại
    Và tôi nên thấy "Page Layout: 2 on 2010-01-01" trong "_site/index.html"
    Và tôi nên thấy "Post Layout: <p>content for entry1.</p>" trong "_site/2007/12/31/entry1.html"
    Và tôi nên thấy "Post Layout: <p>content for entry2.</p>" trong "_site/2020/01/31/entry2.html"

  Kịch bản: Đọc file tùy ý qua layouts
    Giả sử tôi có trang "index.html" với layout "page" chứa nội dung "FOO"
    Và tôi có file "_config.yml" chứa nội dung "layouts: '../../../../../../../../../../../../../../usr/include'"
    Khi tôi chạy jekyll build
    Thì tôi nên nhận được trạng thái thoát bằng không
    Và thư mục _site nên tồn tại
    Và tôi nên thấy "FOO" trong "_site/index.html"
    Và tôi không nên thấy " " trong "_site/index.html"
