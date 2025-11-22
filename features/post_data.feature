Tính năng: Post data
  As a hacker who likes to blog
  I want to be able to embed data into my posts
  In order to make the posts slightly dynamic

  Kịch bản: Use post.title variable
    Giả sử I have a thư mục _posts
    Và I have a thư mục _layouts
    Và I have the following post:
      | title     | date       | layout | content                 |
      | Star Wars | 2009-03-27 | simple | Luke, I am your father. |
    Và I have a simple layout that contains "Post title: {{ page.title }}"
    Khi I run jekyll build
    Thì I should get a zero exit status
    Và thư mục _site nên tồn tại
    Và I should see "Post title: Star Wars" in "_site/2009/03/27/star-wars.html"

  Kịch bản: Use post.url variable
    Giả sử I have a thư mục _posts
    Và I have a thư mục _layouts
    Và I have the following post:
      | title     | date       | layout | content                 |
      | Star Wars | 2009-03-27 | simple | Luke, I am your father. |
    Và I have a simple layout that contains "Post url: {{ page.url }}"
    Khi I run jekyll build
    Thì I should get a zero exit status
    Và thư mục _site nên tồn tại
    Và I should see "Post url: /2009/03/27/star-wars.html" in "_site/2009/03/27/star-wars.html"

  Kịch bản: Use page.name variable
    Giả sử I have a thư mục _posts
    Và I have a thư mục _layouts
    Và I have the following post:
      | title     | date       | layout | content                 |
      | Star Wars | 2009-03-27 | simple | Luke, I am your father. |
    Và I have a simple layout that contains "Page name: {{ page.name }}"
    Khi I run jekyll build
    Thì I should get a zero exit status
    Và thư mục _site nên tồn tại
    Và I should see "Page name: 2009-03-27-star-wars.markdown" in "_site/2009/03/27/star-wars.html"

  Kịch bản: Use post.date variable
    Giả sử I have a thư mục _posts
    Và I have a thư mục _layouts
    Và I have the following post:
      | title     | date       | layout | content                 |
      | Star Wars | 2009-03-27 | simple | Luke, I am your father. |
    Và I have a simple layout that contains "Post date: {{ page.date | date_to_string }}"
    Khi I run jekyll build
    Thì I should get a zero exit status
    Và thư mục _site nên tồn tại
    Và I should see "Post date: 27 Mar 2009" in "_site/2009/03/27/star-wars.html"

  Kịch bản: Use post.date variable with invalid
    Giả sử I have a thư mục _posts
    Và I have a "_posts/2016-01-01-test.md" với date "tuesday" that contains "I have a bad date."
    Khi I run jekyll build
    Thì thư mục _site không nên tồn tại
    Và I should see "Document '_posts/2016-01-01-test.md' does not have a valid date in the YAML front matter." trong kết quả build

  Kịch bản: Invalid date in filename
    Giả sử I have a thư mục _posts
    Và I have a "_posts/2016-22-01-test.md" chứa nội dung "I have a bad date."
    Khi I run jekyll build
    Thì thư mục _site không nên tồn tại
    Và I should see "Document '_posts/2016-22-01-test.md' does not have a valid date in the filename." trong kết quả build

  Kịch bản: Use post.id variable
    Giả sử I have a thư mục _posts
    Và I have a thư mục _layouts
    Và I have the following post:
      | title     | date       | layout | content                 |
      | Star Wars | 2009-03-27 | simple | Luke, I am your father. |
    Và I have a simple layout that contains "Post id: {{ page.id }}"
    Khi I run jekyll build
    Thì I should get a zero exit status
    Và thư mục _site nên tồn tại
    Và I should see "Post id: /2009/03/27/star-wars" in "_site/2009/03/27/star-wars.html"

  Kịch bản: Use post.content variable
    Giả sử I have a thư mục _posts
    Và I have a thư mục _layouts
    Và I have the following post:
      | title     | date       | layout | content                 |
      | Star Wars | 2009-03-27 | simple | Luke, I am your father. |
    Và I have a simple layout that contains "Post content: {{ content }}"
    Khi I run jekyll build
    Thì I should get a zero exit status
    Và thư mục _site nên tồn tại
    Và I should see "Post content: <p>Luke, I am your father.</p>" in "_site/2009/03/27/star-wars.html"

  Kịch bản: Use post.categories variable when category is in a folder
    Giả sử I have a movies directory
    Và I have a movies/thư mục _posts
    Và I have a thư mục _layouts
    Và I have the following post in "movies":
      | title     | date       | layout | content                 |
      | Star Wars | 2009-03-27 | simple | Luke, I am your father. |
    Và I have a simple layout that contains "Post category: {{ page.categories }}"
    Khi I run jekyll build
    Thì I should get a zero exit status
    Và thư mục _site nên tồn tại
    Và I should see "Post category: movies" in "_site/movies/2009/03/27/star-wars.html"

  Kịch bản: Use post.categories variable when category is in a folder and has category in YAML
    Giả sử I have a movies directory
    Và I have a movies/thư mục _posts
    Và I have a thư mục _layouts
    Và I have the following post in "movies":
      | title     | date       | layout | category | content                 |
      | Star Wars | 2009-03-27 | simple | film     | Luke, I am your father. |
    Và I have a simple layout that contains "Post category: {{ page.categories }}"
    Khi I run jekyll build
    Thì I should get a zero exit status
    Và thư mục _site nên tồn tại
    Và I should see "Post category: movies" in "_site/movies/film/2009/03/27/star-wars.html"

  Kịch bản: Use post.categories variable when category is in a folder and has categories in YAML
    Giả sử I have a movies directory
    Và I have a movies/thư mục _posts
    Và I have a thư mục _layouts
    Và I have the following post in "movies":
      | title     | date       | layout | categories        | content                 |
      | Star Wars | 2009-03-27 | simple | [film, scifi]     | Luke, I am your father. |
    Và I have a simple layout that contains "Post category: {{ page.categories }}"
    Khi I run jekyll build
    Thì I should get a zero exit status
    Và thư mục _site nên tồn tại
    Và I should see "Post category: movies" in "_site/movies/film/scifi/2009/03/27/star-wars.html"

  Kịch bản: Use post.categories variable when category is in a folder and duplicated category is in YAML
    Giả sử I have a movies directory
    Và I have a movies/thư mục _posts
    Và I have a thư mục _layouts
    Và I have the following post in "movies":
      | title     | date       | layout | category | content                 |
      | Star Wars | 2009-03-27 | simple | movies   | Luke, I am your father. |
    Và I have a simple layout that contains "Post category: {{ page.categories }}"
    Khi I run jekyll build
    Thì I should get a zero exit status
    Và thư mục _site nên tồn tại
    Và I should see "Post category: movies" in "_site/movies/2009/03/27/star-wars.html"

  Kịch bản: Use post.categories when category is a composite of multiple words
    Giả sử I have a Sci-Fi Movi3s directory
    Và I have a Sci-Fi Movi3s/thư mục _posts
    Và I have a thư mục _layouts
    Và I have the following post in "Sci-Fi Movi3s":
      | title     | date       | layout | category | content                 |
      | Star Wars | 2020-04-03 | simple | vintage  | Luke, I am your father. |
    Và I have a "_layouts/simple.html" với nội dung:
      """
      Post categories: {{ page.categories | join: ', ' }}
      Post URL: {{ page.url }}
      """
    Khi I run jekyll build
    Thì I should get a zero exit status
    Và thư mục _site nên tồn tại
    Và I should see "Post categories: Sci-Fi Movi3s, vintage" in "_site/sci-fi movi3s/vintage/2020/04/03/star-wars.html"
    Và I should see "Post URL: /sci-fi%20movi3s/vintage/2020/04/03/star-wars.html" in "_site/sci-fi movi3s/vintage/2020/04/03/star-wars.html"

  Kịch bản: Use post.slugified_categories to generate URL when category is a composite of multiple words
    Giả sử I have a Sci-Fi Movi3s directory
    Và I have a Sci-Fi Movi3s/thư mục _posts
    Và I have a thư mục _layouts
    Và I have the following post in "Sci-Fi Movi3s":
      | title     | date       | layout | category | content                 |
      | Star Wars | 2020-04-03 | simple | vintage  | Luke, I am your father. |
    Và I have a "_layouts/simple.html" với nội dung:
      """
      Post categories: {{ page.categories | join: ', ' }}
      Post URL: {{ page.url }}
      """
    Và I have a "_config.yml" với nội dung:
    """
    collections:
      posts:
        permalink: "/:slugified_categories/:year/:month/:day/:title:output_ext"
    """
    Khi I run jekyll build
    Thì I should get a zero exit status
    Và thư mục _site nên tồn tại
    Và I should see "Post categories: Sci-Fi Movi3s, vintage" in "_site/sci-fi-movi3s/vintage/2020/04/03/star-wars.html"
    Và I should see "Post URL: /sci-fi-movi3s/vintage/2020/04/03/star-wars.html" in "_site/sci-fi-movi3s/vintage/2020/04/03/star-wars.html"

  Kịch bản: Use post.tags variable
    Giả sử I have a thư mục _posts
    Và I have a thư mục _layouts
    Và I have the following post:
      | title     | date       | layout | tag   | content                 |
      | Star Wars | 2009-05-18 | simple | twist | Luke, I am your father. |
    Và I have a simple layout that contains "Post tags: {{ page.tags }}"
    Khi I run jekyll build
    Thì I should get a zero exit status
    Và thư mục _site nên tồn tại
    Và I should see "Post tags: twist" in "_site/2009/05/18/star-wars.html"

  Kịch bản: Use post.categories variable when categories are in folders
    Giả sử I have a scifi directory
    Và I have a scifi/movies directory
    Và I have a scifi/movies/thư mục _posts
    Và I have a thư mục _layouts
    Và I have the following post in "scifi/movies":
      | title     | date       | layout | content                 |
      | Star Wars | 2009-03-27 | simple | Luke, I am your father. |
    Và I have a simple layout that contains "Post categories: {{ page.categories | array_to_sentence_string }}"
    Khi I run jekyll build
    Thì I should get a zero exit status
    Và thư mục _site nên tồn tại
    Và I should see "Post categories: scifi and movies" in "_site/scifi/movies/2009/03/27/star-wars.html"

  Kịch bản: Use post.categories variable when categories are in folders with mixed case
    Giả sử I have a scifi directory
    Và I have a scifi/Movies directory
    Và I have a scifi/Movies/thư mục _posts
    Và I have a thư mục _layouts
    Và I have the following post in "scifi/Movies":
      | title     | date       | layout | content                 |
      | Star Wars | 2009-03-27 | simple | Luke, I am your father. |
    Và I have a simple layout that contains "Post categories: {{ page.categories | array_to_sentence_string }}"
    Khi I run jekyll build
    Thì I should get a zero exit status
    Và thư mục _site nên tồn tại
    Và I should see "Post categories: scifi and Movies" in "_site/scifi/movies/2009/03/27/star-wars.html"

  Kịch bản: Use post.categories variable when category is in YAML
    Giả sử I have a thư mục _posts
    Và I have a thư mục _layouts
    Và I have the following post:
      | title     | date       | layout | category | content                 |
      | Star Wars | 2009-03-27 | simple | movies   | Luke, I am your father. |
    Và I have a simple layout that contains "Post category: {{ page.categories }}"
    Khi I run jekyll build
    Thì I should get a zero exit status
    Và thư mục _site nên tồn tại
    Và I should see "Post category: movies" in "_site/movies/2009/03/27/star-wars.html"

  Kịch bản: Use post.categories variable when category is in YAML and is mixed-case
    Giả sử I have a thư mục _posts
    Và I have a thư mục _layouts
    Và I have the following post:
      | title     | date       | layout | category | content                 |
      | Star Wars | 2009-03-27 | simple | Movies   | Luke, I am your father. |
    Và I have a simple layout that contains "Post category: {{ page.categories }}"
    Khi I run jekyll build
    Thì I should get a zero exit status
    Và thư mục _site nên tồn tại
    Và I should see "Post category: Movies" in "_site/movies/2009/03/27/star-wars.html"

  Kịch bản: Use post.categories variable when categories are in YAML
    Giả sử I have a thư mục _posts
    Và I have a thư mục _layouts
    Và I have the following post:
      | title     | date       | layout | categories          | content                 |
      | Star Wars | 2009-03-27 | simple | ['scifi', 'movies'] | Luke, I am your father. |
    Và I have a simple layout that contains "Post categories: {{ page.categories | array_to_sentence_string }}"
    Khi I run jekyll build
    Thì I should get a zero exit status
    Và thư mục _site nên tồn tại
    Và I should see "Post categories: scifi and movies" in "_site/scifi/movies/2009/03/27/star-wars.html"

  Kịch bản: Use post.categories variable when categories are in YAML and are duplicated
    Giả sử I have a thư mục _posts
    Và I have a thư mục _layouts
    Và I have the following post:
      | title     | date       | layout | categories           | content                 |
      | Star Wars | 2009-03-27 | simple | ['movies', 'movies'] | Luke, I am your father. |
    Và I have a simple layout that contains "Post category: {{ page.categories }}"
    Khi I run jekyll build
    Thì I should get a zero exit status
    Và thư mục _site nên tồn tại
    Và I should see "Post category: movies" in "_site/movies/2009/03/27/star-wars.html"

  Kịch bản: Superdirectories of _posts applied to post.categories
    Giả sử I have a movies/thư mục _posts
    Và I have a "movies/_posts/2009-03-27-star-wars.html" với layout "simple" that contains "hi"
    Và I have a thư mục _layouts
    Và I have a simple layout that contains "Post category: {{ page.categories }}"
    Khi I run jekyll build
    Thì I should get a zero exit status
    Và thư mục _site nên tồn tại
    Và I should see "Post category: movies" in "_site/movies/2009/03/27/star-wars.html"

  Kịch bản: Subdirectories of _posts not applied to post.categories
    Giả sử I have a movies/_posts/scifi directory
    Và I have a "movies/_posts/scifi/2009-03-27-star-wars.html" với layout "simple" that contains "hi"
    Và I have a thư mục _layouts
    Và I have a simple layout that contains "Post category: {{ page.categories }}"
    Khi I run jekyll build
    Thì I should get a zero exit status
    Và thư mục _site nên tồn tại
    Và I should see "Post category: movies" in "_site/movies/2009/03/27/star-wars.html"

  Kịch bản: Use post.categories variable when categories are in YAML with mixed case
    Giả sử I have a thư mục _posts
    Và I have a thư mục _layouts
    Và I have the following posts:
      | title     | date       | layout | categories          | content                     |
      | Star Wars | 2009-03-27 | simple | ['scifi', 'Movies'] | Luke, I am your father.     |
      | Star Trek | 2013-03-17 | simple | ['SciFi', 'movies'] | Jean Luc, I am your father. |
    Và I have a simple layout that contains "Post categories: {{ page.categories | array_to_sentence_string }}"
    Khi I run jekyll build
    Thì I should get a zero exit status
    Và thư mục _site nên tồn tại
    Và I should see "Post categories: scifi and Movies" in "_site/scifi/movies/2009/03/27/star-wars.html"
    Và I should see "Post categories: SciFi and movies" in "_site/scifi/movies/2013/03/17/star-trek.html"

