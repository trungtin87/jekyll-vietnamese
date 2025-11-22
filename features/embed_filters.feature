Tính năng: Bộ lọc nhúng
  Là một hacker thích viết blog
  Tôi muốn có khả năng biến đổi văn bản bên trong một bài viết hoặc trang
  Để thực hiện những thứ tuyệt vời trong các bài viết của tôi

  Kịch bản: Chuyển đổi ngày thành XML schema
    Giả sử tôi có thư mục _posts
    Và tôi có thư mục _layouts
    Và tôi có bài viết sau:
      | title     | date       | layout  | content                                     |
      | Star Wars | 2009-03-27 | default | These aren't the droids you're looking for. |
    Và tôi có layout default chứa nội dung "{{ site.time | date_to_xmlschema }}"
    Khi tôi chạy jekyll build
    Thì tôi nên nhận được trạng thái thoát bằng không
    Và thư mục _site nên tồn tại
    Và tôi nên thấy ngày hôm nay trong "_site/2009/03/27/star-wars.html"

  Kịch bản: Escape văn bản cho XML
    Giả sử tôi có thư mục _posts
    Và tôi có thư mục _layouts
    Và tôi có bài viết sau:
      | title       | date       | layout  | content                                     |
      | Star & Wars | 2009-03-27 | default | These aren't the droids you're looking for. |
    Và tôi có layout default chứa nội dung "{{ page.title | xml_escape }}"
    Khi tôi chạy jekyll build
    Thì tôi nên nhận được trạng thái thoát bằng không
    Và thư mục _site nên tồn tại
    Và tôi nên thấy "Star &amp; Wars" trong "_site/2009/03/27/star-wars.html"

  Kịch bản: Tính số lượng từ
    Giả sử tôi có thư mục _posts
    Và tôi có thư mục _layouts
    Và tôi có bài viết sau:
      | title     | date       | layout  | content                                     |
      | Star Wars | 2009-03-27 | default | These aren't the droids you're looking for. |
    Và tôi có layout default chứa nội dung "{{ content | number_of_words }}"
    Khi tôi chạy jekyll build
    Thì tôi nên nhận được trạng thái thoát bằng không
    Và thư mục _site nên tồn tại
    Và tôi nên thấy "7" trong "_site/2009/03/27/star-wars.html"

  Kịch bản: Chuyển đổi một mảng thành một câu
    Giả sử tôi có thư mục _posts
    Và tôi có thư mục _layouts
    Và tôi có bài viết sau:
      | title     | date       | layout  | tags                   | content                                     |
      | Star Wars | 2009-03-27 | default | [scifi, movies, force] | These aren't the droids you're looking for. |
    Và tôi có layout default chứa nội dung "{{ page.tags | array_to_sentence_string }}"
    Khi tôi chạy jekyll build
    Thì tôi nên nhận được trạng thái thoát bằng không
    Và thư mục _site nên tồn tại
    Và tôi nên thấy "scifi, movies, and force" trong "_site/2009/03/27/star-wars.html"

  Kịch bản: Markdownify một chuỗi đã cho
    Giả sử tôi có thư mục _posts
    Và tôi có thư mục _layouts
    Và tôi có bài viết sau:
      | title     | date       | layout  | content                                     |
      | Star Wars | 2009-03-27 | default | These aren't the droids you're looking for. |
    Và tôi có layout default chứa nội dung "By {{ '_Obi-wan_' | markdownify }}"
    Khi tôi chạy jekyll build
    Thì tôi nên nhận được trạng thái thoát bằng không
    Và thư mục _site nên tồn tại
    Và tôi nên thấy "By <p><em>Obi-wan</em></p>" trong "_site/2009/03/27/star-wars.html"

  Kịch bản: Sắp xếp theo một biến tùy ý
    Giả sử tôi có thư mục _layouts
    Và tôi có trang sau:
      | title  | layout  | value | content   |
      | Page-1 | default | 8     | Something |
    Và tôi có trang sau:
      | title  | layout  | value | content   |
      | Page-2 | default | 6     | Something |
    Và tôi có layout default chứa nội dung "{{ site.pages | sort:'value' | map:'title' | join:', ' }}"
    Khi tôi chạy jekyll build
    Thì tôi nên nhận được trạng thái thoát bằng không
    Và thư mục _site nên tồn tại
    Và tôi nên thấy chính xác "Page-2, Page-1" trong "_site/page-1.html"
    Và tôi nên thấy chính xác "Page-2, Page-1" trong "_site/page-2.html"

  Kịch bản: Sắp xếp các trang theo title
    Giả sử tôi có thư mục _layouts
    Và tôi có các trang sau:
      | title | layout  | content |
      | Dog   | default | Run     |
      | Bird  | default | Fly     |
    Và tôi có trang sau:
      | layout  | content |
      | default | Jump    |
    Và tôi có layout default chứa nội dung "{% assign sorted_pages = site.pages | sort: 'title' %}The rule of {{ sorted_pages.size }}: {% for p in sorted_pages %}{{ p.content | strip_html | strip_newlines }}, {% endfor %}"
    Khi tôi chạy jekyll build
    Thì tôi nên nhận được trạng thái thoát bằng không
    Và thư mục _site nên tồn tại
    Và tôi nên thấy chính xác "The rule of 3: Jump, Fly, Run," trong "_site/bird.html"

  Kịch bản: Sắp xếp các trang theo title sắp xếp các trang không có title cuối cùng
    Giả sử tôi có thư mục _layouts
    Và tôi có các trang sau:
      | title | layout  | content |
      | Dog   | default | Run     |
      | Bird  | default | Fly     |
    Và tôi có trang sau:
      | layout  | content |
      | default | Jump    |
    Và tôi có layout default chứa nội dung "{% assign sorted_pages = site.pages | sort: 'title', 'last' %}The rule of {{ sorted_pages.size }}: {% for p in sorted_pages %}{{ p.content | strip_html | strip_newlines }}, {% endfor %}"
    Khi tôi chạy jekyll build
    Thì tôi nên nhận được trạng thái thoát bằng không
    Và thư mục _site nên tồn tại
    Và tôi nên thấy chính xác "The rule of 3: Fly, Run, Jump," trong "_site/bird.html"

  Kịch bản: Lọc các bài viết theo thuộc tính và giá trị đã cho
    Giả sử tôi có thư mục _posts
    Và tôi có các bài viết sau:
      | title    | date       | content   | property                  |
      | Bird     | 2019-03-13 | Chirp     | [nature, sounds]          |
      | Cat      | 2019-03-14 | Meow      | [sounds]                  |
      | Dog      | 2019-03-15 | Bark      |                           |
      | Elephant | 2019-03-16 | Asiatic   | wildlife                  |
      | Goat     | 2019-03-17 | Mountains | ""                        |
      | Horse    | 2019-03-18 | Mustang   | []                        |
      | Iguana   | 2019-03-19 | Reptile   | {}                        |
      | Jaguar   | 2019-03-20 | Reptile   | {foo: lorem, bar: nature} |
    Và tôi có trang "string-value.md" với nội dung:
      """
      {% assign pool = site.posts | reverse | where: 'property', 'wildlife' %}
      {{ pool | map: 'title' | join: ', ' }}
      """
    Và tôi có trang "string-value-array.md" với nội dung:
      """
      {% assign pool = site.posts | reverse | where: 'property', 'sounds' %}
      {{ pool | map: 'title' | join: ', ' }}
      """
    Và tôi có trang "string-value-hash.md" với nội dung:
      """
      {% assign pool = site.posts | reverse | where: 'property', 'nature' %}
      {{ pool | map: 'title' | join: ', ' }}
      """
    Và tôi có trang "nil-value.md" với nội dung:
      """
      {% assign pool = site.posts | reverse | where: 'property', nil %}
      {{ pool | map: 'title' | join: ', ' }}
      """
    Và tôi có trang "empty-liquid-literal.md" với nội dung:
      """
      {% assign pool = site.posts | reverse | where: 'property', empty %}
      {{ pool | map: 'title' | join: ', ' }}
      """
    Và tôi có trang "blank-liquid-literal.md" với nội dung:
      """
      {% assign pool = site.posts | reverse | where: 'property', blank %}
      {{ pool | map: 'title' | join: ', ' }}
      """
    Khi tôi chạy jekyll build
    Thì tôi nên nhận được trạng thái thoát bằng không
    Và thư mục _site nên tồn tại
    Và tôi nên thấy chính xác "<p>Elephant</p>" trong "_site/string-value.html"
    Và tôi nên thấy chính xác "<p>Bird, Cat</p>" trong "_site/string-value-array.html"
    Và tôi nên thấy chính xác "<p>Bird</p>" trong "_site/string-value-hash.html"
    Và tôi nên thấy chính xác "<p>Dog</p>" trong "_site/nil-value.html"
    Và tôi nên thấy chính xác "<p>Dog, Goat, Horse, Iguana</p>" trong "_site/empty-liquid-literal.html"
    Và tôi nên thấy chính xác "<p>Dog, Goat, Horse, Iguana</p>" trong "_site/blank-liquid-literal.html"
