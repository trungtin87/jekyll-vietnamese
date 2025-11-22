---
title: Bộ tạo (Generators)
permalink: /docs/plugins/generators/
---

Bạn có thể tạo một bộ tạo khi bạn cần Jekyll tạo thêm nội dung dựa trên các quy tắc của riêng bạn.

Một bộ tạo là một lớp con của `Jekyll::Generator` định nghĩa một phương thức `generate`, nhận một thể hiện của
[`Jekyll::Site`]({{ site.repository }}/blob/master/lib/jekyll/site.rb). Giá trị trả về của `generate` bị bỏ qua.

Các bộ tạo chạy sau khi Jekyll đã kiểm kê nội dung hiện có, và trước khi trang web được tạo. Các trang có
front matter được lưu trữ dưới dạng các thể hiện của [`Jekyll::Page`]({{ site.repository }}/blob/master/lib/jekyll/page.rb) và
có sẵn thông qua `site.pages`. Các tệp tĩnh trở thành các thể hiện của
[`Jekyll::StaticFile`]({{ site.repository }}/blob/master/lib/jekyll/static_file.rb)
và có sẵn thông qua `site.static_files`. Xem [trang tài liệu Biến](/docs/variables/) và
[`Jekyll::Site`]({{ site.repository }}/blob/master/lib/jekyll/site.rb) để biết chi tiết.

Trong ví dụ sau, bộ tạo sẽ tiêm các giá trị được tính toán tại thời điểm xây dựng cho các biến mẫu. Mẫu
có tên `reading.html` có hai biến chưa được định nghĩa `ongoing` và `done` sẽ được định nghĩa hoặc gán một giá trị khi
bộ tạo chạy:

```ruby
module Reading
  class Generator < Jekyll::Generator
    def generate(site)
      book_data = site.data['books']
      ongoing = book_data.select { |book| book['status'] == 'ongoing' }
      done = book_data.select { |book| book['status'] == 'finished' }

      # get template
      reading = site.pages.find { |page| page.name == 'reading.html'}

      # inject data into template
      reading.data['ongoing'] = ongoing
      reading.data['done'] = done
    end
  end
end
```

Ví dụ sau là một bộ tạo phức tạp hơn tạo ra các trang mới.

Trong ví dụ này, mục đích của bộ tạo là tạo một trang cho mỗi danh mục được đăng ký trong `site`. Các trang được
tạo tại thời gian chạy, vì vậy nội dung, front matter và các thuộc tính khác của chúng cần được thiết kế bởi chính plugin.

* Các trang được dự định để hiển thị danh sách tất cả các tài liệu thuộc một danh mục nhất định. Vì vậy, tên cơ sở của tệp được hiển thị
sẽ tốt hơn là `index.html`.
* Có khả năng cấu hình các trang thông qua [mặc định front matter](/docs/configuration/front-matter-defaults/)
sẽ rất tuyệt vời! Vì vậy, việc gán một `type` cụ thể cho các trang này sẽ có lợi.

```ruby
module SamplePlugin
  class CategoryPageGenerator < Jekyll::Generator
    safe true

    def generate(site)
      site.categories.each do |category, posts|
        site.pages << CategoryPage.new(site, category, posts)
      end
    end
  end

  # Subclass of `Jekyll::Page` with custom method definitions.
  class CategoryPage < Jekyll::Page
    def initialize(site, category, posts)
      @site = site             # the current site instance.
      @base = site.source      # path to the source directory.
      @dir  = category         # the directory the page will reside in.

      # All pages have the same filename, so define attributes straight away.
      @basename = 'index'      # filename without the extension.
      @ext      = '.html'      # the extension.
      @name     = 'index.html' # basically @basename + @ext.

      # Initialize data hash with a key pointing to all posts under current category.
      # This allows accessing the list in a template via `page.linked_docs`.
      @data = {
        'linked_docs' => posts
      }

      # Look up front matter defaults scoped to type `categories`, if given key
      # doesn't exist in the `data` hash.
      data.default_proc = proc do |_, key|
        site.frontmatter_defaults.find(relative_path, :categories, key)
      end
    end

    # Placeholders that are used in constructing page URL.
    def url_placeholders
      {
        :path       => @dir,
        :category   => @dir,
        :basename   => basename,
        :output_ext => output_ext,
      }
    end
  end
end
```

Các trang được tạo bây giờ có thể được thiết lập để sử dụng một bố cục cụ thể hoặc đầu ra tại một đường dẫn cụ thể trong thư mục
đích tất cả thông qua tệp cấu hình sử dụng mặc định front matter. Ví dụ:

```yaml
# _config.yml

defaults:
  - scope:
      type: categories  # select all category pages
    values:
      layout: category_page
      permalink: categories/:category/
```

## Các khía cạnh kỹ thuật

Các bộ tạo cần triển khai chỉ một phương thức:

<div class="mobile-side-scroller">
<table>
  <thead>
    <tr>
      <th>Phương thức</th>
      <th>Mô tả</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>
        <p><code>generate</code></p>
      </td>
      <td>
        <p>Tạo nội dung như một tác dụng phụ.</p>
      </td>
    </tr>
  </tbody>
</table>
</div>

Nếu bộ tạo của bạn được chứa trong một tệp duy nhất, nó có thể được đặt tên bất cứ thứ gì bạn muốn nhưng nó nên có phần mở rộng `.rb`.
Nếu bộ tạo của bạn được chia thành nhiều tệp, nó nên được đóng gói dưới dạng Rubygem để được xuất bản tại
<https://rubygems.org/>. Trong trường hợp này, tên của gem phụ thuộc vào tính khả dụng của tên tại trang web đó vì
không có hai gem nào có thể có cùng tên.

Theo mặc định, Jekyll tìm kiếm các bộ tạo trong thư mục `_plugins`. Tuy nhiên, bạn có thể thay đổi thư mục mặc định bằng cách
gán tên mong muốn cho khóa `plugins_dir` trong tệp cấu hình.
