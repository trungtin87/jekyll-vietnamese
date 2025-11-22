Tính năng: Permalinks đẹp
  Là một hacker thích viết blog
  Tôi muốn có khả năng đặt permalinks
  Để làm cho các URL blog của tôi tuyệt vời

  Kịch bản: Sử dụng permalink schema none
    Giả sử tôi có thư mục _posts
    Và tôi có bài viết sau:
      | title                 | date       | content          |
      | None Permalink Schema | 2009-03-27 | Totally nothing. |
    Và tôi có file cấu hình với "permalink" được đặt thành "none"
    Khi tôi chạy jekyll build
    Thì tôi nên nhận được trạng thái thoát bằng không
    Và thư mục _site nên tồn tại
    Và tôi nên thấy "Totally nothing." trong "_site/none-permalink-schema.html"

  Kịch bản: Sử dụng permalink schema pretty
    Giả sử tôi có thư mục _posts
    Và tôi có bài viết sau:
      | title                   | date       | content            |
      | Pretty Permalink Schema | 2009-03-27 | Totally wordpress. |
    Và tôi có file cấu hình với "permalink" được đặt thành "pretty"
    Khi tôi chạy jekyll build
    Thì tôi nên nhận được trạng thái thoát bằng không
    Và thư mục _site nên tồn tại
    Và tôi nên thấy "Totally wordpress." trong "_site/2009/03/27/pretty-permalink-schema/index.html"

  Kịch bản: Sử dụng permalink schema pretty cho pages
    Giả sử tôi có trang "index.html" chứa nội dung "Totally index"
    Và tôi có trang "awesome.html" chứa nội dung "Totally awesome"
    Và tôi có trang "sitemap.xml" chứa nội dung "Totally uhm, sitemap"
    Và tôi có file cấu hình với "permalink" được đặt thành "pretty"
    Khi tôi chạy jekyll build
    Thì tôi nên nhận được trạng thái thoát bằng không
    Và thư mục _site nên tồn tại
    Và tôi nên thấy "Totally index" trong "_site/index.html"
    Và tôi nên thấy "Totally awesome" trong "_site/awesome/index.html"
    Và tôi nên thấy "Totally uhm, sitemap" trong "_site/sitemap.xml"

  Kịch bản: Sử dụng permalink schema tùy chỉnh với prefix
    Giả sử tôi có thư mục _posts
    Và tôi có bài viết sau:
      | title                   | category | date       | content         |
      | Custom Permalink Schema | stuff    | 2009-03-27 | Totally custom. |
    Và tôi có file cấu hình với "permalink" được đặt thành "/blog/:year/:month/:day/:title/"
    Khi tôi chạy jekyll build
    Thì tôi nên nhận được trạng thái thoát bằng không
    Và thư mục _site nên tồn tại
    Và tôi nên thấy "Totally custom." trong "_site/blog/2009/03/27/custom-permalink-schema/index.html"

  Kịch bản: Sử dụng permalink schema tùy chỉnh với category
    Giả sử tôi có thư mục _posts
    Và tôi có bài viết sau:
      | title                   | category | date       | content         |
      | Custom Permalink Schema | stuff    | 2009-03-27 | Totally custom. |
    Và tôi có file cấu hình với "permalink" được đặt thành "/:categories/:title.html"
    Khi tôi chạy jekyll build
    Thì tôi nên nhận được trạng thái thoát bằng không
    Và thư mục _site nên tồn tại
    Và tôi nên thấy "Totally custom." trong "_site/stuff/custom-permalink-schema.html"

  Kịch bản: Sử dụng permalink schema tùy chỉnh với ngày nén
    Giả sử tôi có thư mục _posts
    Và tôi có bài viết sau:
      | title                   | category | date       | content         |
      | Custom Permalink Schema | stuff    | 2009-03-27 | Totally custom. |
    Và tôi có file cấu hình với "permalink" được đặt thành "/:month-:day-:year/:title.html"
    Khi tôi chạy jekyll build
    Thì tôi nên nhận được trạng thái thoát bằng không
    Và thư mục _site nên tồn tại
    Và tôi nên thấy "Totally custom." trong "_site/03-27-2009/custom-permalink-schema.html"

  Kịch bản: Sử dụng permalink schema tùy chỉnh với ngày và giờ
    Giả sử tôi có file cấu hình với:
    | key         | value              |
    | permalink   | "/:year:month:day:hour:minute:second.html" |
    | timezone    | UTC                |
    Và tôi có thư mục _posts
    Và tôi có bài viết sau:
      | title                   | category | date                | content         |
      | Custom Permalink Schema | stuff    | 2009-03-27 22:31:07 | Totally custom. |
    Khi tôi chạy jekyll build
    Thì tôi nên nhận được trạng thái thoát bằng không
    Và thư mục _site nên tồn tại
    Và tôi nên thấy "Totally custom." trong "_site/20090327223107.html"

  Kịch bản: Sử dụng permalink cho từng bài viết
    Giả sử tôi có thư mục _posts
    Và tôi có bài viết sau:
      | title     | date       | permalink       | content |
      | Some post | 2013-04-14 | /custom/posts/1/ | bla bla |
    Khi tôi chạy jekyll build
    Thì tôi nên nhận được trạng thái thoát bằng không
    Và thư mục _site nên tồn tại
    Và thư mục _site/custom/posts/1 nên tồn tại
    Và tôi nên thấy "bla bla" trong "_site/custom/posts/1/index.html"

  Kịch bản: Sử dụng permalink cho từng bài viết kết thúc bằng .html
    Giả sử tôi có thư mục _posts
    Và tôi có bài viết sau:
      | title     | date       | permalink               | content |
      | Some post | 2013-04-14 | /custom/posts/some.html | bla bla |
    Khi tôi chạy jekyll build
    Thì tôi nên nhận được trạng thái thoát bằng không
    Và thư mục _site nên tồn tại
    Và thư mục _site/custom/posts nên tồn tại
    Và tôi nên thấy "bla bla" trong "_site/custom/posts/some.html"

  Kịch bản: Sử dụng permalink schema pretty với tên file có chữ hoa
    Giả sử tôi có thư mục _posts
    Và tôi có trang "_posts/2009-03-27-Pretty-Permalink-Schema.md" chứa nội dung "Totally wordpress"
    Và tôi có file cấu hình với "permalink" được đặt thành "pretty"
    Khi tôi chạy jekyll build
    Thì tôi nên nhận được trạng thái thoát bằng không
    Và thư mục _site nên tồn tại
    Và tôi nên thấy "Totally wordpress." trong "_site/2009/03/27/Pretty-Permalink-Schema/index.html"

  Kịch bản: Sử dụng permalink schema tùy chỉnh với tên file có chữ hoa
    Giả sử tôi có thư mục _posts
    Và tôi có trang "_posts/2009-03-27-Custom-Schema.md" với title "Custom Schema" chứa nội dung "Totally awesome"
    Và tôi có file cấu hình với "permalink" được đặt thành "/:year/:month/:day/:slug/"
    Khi tôi chạy jekyll build
    Thì tôi nên nhận được trạng thái thoát bằng không
    Và thư mục _site nên tồn tại
    Và tôi nên thấy "Totally awesome" trong "_site/2009/03/27/custom-schema/index.html"

  Kịch bản: Sử dụng permalink schema pretty với title chứa dấu gạch dưới
    Giả sử tôi có thư mục _posts
    Và tôi có trang "_posts/2009-03-27-Custom_Schema.md" với title "Custom Schema" chứa nội dung "Totally awesome"
    Và tôi có file cấu hình với "permalink" được đặt thành "pretty"
    Khi tôi chạy jekyll build
    Thì tôi nên nhận được trạng thái thoát bằng không
    Và thư mục _site nên tồn tại
    Và tôi nên thấy "Totally awesome" trong "_site/2009/03/27/Custom_Schema/index.html"

  Kịch bản: Sử dụng phần mở rộng file không phải HTML trong permalink
    Giả sử tôi có thư mục _posts
    Và tôi có trang "_posts/2016-01-18-i-am-php.md" với permalink "/2016/i-am-php.php" chứa nội dung "I am PHP"
    Và tôi có trang "i-am-also-php.md" với permalink "/i-am-also-php.php" chứa nội dung "I am also PHP"
    Khi tôi chạy jekyll build
    Thì tôi nên nhận được trạng thái thoát bằng không
    Và thư mục _site nên tồn tại
    Và tôi nên thấy "I am PHP" trong "_site/2016/i-am-php.php"
    Và tôi nên thấy "I am also PHP" trong "_site/i-am-also-php.php"

  Kịch bản: Sử dụng cùng một permalink hai lần
    Giả sử tôi có trang "cool.md" với permalink "/amazing.html" chứa nội dung "I am cool"
    Và tôi có trang "awesome.md" với permalink "/amazing.html" chứa nội dung "I am also awesome"
    Và tôi có file "amazing.html" với nội dung:
      """
      Hello World
      I'm a static file
      """
    Và tôi có file "_config.yml" với nội dung:
      """
      collections:
        puppies:
          output: true
          permalink: /:collection/:year/:month/:day/:title:output_ext
      """
    Và tôi có thư mục _puppies
    Và tôi có các tài liệu sau trong collection puppies:
      | title  | date       | content             |
      | Rover  | 2009-03-27 | content for Rover.  |
    Và tôi có thư mục _posts
    Và tôi có bài viết sau:
      | title     | date       | layout | category  | content                 |
      | Rover     | 2009-03-27 | none   | puppies   | Luke, I am your father. |
    Khi tôi chạy jekyll build
    Thì tôi nên nhận được trạng thái thoát bằng không
    Và thư mục _site nên tồn tại
    Và tôi nên thấy "Conflict: The following destination is shared by multiple files." trong kết quả build
    Và tôi nên thấy "_site/amazing.html" trong kết quả build
    Và tôi nên thấy "awesome.md" trong kết quả build
    Và tôi nên thấy "cool.md" trong kết quả build
    Và tôi nên thấy "amazing.html" trong kết quả build
    Và tôi nên thấy "_site/puppies/2009/03/27/rover.html" trong kết quả build
    Và tôi nên thấy "_posts/2009-03-27-rover.markdown" trong kết quả build
    Và tôi nên thấy "_puppies/rover.md" trong kết quả build

  Kịch bản: Chuyển hướng từ một permalink hiện có
    Giả sử tôi có file cấu hình với "plugins" được đặt thành "[jekyll-redirect-from]"
    Và tôi có file "deals.html" với nội dung:
      """
      ---
      permalink: /deals/
      redirect_from:
        - /offers/
      ---
      """
    Và tôi có trang "offers.html" với permalink "/offers/" chứa nội dung "Hurry! Limited time only!"
    Khi tôi chạy jekyll build
    Thì tôi nên nhận được trạng thái thoát bằng không
    Và thư mục _site nên tồn tại
    Và tôi không nên thấy "Conflict: The following destination is shared by multiple files." trong kết quả build
    Và tôi không nên thấy "_site/offers/index.html" trong kết quả build
    Và tôi không nên thấy "offers.html" trong kết quả build
    Và tôi không nên thấy "redirect.html" trong kết quả build
