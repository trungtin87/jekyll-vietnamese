Tính năng: frontmatter defaults
  Kịch bản: Sử dụng default cho các biến frontmatter nội bộ
    Giả sử tôi có thư mục _layouts
    Và tôi có layout pretty chứa nội dung "THIS IS THE LAYOUT: {{content}}"

    Và tôi có thư mục _posts
    Và tôi có bài viết sau:
      | title             | date       | content          |
      | default layout    | 2013-09-11 | just some post   |
    Và tôi có trang "index.html" với title "some title" chứa nội dung "just some page"

    Và tôi có file cấu hình với "defaults" được đặt thành "[{scope: {path: \"\"}, values: {layout: \"pretty\"}}]"

    Khi tôi chạy jekyll build
    Thì tôi nên nhận được trạng thái thoát bằng không
    Và thư mục _site nên tồn tại
    Và tôi nên thấy "THIS IS THE LAYOUT: <p>just some post</p>" trong "_site/2013/09/11/default-layout.html"
    Và tôi nên thấy "THIS IS THE LAYOUT: just some page" trong "_site/index.html"

  Kịch bản: Sử dụng default cho các biến frontmatter trong Liquid
    Giả sử tôi có thư mục _posts
    Và tôi có bài viết sau:
      | title        | date       | content                                          |
      | default data | 2013-09-11 | <p>{{page.custom}}</p><div>{{page.author}}</div> |
    Và tôi có trang "index.html" chứa nội dung "just {{page.custom}} by {{page.author}}"
    Và tôi có file cấu hình với "defaults" được đặt thành "[{scope: {path: \"\"}, values: {custom: \"some special data\", author: \"Ben\"}}]"
    Khi tôi chạy jekyll build
    Thì tôi nên nhận được trạng thái thoát bằng không
    Và thư mục _site nên tồn tại
    Và tôi nên thấy "<p>some special data</p>\n<div>Ben</div>" trong "_site/2013/09/11/default-data.html"
    Và tôi nên thấy "just some special data by Ben" trong "_site/index.html"

  Kịch bản: Ghi đè frontmatter defaults theo đường dẫn
    Giả sử tôi có thư mục _layouts
    Và tôi có layout root chứa nội dung "root: {{ content }}"
    Và tôi có layout subfolder chứa nội dung "subfolder: {{ content }}"

    Và tôi có thư mục _posts
    Và tôi có bài viết sau:
      | title | date       | content               |
      | about | 2013-10-14 | info on {{page.description}} |
    Và tôi có thư mục special/_posts
    Và tôi có bài viết sau trong "special":
      | title | date       | path  | content               |
      | about | 2013-10-14 | local | info on {{page.description}} |

    Và tôi có trang "index.html" với title "overview" chứa nội dung "Overview for {{page.description}}"
    Và tôi có trang "special/index.html" với title "section overview" chứa nội dung "Overview for {{page.description}}"

    Và tôi có file cấu hình với "defaults" được đặt thành "[{scope: {path: \"special\"}, values: {layout: \"subfolder\", description: \"the special section\"}}, {scope: {path: \"\"}, values: {layout: \"root\", description: \"the webpage\"}}]"

    Khi tôi chạy jekyll build
    Thì tôi nên nhận được trạng thái thoát bằng không
    Và thư mục _site nên tồn tại
    Và tôi nên thấy "root: <p>info on the webpage</p>" trong "_site/2013/10/14/about.html"
    Và tôi nên thấy "subfolder: <p>info on the special section</p>" trong "_site/special/2013/10/14/about.html"
    Và tôi nên thấy "root: Overview for the webpage" trong "_site/index.html"
    Và tôi nên thấy "subfolder: Overview for the special section" trong "_site/special/index.html"

  Kịch bản: Sử dụng các biến frontmatter theo đường dẫn tương đối
    Giả sử tôi có thư mục _layouts
    Và tôi có layout main chứa nội dung "main: {{ content }}"

    Và tôi có thư mục _posts
    Và tôi có bài viết sau:
      | title | date       | content                               |
      | about | 2013-10-14 | content of site/2013/10/14/about.html |
    Và tôi có thư mục special/_posts
    Và tôi có bài viết sau trong "special":
      | title  | date       | path  | content                                        |
      | about1 | 2013-10-14 | local | content of site/special/2013/10/14/about1.html |
      | about2 | 2013-10-14 | local | content of site/special/2013/10/14/about2.html |

    Và tôi có file cấu hình với "defaults" được đặt thành "[{scope: {path: \"special\"}, values: {layout: \"main\"}}, {scope: {path: \"special/_posts\"}, values: {layout: \"main\"}}, {scope: {path: \"_posts\"}, values: {layout: \"main\"}}]"

    Khi tôi chạy jekyll build
    Thì tôi nên nhận được trạng thái thoát bằng không
    Và thư mục _site nên tồn tại
    Và tôi nên thấy "main: <p>content of site/2013/10/14/about.html</p>" trong "_site/2013/10/14/about.html"
    Và tôi nên thấy "main: <p>content of site/special/2013/10/14/about1.html</p>" trong "_site/special/2013/10/14/about1.html"
    Và tôi nên thấy "main: <p>content of site/special/2013/10/14/about2.html</p>" trong "_site/special/2013/10/14/about2.html"

  Kịch bản: Sử dụng frontmatter scopes cho các thư mục con
    Giả sử tôi có thư mục _layouts
    Và tôi có layout main chứa nội dung "main: {{ content }}"

    Và tôi có thư mục _posts/en
    Và tôi có bài viết sau dưới "en":
      | title | date       | content                               |
      | helloworld | 2014-09-01 | {{page.lang}} is the current language |
    Và tôi có thư mục _posts/de
    Và tôi có bài viết sau dưới "de":
      | title  | date       | content                                        |
      | hallowelt | 2014-09-01 | {{page.lang}} is the current language |

    Và tôi có file cấu hình với "defaults" được đặt thành "[{scope: {path: \"_posts/en\"}, values: {layout: \"main\", lang: \"en\"}}, {scope: {path: \"_posts/de\"}, values: {layout: \"main\", lang: \"de\"}}]"

    Khi tôi chạy jekyll build
    Thì thư mục _site nên tồn tại
    Và tôi nên thấy "main: <p>en is the current language</p>" trong "_site/2014/09/01/helloworld.html"
    Và tôi nên thấy "main: <p>de is the current language</p>" trong "_site/2014/09/01/hallowelt.html"

  Kịch bản: Ghi đè frontmatter defaults theo loại
    Giả sử tôi có thư mục _posts
    Và tôi có bài viết sau:
      | title          | date       | content |
      | this is a post | 2013-10-14 | blabla  |
    Và tôi có trang "index.html" chứa nội dung "interesting stuff"
    Và tôi có file cấu hình với "defaults" được đặt thành "[{scope: {path: \"\", type: \"post\"}, values: {permalink: \"/post.html\"}}, {scope: {path: \"\", type: \"page\"}, values: {permalink: \"/page.html\"}}, {scope: {path: \"\"}, values: {permalink: \"/perma.html\"}}]"
    Khi tôi chạy jekyll build
    Thì tôi nên thấy "blabla" trong "_site/post.html"
    Và tôi nên thấy "interesting stuff" trong "_site/page.html"
    Nhưng file "_site/perma.html" không nên tồn tại

  Kịch bản: Frontmatter thực tế ghi đè defaults
    Giả sử tôi có thư mục _posts
    Và tôi có bài viết sau:
      | title    | date       | permalink         | author   | content                   |
      | override | 2013-10-14 | /frontmatter.html | some guy | a blog by {{page.author}} |
    Và tôi có trang "index.html" với permalink "override.html" chứa nội dung "nothing"
    Và tôi có file cấu hình với "defaults" được đặt thành "[{scope: {path: \"\"}, values: {permalink: \"/perma.html\", author: \"Chris\"}}]"
    Khi tôi chạy jekyll build
    Thì tôi nên thấy "a blog by some guy" trong "_site/frontmatter.html"
    Và tôi nên thấy "nothing" trong "_site/override.html"
    Nhưng file "_site/perma.html" không nên tồn tại

  Kịch bản: Định nghĩa permalink default cho posts
    Giả sử tôi có thư mục _posts
    Và tôi có bài viết sau:
      | title          | date       | category | content |
      | testpost       | 2013-10-14 | blog     | blabla  |
    Và tôi có file cấu hình với "defaults" được đặt thành "[{scope: {path: \"\", type: \"posts\"}, values: {permalink: \"/:categories/:title/\"}}]"
    Khi tôi chạy jekyll build
    Thì tôi nên thấy "blabla" trong "_site/blog/testpost/index.html"

  Kịch bản: Sử dụng frontmatter defaults trong collections
    Giả sử tôi có thư mục _slides
    Và tôi có file "index.html" chứa nội dung "nothing"
    Và tôi có file "_slides/slide1.html" với nội dung:
    """
    ---
    ---
    Value: {{ page.myval }}
    """
    Và tôi có file "_config.yml" với nội dung:
    """
      collections:
        slides:
          output: true
      defaults:
        -
          scope:
            path: ""
            type: slides
          values:
            myval: "Test"
    """
    Khi tôi chạy jekyll build
    Thì tôi nên nhận được trạng thái thoát bằng không
    Và thư mục _site nên tồn tại
    Và tôi nên thấy "Value: Test" trong "_site/slides/slide1.html"

  Kịch bản: Ghi đè frontmatter defaults bên trong một collection
    Giả sử tôi có thư mục _slides
    Và tôi có file "index.html" chứa nội dung "nothing"
    Và tôi có file "_slides/slide2.html" với nội dung:
    """
    ---
    myval: Override
    ---
    Value: {{ page.myval }}
    """
    Và tôi có file "_config.yml" với nội dung:
    """
      collections:
        slides:
          output: true
      defaults:
        -
          scope:
            path: ""
            type: slides
          values:
            myval: "Test"
    """
    Khi tôi chạy jekyll build
    Thì tôi nên nhận được trạng thái thoát bằng không
    Và thư mục _site nên tồn tại
    Và tôi nên thấy "Value: Override" trong "_site/slides/slide2.html"

  Kịch bản: Deep merge frontmatter defaults
    Giả sử tôi có trang "index.html" với fruit "{orange: 1}" chứa nội dung "Fruits: {{ page.fruit.orange | plus: page.fruit.apple }}"
    Và tôi có file cấu hình với "defaults" được đặt thành "[{scope: {path: \"\"}, values: {fruit: {apple: 2}}}]"
    Khi tôi chạy jekyll build
    Thì tôi nên thấy "Fruits: 3" trong "_site/index.html"
