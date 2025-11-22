---
title: Cấu hình Mặc định (Default Configuration)
permalink: "/docs/configuration/default/"
---

Jekyll chạy với các tùy chọn cấu hình sau theo mặc định. Các cài đặt thay thế
cho các tùy chọn này có thể được chỉ định rõ ràng trong tệp cấu hình
hoặc trên dòng lệnh.

<div class="note info">
  <h5>Hãy chú ý đến đường dẫn thư mục</h5>
  <p>
    Nói chung, hãy đặt các giá trị đường dẫn thư mục trong các khóa cấu hình như <code>plugins_dir</code> tương đối với thư mục làm việc hiện tại, không phải nguồn trang web. Khóa cấu hình <code>sass</code> là một ngoại lệ, trong đó các giá trị phải tương đối với nguồn trang web.
  </p>
</div>

```yaml
# Where things are
source              : .
destination         : ./_site
collections_dir     : .
plugins_dir         : _plugins # takes an array of strings and loads plugins in that order
layouts_dir         : _layouts
data_dir            : _data
includes_dir        : _includes
sass:
  sass_dir: _sass
collections:
  posts:
    output          : true

# Handling Reading
safe                : false
include             : [".htaccess"]
exclude             : ["Gemfile", "Gemfile.lock", "node_modules", "vendor/bundle/", "vendor/cache/", "vendor/gems/", "vendor/ruby/"]
keep_files          : [".git", ".svn"]
encoding            : "utf-8"
markdown_ext        : "markdown,mkdown,mkdn,mkd,md"
strict_front_matter : false

# Filtering Content
show_drafts         : null
limit_posts         : 0
future              : false
unpublished         : false

# Plugins
whitelist           : []
plugins             : []

# Conversion
markdown            : kramdown
highlighter         : rouge
lsi                 : false
excerpt_separator   : "\n\n"
incremental         : false

# Serving
detach              : false
port                : 4000
host                : 127.0.0.1
baseurl             : "" # does not include hostname
show_dir_listing    : false

# Outputting
permalink           : date
paginate_path       : /page:num
timezone            : null

quiet               : false
verbose             : false
defaults            : []

liquid:
  error_mode        : warn
  strict_filters    : false
  strict_variables  : false

# Markdown Processors
kramdown:
  auto_ids          : true
  entity_output     : as_char
  toc_levels        : [1, 2, 3, 4, 5, 6]
  smart_quotes      : lsquo,rsquo,ldquo,rdquo
  input             : GFM
  hard_wrap         : false
  footnote_nr       : 1
  show_warnings     : false
```
