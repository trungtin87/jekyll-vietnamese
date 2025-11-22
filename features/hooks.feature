Tính năng: Hooks
  As a plugin author
  I want to be able to run code during various stages of the build process

  Kịch bản: Run some code after site reset
    Giả sử I have a thư mục _plugins
    Và I have a "_plugins/ext.rb" với nội dung:
    """
    Jekyll::Hooks.register :site, :after_reset do |site|
      pageklass = Class.new(Jekyll::Page) do
        def initialize(site, base)
          @site = site
          @base = base
          @data = {}
          @dir = '/'
          @name = 'foo.html'
          @content = 'mytinypage'

          self.process(@name)
        end
      end

      site.pages << pageklass.new(site, site.source)
    end
    """
    Khi I run jekyll build
    Thì I should get a zero exit status
    Và thư mục _site nên tồn tại
    Và I should see "mytinypage" in "_site/foo.html"

  Kịch bản: Modify the payload before rendering the site
    Giả sử I have a thư mục _plugins
    Và I have a "index.html" page that contains "{{ site.injected }}!"
    Và I have a "_plugins/ext.rb" với nội dung:
    """
    Jekyll::Hooks.register :site, :pre_render do |site, payload|
      payload['site']['injected'] = 'myparam'
    end
    """
    Khi I run jekyll build
    Thì I should get a zero exit status
    Và thư mục _site nên tồn tại
    Và I should see "myparam!" in "_site/index.html"

  Kịch bản: Modify the site contents after reading
    Giả sử I have a thư mục _plugins
    Và I have a "page1.html" chứa nội dung "page1"
    Và I have a "page2.html" chứa nội dung "page2"
    Và I have a "_plugins/ext.rb" với nội dung:
    """
    Jekyll::Hooks.register :site, :post_read do |site|
      site.pages.delete_if { |p| p.name == 'page1.html' }
    end
    """
    Khi I run jekyll build
    Thì I should get a zero exit status
    Và thư mục _site nên tồn tại
    Và the "_site/page1.html" không nên tồn tại
    Và I should see "page2" in "_site/page2.html"

  Kịch bản: Work with the site files after they've been written to disk
    Giả sử I have a thư mục _plugins
    Và I have a "_plugins/ext.rb" với nội dung:
    """
    Jekyll::Hooks.register :site, :post_write do |site|
      firstpage = site.pages.first
      content = File.read firstpage.destination(site.dest)
      File.write(File.join(site.dest, 'firstpage.html'), content)
    end
    """
    Và I have a "page1.html" chứa nội dung "page1"
    Khi I run jekyll build
    Thì I should get a zero exit status
    Và thư mục _site nên tồn tại
    Và I should see "page1" in "_site/firstpage.html"

  Kịch bản: Alter a page right after it is initialized
    Giả sử I have a thư mục _plugins
    Và I have a "_plugins/ext.rb" với nội dung:
    """
    Jekyll::Hooks.register :pages, :post_init do |page|
      page.name = 'renamed.html'
      page.process(page.name)
    end
    """
    Và I have a "page1.html" chứa nội dung "page1"
    Khi I run jekyll build
    Thì I should get a zero exit status
    Và thư mục _site nên tồn tại
    Và I should see "page1" in "_site/renamed.html"

  Kịch bản: Alter the payload for one page but not another
    Giả sử I have a thư mục _plugins
    Và I have a "_plugins/ext.rb" với nội dung:
    """
    Jekyll::Hooks.register :pages, :pre_render do |page, payload|
      payload['page']['myparam'] = 'special' if page.name == 'page1.html'
    end
    """
    Và I have a "page1.html" page that contains "{{ page.myparam }}"
    Và I have a "page2.html" page that contains "{{ page.myparam }}"
    Khi I run jekyll build
    Thì I should see "special" in "_site/page1.html"
    Và I should not see "special" in "_site/page2.html"

  Kịch bản: Modify the converted HTML content of a page before rendering layout
    Giả sử I have a thư mục _layouts
    Và I have a "_layouts/page.html" với nội dung:
    """
    <h3>Page heading</h3>
    {{ content }}
    """
    Và I have a "page.md" với layout "page" that contains "### Heading"
    Và I have a thư mục _plugins
    Và I have a "_plugins/ext.rb" với nội dung:
    """
    Jekyll::Hooks.register :pages, :post_convert do |page|
      page.content = page.content.gsub('h3', 'h4')
    end
    """
    Khi I run jekyll build
    Thì I should get a zero exit status
    Và thư mục _site nên tồn tại
    Và I should see "<h3>Page heading</h3>" in "_site/page.html"
    Và I should see "<h4 id=\"heading\">Heading</h4>" in "_site/page.html"

  Kịch bản: Modify page contents before writing to disk
    Giả sử I have a thư mục _plugins
    Và I have a "index.html" chứa nội dung "WRAP ME"
    Và I have a "_plugins/ext.rb" với nội dung:
    """
    Jekyll::Hooks.register :pages, :post_render do |page|
      page.output = "{{{{{ #{page.output.chomp} }}}}}"
    end
    """
    Khi I run jekyll build
    Thì I should see "{{{{{ WRAP ME }}}}}" in "_site/index.html"

  Kịch bản: Work with a page after writing it to disk
    Giả sử I have a thư mục _plugins
    Và I have a "index.html" chứa nội dung "HELLO FROM A PAGE"
    Và I have a "_plugins/ext.rb" với nội dung:
    """
    Jekyll::Hooks.register :pages, :post_write do |page|
      require 'fileutils'
      filename = page.destination(page.site.dest)
      FileUtils.mv(filename, "#{filename}.moved")
    end
    """
    Khi I run jekyll build
    Thì I should see "HELLO FROM A PAGE" in "_site/index.html.moved"

  Kịch bản: Alter a post right after it is initialized
    Giả sử I have a thư mục _plugins
    Và I have a "_plugins/ext.rb" với nội dung:
    """
    Jekyll::Hooks.register :posts, :post_init do |post|
      post.data['harold'] = "content for entry1.".tr!('abcdefghijklmnopqrstuvwxyz',
            'nopqrstuvwxyzabcdefghijklm')
    end
    """
    Và I have a thư mục _posts
    Và I have the following posts:
      | title  | date       | layout | content               |
      | entry1 | 2015-03-14 | nil    | {{ page.harold }} |
    Khi I run jekyll build
    Thì I should get a zero exit status
    Và thư mục _site nên tồn tại
    Và I should see "pbagrag sbe ragel1." in "_site/2015/03/14/entry1.html"

  Kịch bản: Alter the payload for certain posts
    Giả sử I have a thư mục _plugins
    Và I have a "_plugins/ext.rb" với nội dung:
    """
    # Add myvar = 'old' to posts before 2015-03-15, and myvar = 'new' for
    # others
    Jekyll::Hooks.register :posts, :pre_render do |post, payload|
      if post.date < Time.new(2015, 3, 15)
        payload['myvar'] = 'old'
      else
        payload['myvar'] = 'new'
      end
    end
    """
    Và I have a thư mục _posts
    Và I have the following posts:
      | title  | date       | layout | content          |
      | entry1 | 2015-03-14 | nil    | {{ myvar }} post |
      | entry2 | 2015-03-15 | nil    | {{ myvar }} post |
    Khi I run jekyll build
    Thì I should see "old post" in "_site/2015/03/14/entry1.html"
    Và I should see "new post" in "_site/2015/03/15/entry2.html"

  Kịch bản: Modify the converted HTML content of a post before rendering layout
    Giả sử I have a thư mục _layouts
    Và I have a "_layouts/post.html" với nội dung:
    """
    <h3>Page heading</h3>
    {{ content }}
    """
    Và I have a thư mục _posts
    Và I have a "_posts/2016-01-01-example.md" với nội dung:
    """
    ---
    layout: post
    ---
    ### Heading
    """
    Và I have a thư mục _plugins
    Và I have a "_plugins/ext.rb" với nội dung:
    """
    Jekyll::Hooks.register :posts, :post_convert do |post|
      post.content = post.content.gsub('h3', 'h4')
    end
    """
    Khi I run jekyll build
    Thì I should get a zero exit status
    Và thư mục _site nên tồn tại
    Và I should see "<h3>Page heading</h3>" in "_site/2016/01/01/example.html"
    Và I should see "<h4 id=\"heading\">Heading</h4>" in "_site/2016/01/01/example.html"

  Kịch bản: Modify post contents before writing to disk
    Giả sử I have a thư mục _plugins
    Và I have a "_plugins/ext.rb" với nội dung:
    """
    # Replace content after rendering
    Jekyll::Hooks.register :posts, :post_render do |post|
      post.output.gsub! /42/, 'the answer to life, the universe and everything'
    end
    """
    Và I have a thư mục _posts
    Và I have the following posts:
      | title  | date       | layout | content             |
      | entry1 | 2015-03-14 | nil    | {{ 6 \| times: 7 }} |
      | entry2 | 2015-03-15 | nil    | {{ 6 \| times: 8 }} |
    Khi I run jekyll build
    Thì I should see "the answer to life, the universe and everything" in "_site/2015/03/14/entry1.html"
    Và I should see "48" in "_site/2015/03/15/entry2.html"

  Kịch bản: Work with a post after writing it to disk
    Giả sử I have a thư mục _plugins
    Và I have a "_plugins/ext.rb" với nội dung:
    """
    # Log all post filesystem writes
    Jekyll::Hooks.register :posts, :post_write do |post|
      filename = post.destination(post.site.dest)
      open('_site/post-build.log', 'a') do |f|
        f.puts "Wrote #{filename} at #{Time.now}"
      end
    end
    """
    Và I have a thư mục _posts
    Và I have the following posts:
      | title  | date       | layout | content   |
      | entry1 | 2015-03-14 | nil    | entry one |
      | entry2 | 2015-03-15 | nil    | entry two |
    Khi I run jekyll build
    Thì I should see "_site/2015/03/14/entry1.html at" in "_site/post-build.log"
    Thì I should see "_site/2015/03/15/entry2.html at" in "_site/post-build.log"

  Kịch bản: Register a hook on multiple owners at the same time
    Giả sử I have a thư mục _plugins
    Và I have a "_plugins/ext.rb" với nội dung:
    """
    Jekyll::Hooks.register [:pages, :posts], :post_render do |owner|
      owner.output = "{{{{{ #{owner.output.chomp} }}}}}"
    end
    """
    Và I have a "index.html" chứa nội dung "WRAP ME"
    Và I have a thư mục _posts
    Và I have the following posts:
      | title  | date       | layout | content   |
      | entry1 | 2015-03-14 | nil    | entry one |
    Khi I run jekyll build
    Thì I should see "{{{{{ WRAP ME }}}}}" in "_site/index.html"
    Và I should see "{{{{{ <p>entry one</p> }}}}}" in "_site/2015/03/14/entry1.html"

  Kịch bản: Allow hooks to have a named priority
    Giả sử I have a thư mục _plugins
    Và I have a "_plugins/ext.rb" với nội dung:
    """
    Jekyll::Hooks.register :pages, :post_render, priority: :normal do |owner|
      # first normal runs second
      owner.output = "1 #{owner.output.chomp}"
    end
    Jekyll::Hooks.register :pages, :post_render, priority: :high do |owner|
      # high runs first
      owner.output = "2 #{owner.output.chomp}"
    end
    Jekyll::Hooks.register :pages, :post_render do |owner|
      # second normal runs third (normal is default)
      owner.output = "3 #{owner.output.chomp}"
    end
    Jekyll::Hooks.register :pages, :post_render, priority: :low do |owner|
      # low runs last
      owner.output = "4 #{owner.output.chomp}"
    end
    """
    Và I have a "index.html" chứa nội dung "WRAP ME"
    Khi I run jekyll build
    Thì I should see "4 3 1 2 WRAP ME" in "_site/index.html"

  Kịch bản: Alter a document right after it is initialized
    Giả sử I have a thư mục _plugins
    Và I have a "_plugins/ext.rb" với nội dung:
    """
    Jekyll::Hooks.register :documents, :pre_render do |doc, payload|
      doc.data['text'] = doc.data['text'] << ' are belong to us'
    end
    """
    Và I have a "_config.yml" chứa nội dung "collections: [ memes ]"
    Và I have a _memes directory
    Và I have a "_memes/doc1.md" với nội dung:
    """
    ---
    text: all your base
    ---
    """
    Và I have an "index.md" với nội dung:
    """
    ---
    ---
    {{ site.memes.first.text }}
    """
    Khi I run jekyll build
    Thì I should get a zero exit status
    Và thư mục _site nên tồn tại
    Và I should see "all your base are belong to us" in "_site/index.html"

  Kịch bản: Modify the converted HTML content of a document before rendering layout
    Giả sử I have a thư mục _layouts
    Và I have a "_layouts/meme.html" với nội dung:
    """
    <h3>Page heading</h3>
    {{ content }}
    """
    Và I have a "_config.yml" với nội dung:
    """
    collections:
      memes:
        output: true
    """
    Và I have a _memes directory
    Và I have a "_memes/doc1.md" với nội dung:
    """
    ---
    layout: meme
    text: all your base
    ---
    ### {{ page.text }}
    """
    Và I have a thư mục _plugins
    Và I have a "_plugins/ext.rb" với nội dung:
    """
    Jekyll::Hooks.register :documents, :post_convert do |document|
      document.content = document.content.gsub('h3', 'h4')
    end
    """
    Khi I run jekyll build
    Thì I should get a zero exit status
    Và thư mục _site nên tồn tại
    Và I should see "<h3>Page heading</h3>" in "_site/memes/doc1.html"
    Và I should see "<h4 id=\"all-your-base\">all your base</h4>" in "_site/memes/doc1.html"

  Kịch bản: Modify the converted HTML content of document of a particular collection before rendering layout
    Giả sử I have a thư mục _layouts
    Và I have a "_layouts/meme.html" với nội dung:
    """
    <h3>Page heading</h3>
    {{ content }}
    """
    Và I have a "_config.yml" với nội dung:
    """
    collections:
      memes:
        output: true
    """
    Và I have a _memes directory
    Và I have a "_memes/doc1.md" với nội dung:
    """
    ---
    layout: meme
    text: all your base
    ---
    ### {{ page.text }}
    """
    Và I have a thư mục _posts
    Và I have a "_posts/2016-01-01-example.md" với nội dung:
    """
    ---
    layout: meme
    text: all your base
    ---
    ### {{ page.text }}
    """
    Và I have a thư mục _plugins
    Và I have a "_plugins/ext.rb" với nội dung:
    """
    Jekyll::Hooks.register :memes, :post_convert do |document|
      document.content = document.content.gsub('h3', 'h4')
    end
    """
    Khi I run jekyll build
    Thì I should get a zero exit status
    Và thư mục _site nên tồn tại
    Và I should see "<h3>Page heading</h3>" in "_site/memes/doc1.html"
    Và I should see "<h4 id=\"all-your-base\">all your base</h4>" in "_site/memes/doc1.html"
    Nhưng I should see "<h3 id=\"all-your-base\">all your base</h3>" in "_site/2016/01/01/example.html"

  Kịch bản: Update a document after rendering it, but before writing it to disk
    Giả sử I have a thư mục _plugins
    Và I have a "_plugins/ext.rb" với nội dung:
    """
    Jekyll::Hooks.register :documents, :post_render do |doc|
      doc.output.gsub! /<p>/, '<p class="meme">'
    end
    """
    Và I have a "_config.yml" với nội dung:
    """
    collections:
      memes:
        output: true
    """
    Và I have a _memes directory
    Và I have a "_memes/doc1.md" với nội dung:
    """
    ---
    text: all your base are belong to us
    ---
    {{ page.text }}
    """
    Khi I run jekyll build
    Thì I should get a zero exit status
    Và thư mục _site nên tồn tại
    Và I should see "<p class=\"meme\">all your base are belong to us" in "_site/memes/doc1.html"

  Kịch bản: Perform an action after every document is written
    Giả sử I have a thư mục _plugins
    Và I have a "_plugins/ext.rb" với nội dung:
    """
    Jekyll::Hooks.register :documents, :post_write do |doc|
      open('_site/document-build.log', 'a') do |f|
        f.puts "Wrote document #{doc.collection.docs.index doc} at #{Time.now}"
      end
    end
    """
    Và I have a "_config.yml" với nội dung:
    """
    collections:
      memes:
        output: true
    """
    Và I have a _memes directory
    Và I have a "_memes/doc1.md" với nội dung:
    """
    ---
    text: all your base are belong to us
    ---
    {{ page.text }}
    """
    Khi I run jekyll build
    Thì I should get a zero exit status
    Và thư mục _site nên tồn tại
    Và I should see "Wrote document 0" in "_site/document-build.log"

  Kịch bản: Set a custom payload['page'] property
    Giả sử I have a thư mục _plugins
    Và I have a "_plugins/ext.rb" với nội dung:
    """
    Jekyll::Hooks.register :pages, :pre_render do |page, payload|
        payload['page']['foo'] = "hello world"
    end
    """
    Và I have a thư mục _layouts
    Và I have a "_layouts/custom.html" với nội dung:
      """
      ---
      ---
      {{ content }} {% include foo.html %}
      """
    Và I have a thư mục _includes
    Và I have a "_includes/foo.html" với nội dung:
      """
      {{page.foo}}
      """
    Và I have an "index.html" với layout "custom" that contains "page content"
    Khi I run jekyll build
    Thì the "_site/index.html" nên tồn tại
    Và I should see "page content\n hello world" in "_site/index.html"