Kịch bản: Use page.render_with_liquid variable
  Giả sử I have a thư mục _posts
  Và I have the following posts:
    | title           | render_with_liquid | date       | content                |
    | Unrendered Post | false              | 2017-07-06 | Hello {{ page.title }} |
    | Rendered Post   | true               | 2017-07-06 | Hello {{ page.title }} |
  Khi I run jekyll build
  Thì I should get a zero exit status
  Và thư mục _site nên tồn tại
  Và I should not see "Hello Unrendered Post" in "_site/2017/07/06/unrendered-post.html"
  Nhưng I should see "Hello {{ page.title }}" in "_site/2017/07/06/unrendered-post.html"
  Và I should see "Hello Rendered Post" in "_site/2017/07/06/rendered-post.html"

  Khung kịch bản: Use page.path variable
    Giả sử I have a <dir>/thư mục _posts
    Và I have the following post in "<dir>":
      | title   | type | date       | content                      |
      | my-post | html | 2013-04-12 | Source path: {{ page.path }} |
    Khi I run jekyll build
    Thì I should get a zero exit status
    Và thư mục _site nên tồn tại
    Và I should see "Source path: <path_prefix>_posts/2013-04-12-my-post.html" in "_site/<dir>/2013/04/12/my-post.html"

    Ví dụ:
      | dir        | path_prefix |
      | .          |             |
      | dir        | dir/        |
      | dir/nested | dir/nested/ |

  Kịch bản: Cannot override page.path variable
    Giả sử I have a thư mục _posts
    Và I have the following post:
      | title    | date       | path               | content                      |
      | override | 2013-04-12 | override-path.html | Non-custom path: {{ page.path }} |
    Khi I run jekyll build
    Thì I should get a zero exit status
    Và thư mục _site nên tồn tại
    Và I should see "Non-custom path: _posts/2013-04-12-override.markdown" in "_site/2013/04/12/override.html"

  Kịch bản: Disable a post from being published
    Giả sử I have a thư mục _posts
    Và I have an "index.html" chứa nội dung "Published!"
    Và I have the following post:
      | title     | date       | layout | published | content                 |
      | Star Wars | 2009-03-27 | simple | false     | Luke, I am your father. |
    Khi I run jekyll build
    Thì I should get a zero exit status
    Và thư mục _site nên tồn tại
    Và the "_site/2009/03/27/star-wars.html" không nên tồn tại
    Và I should see "Published!" in "_site/index.html"

  Kịch bản: Use a custom variable
    Giả sử I have a thư mục _posts
    Và I have a thư mục _layouts
    Và I have the following post:
      | title     | date       | layout | author      | content                 |
      | Star Wars | 2009-03-27 | simple | Darth Vader | Luke, I am your father. |
    Và I have a simple layout that contains "Post author: {{ page.author }}"
    Khi I run jekyll build
    Thì I should get a zero exit status
    Và thư mục _site nên tồn tại
    Và I should see "Post author: Darth Vader" in "_site/2009/03/27/star-wars.html"

  Kịch bản: Use a variable which is a reserved keyword in Ruby
    Giả sử I have a thư mục _posts
    Và I have a thư mục _layouts
    Và I have the following post:
      | title   | date       | layout | class     | content                 |
      | My post | 2016-01-21 | simple | kewl-post | Luke, I am your father. |
    Và I have a simple layout that contains "{{page.title}} has class {{page.class}}"
    Khi I run jekyll build
    Thì I should get a zero exit status
    Và thư mục _site nên tồn tại
    Và I should see "My post has class kewl-post" in "_site/2016/01/21/my-post.html"

  Kịch bản: Previous and next posts title
    Giả sử I have a thư mục _posts
    Và I have a thư mục _layouts
    Và I have the following posts:
      | title            | date       | layout  | author      | content                 |
      | Star Wars        | 2009-03-27 | ordered | Darth Vader | Luke, I am your father. |
      | Some like it hot | 2009-04-27 | ordered | Osgood      | Nobody is perfect.      |
      | Terminator       | 2009-05-27 | ordered | Arnold      | Sayonara, baby          |
    Và I have a ordered layout that contains "Previous post: {{ page.previous.title }} and next post: {{ page.next.title }}"
    Khi I run jekyll build
    Thì I should get a zero exit status
    Và thư mục _site nên tồn tại
    Và I should see "next post: Some like it hot" in "_site/2009/03/27/star-wars.html"
    Và I should see "Previous post: Some like it hot" in "_site/2009/05/27/terminator.html"

  Kịch bản: Deprecate calling data keys directly via Ruby
    Giả sử I have a thư mục _posts
    Và I have a thư mục _plugins
    Và I have the following post:
      | title   | date       | content                 |
      | My post | 2016-01-21 | Luke, I am your father. |
    Và I have a "_plugins/foo.rb" với nội dung:
      """
      Jekyll::Hooks.register :documents, :pre_render do |doc|
        doc.title
      end
      """
    Và I have a "_plugins/bar.rb" với nội dung:
      """
      module FooBar
        def self.dummy?(doc)
          doc.title == "Dummy Document"
        end
      end

      Jekyll::Hooks.register :documents, :post_render do |doc|
        FooBar.dummy?(doc)
      end
      """
    Khi I run jekyll build
    Thì I should get a zero exit status
    Và thư mục _site nên tồn tại
    Và I should see "Deprecation: Document#title" trong kết quả build
    Và I should see "_plugins/foo.rb:2" trong kết quả build
    Và I should see "_plugins/bar.rb:3" trong kết quả build
    Nhưng I should not see "lib/jekyll/document.rb" trong kết quả build
