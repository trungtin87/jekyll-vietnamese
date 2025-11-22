Tính năng: Tạo sites
  Là một hacker thích viết blog
  Tôi muốn có khả năng tạo một static site
  Để chia sẻ các ý tưởng tuyệt vời của tôi với internet
 
  Kịch bản: Blank site
    Giả sử tôi không có thư mục "test_blank"
    Khi tôi chạy jekyll new test_blank --blank
    Thì thư mục test_blank/_data nên tồn tại
    Và thư mục test_blank/_drafts nên tồn tại
    Và thư mục test_blank/_includes nên tồn tại
    Và thư mục test_blank/_layouts nên tồn tại
    Và thư mục test_blank/_posts nên tồn tại
    Và thư mục test_blank/_sass nên tồn tại
    Và thư mục test_blank/assets/css nên tồn tại
    Và file "test_blank/_layouts/default.html" nên tồn tại
    Và file "test_blank/_sass/base.scss" nên tồn tại
    Và file "test_blank/assets/css/main.scss" nên tồn tại
    Và file "test_blank/_config.yml" nên tồn tại
    Và file "test_blank/index.md" nên tồn tại
    Khi tôi chạy jekyll build --source test_blank --destination test_blank/_site
    Thì tôi nên nhận được trạng thái thoát bằng không
    Và thư mục test_blank/_site nên tồn tại
    Và tôi nên thấy "Start developing" trong "test_blank/_site/index.html"
    Và tôi nên thấy "body {" trong "test_blank/_site/assets/css/main.css"

  Kịch bản: Basic site
    Giả sử tôi có file "index.html" chứa nội dung "Basic Site"
    Khi tôi chạy jekyll build
    Thì tôi nên nhận được trạng thái thoát bằng không
    Và thư mục _site nên tồn tại
    Và tôi nên thấy "Basic Site" trong "_site/index.html"

  Kịch bản: Basic site với một post
    Giả sử tôi có thư mục _posts
    Và tôi có bài viết sau:
      | title   | date       | content          |
      | Hackers | 2009-03-27 | My First Exploit |
    Khi tôi chạy jekyll build
    Thì tôi nên nhận được trạng thái thoát bằng không
    Và thư mục _site nên tồn tại
    Và tôi nên thấy "My First Exploit" trong "_site/2009/03/27/hackers.html"

  Kịch bản: Basic site với layout và một page
    Giả sử tôi có thư mục _layouts
    Và tôi có trang "index.html" với layout "default" chứa nội dung "Basic Site with Layout"
    Và tôi có layout default chứa nội dung "Page Layout: {{ content }}"
    Khi tôi chạy jekyll build
    Thì tôi nên nhận được trạng thái thoát bằng không
    Và thư mục _site nên tồn tại
    Và tôi nên thấy "Page Layout: Basic Site with Layout" trong "_site/index.html"

  Kịch bản: Basic site với layout và một post
    Giả sử tôi có thư mục _layouts
    Và tôi có thư mục _posts
    Và tôi có các bài viết sau:
      | title    | date       | layout  | content                               |
      | Wargames | 2009-03-27 | default | The only winning move is not to play. |
    Và tôi có layout default chứa nội dung "Post Layout: {{ content }}"
    Khi tôi chạy jekyll build
    Thì tôi nên nhận được trạng thái thoát bằng không
    Và thư mục _site nên tồn tại
    Và tôi nên thấy "Post Layout: <p>The only winning move is not to play.</p>" trong "_site/2009/03/27/wargames.html"

  Kịch bản: Basic site với layout bên trong một subfolder và một post
    Giả sử tôi có thư mục _layouts
    Và tôi có thư mục _posts
    Và tôi có các bài viết sau:
      | title    | date       | layout      | content                               |
      | Wargames | 2009-03-27 | post/simple | The only winning move is not to play. |
    Và tôi có layout post/simple chứa nội dung "Post Layout: {{ content }}"
    Khi tôi chạy jekyll build
    Thì tôi nên nhận được trạng thái thoát bằng không
    Và thư mục _site nên tồn tại
    Và tôi nên thấy "Post Layout: <p>The only winning move is not to play.</p>" trong "_site/2009/03/27/wargames.html"

  Kịch bản: Basic site với layouts, pages, posts và files
    Giả sử tôi có thư mục _layouts
    Và tôi có layout page chứa nội dung "Page {{ page.title }}: {{ content }}"
    Và tôi có layout post chứa nội dung "Post {{ page.title }}: {{ content }}"
    Và tôi có trang "index.html" với layout "page" chứa nội dung "Site contains {{ site.pages.size }} pages and {{ site.posts.size }} posts"
    Và tôi có thư mục blog
    Và tôi có trang "blog/index.html" với layout "page" chứa nội dung "blog category index page"
    Và tôi có file "about.html" chứa nội dung "No replacement {{ site.posts.size }}"
    Và tôi có file "another_file" chứa nội dung ""
    Và tôi có thư mục _posts
    Và tôi có các bài viết sau:
      | title  | date       | layout | content             |
      | entry1 | 2009-03-27 | post   | content for entry1. |
      | entry2 | 2009-04-27 | post   | content for entry2. |
    Và tôi có thư mục category/_posts
    Và tôi có các bài viết sau trong "category":
      | title  | date       | layout | content             |
      | entry3 | 2009-05-27 | post   | content for entry3. |
      | entry4 | 2009-06-27 | post   | content for entry4. |
    Khi tôi chạy jekyll build
    Thì tôi nên nhận được trạng thái thoát bằng không
    Và thư mục _site nên tồn tại
    Và tôi nên thấy "Page : Site contains 2 pages and 4 posts" trong "_site/index.html"
    Và tôi nên thấy "No replacement \\{\\{ site.posts.size \\}\\}" trong "_site/about.html"
    Và tôi nên thấy "" trong "_site/another_file"
    Và tôi nên thấy "Page : blog category index page" trong "_site/blog/index.html"
    Và tôi nên thấy "Post entry1: <p>content for entry1.</p>" trong "_site/2009/03/27/entry1.html"
    Và tôi nên thấy "Post entry2: <p>content for entry2.</p>" trong "_site/2009/04/27/entry2.html"
    Và tôi nên thấy "Post entry3: <p>content for entry3.</p>" trong "_site/category/2009/05/27/entry3.html"
    Và tôi nên thấy "Post entry4: <p>content for entry4.</p>" trong "_site/category/2009/06/27/entry4.html"

  Kịch bản: Basic site với include tag
    Giả sử tôi có thư mục _includes
    Và tôi có trang "index.html" chứa nội dung "Basic Site with include tag: {% include about.textile %}"
    Và tôi có file "_includes/about.textile" chứa nội dung "Generated by Jekyll"
    Khi tôi chạy jekyll build
    Thì tôi nên nhận được trạng thái thoát bằng không
    Và thư mục _site nên tồn tại
    Và tôi nên thấy "Basic Site with include tag: Generated by Jekyll" trong "_site/index.html"

  Kịch bản: Basic site với subdir include tag
    Giả sử tôi có thư mục _includes
    Và tôi có file "_includes/about.textile" chứa nội dung "Generated by Jekyll"
    Và tôi có thư mục info
    Và tôi có trang "info/index.html" chứa nội dung "Basic Site with subdir include tag: {% include about.textile %}"
    Khi tôi chạy jekyll build
    Thì tôi nên nhận được trạng thái thoát bằng không
    Và thư mục _site nên tồn tại
    Và tôi nên thấy "Basic Site with subdir include tag: Generated by Jekyll" trong "_site/info/index.html"

  Kịch bản: Basic site với nested include tag
    Giả sử tôi có thư mục _includes
    Và tôi có file "_includes/about.textile" chứa nội dung "Generated by {% include jekyll.textile %}"
    Và tôi có file "_includes/jekyll.textile" chứa nội dung "Jekyll"
    Và tôi có trang "index.html" chứa nội dung "Basic Site with include tag: {% include about.textile %}"
    Khi tôi chạy jekyll build
    Thì tôi nên nhận được trạng thái thoát bằng không
    Và thư mục _site nên tồn tại
    Và tôi nên thấy "Basic Site with include tag: Generated by Jekyll" trong "_site/index.html"

  Kịch bản: Basic site với internal post linking
    Giả sử tôi có trang "index.html" chứa nội dung "URL: {% post_url 2008-01-01-entry2 %}"
    Và tôi có file cấu hình với "permalink" được đặt thành "pretty"
    Và tôi có thư mục _posts
    Và tôi có các bài viết sau:
      | title  | date       | layout | content             |
      | entry1 | 2007-12-31 | post   | content for entry1. |
      | entry2 | 2008-01-01 | post   | content for entry2. |
    Khi tôi chạy jekyll build
    Thì tôi nên nhận được trạng thái thoát bằng không
    Và thư mục _site nên tồn tại
    Và tôi nên thấy "URL: /2008/01/01/entry2/" trong "_site/index.html"

  Kịch bản: Basic site với whitelisted dotfile
    Giả sử tôi có file ".htaccess" chứa nội dung "SomeDirective"
    Khi tôi chạy jekyll build
    Thì tôi nên nhận được trạng thái thoát bằng không
    Và thư mục _site nên tồn tại
    Và tôi nên thấy "SomeDirective" trong "_site/.htaccess"

  Kịch bản: File được thay thế bởi một directory
    Giả sử tôi có file "test" chứa nội dung "some stuff"
    Khi tôi chạy jekyll build
    Thì tôi nên nhận được trạng thái thoát bằng không
    Và thư mục _site nên tồn tại
    Khi tôi xóa file "test"
    Giả sử tôi có thư mục test
    Và tôi có file "test/index.html" chứa nội dung "some other stuff"
    Khi tôi chạy jekyll build
    Thì thư mục _site/test nên tồn tại
    Và tôi nên thấy "some other stuff" trong "_site/test/index.html"

  Kịch bản: Basic site với unpublished page
    Giả sử tôi có trang "index.html" với title "index" chứa nội dung "Published page"
    Và tôi có trang "public.html" với published "true" chứa nội dung "Explicitly published page"
    Và tôi có trang "secret.html" với published "false" chứa nội dung "Unpublished page"

    Khi tôi chạy jekyll build
    Thì tôi nên nhận được trạng thái thoát bằng không
    Và thư mục _site nên tồn tại
    Và file "_site/index.html" nên tồn tại
    Và file "_site/public.html" nên tồn tại
    Nhưng file "_site/secret.html" không nên tồn tại

    Khi tôi chạy jekyll build --unpublished
    Thì tôi nên nhận được trạng thái thoát bằng không
    Và thư mục _site nên tồn tại
    Và file "_site/index.html" nên tồn tại
    Và file "_site/public.html" nên tồn tại
    Và file "_site/secret.html" nên tồn tại

  Kịch bản: Basic site với page có ngày trong tương lai
    Giả sử tôi có thư mục _posts
    Và tôi có bài viết sau:
      | title  | date       | layout | content             |
      | entry1 | 2040-12-31 | post   | content for entry1. |
      | entry2 | 2007-12-31 | post   | content for entry2. |
    Khi tôi chạy jekyll build
    Thì tôi nên nhận được trạng thái thoát bằng không
    Và thư mục _site nên tồn tại
    Và tôi nên thấy "content for entry2" trong "_site/2007/12/31/entry2.html"
    Và file "_site/2040/12/31/entry1.html" không nên tồn tại
    Khi tôi chạy jekyll build --future
    Thì tôi nên nhận được trạng thái thoát bằng không
    Và thư mục _site nên tồn tại
    Và file "_site/2040/12/31/entry1.html" nên tồn tại

  Kịch bản: Basic site với layouts, posts và related posts
    Giả sử tôi có thư mục _layouts
    Và tôi có layout page chứa nội dung "Page {{ page.title }}: {{ content }}"
    Và tôi có layout post chứa nội dung "Post {{ page.title }}: {{ content }}Related posts: {{ site.related_posts | size }}"
    Và tôi có trang "index.html" với layout "page" chứa nội dung "Site contains {{ site.pages.size }} pages and {{ site.posts.size }} posts; Related posts: {{ site.related_posts | size }}"
    Và tôi có thư mục _posts
    Và tôi có các bài viết sau:
      | title  | date       | layout | content             |
      | entry1 | 2009-03-27 | post   | content for entry1. |
      | entry2 | 2009-04-27 | post   | content for entry2. |
    Khi tôi chạy jekyll build
    Thì tôi nên nhận được trạng thái thoát bằng không
    Và thư mục _site nên tồn tại
    Và tôi nên thấy "Page : Site contains 1 pages and 2 posts; Related posts: 0" trong "_site/index.html"
    Và tôi nên thấy "Post entry1: <p>content for entry1.</p>\nRelated posts: 1" trong "_site/2009/03/27/entry1.html"
    Và tôi nên thấy "Post entry2: <p>content for entry2.</p>\nRelated posts: 1" trong "_site/2009/04/27/entry2.html"
