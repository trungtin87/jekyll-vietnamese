---
title: Mặc định Front Matter (Front Matter Defaults)
permalink: "/docs/configuration/front-matter-defaults/"
---

Sử dụng [front matter](/docs/front-matter/) là một cách mà bạn có thể chỉ định cấu hình trong các trang và bài đăng cho trang web của mình. Việc thiết lập những thứ như bố cục mặc định, hoặc tùy chỉnh tiêu đề, hoặc chỉ định ngày/giờ chính xác hơn cho bài đăng đều có thể được thêm vào front matter của trang hoặc bài đăng của bạn.

Thông thường, bạn sẽ thấy rằng bạn đang lặp lại rất nhiều tùy chọn cấu hình. Thiết lập cùng một bố cục trong mỗi tệp, thêm cùng một danh mục - hoặc các danh mục - vào một bài đăng, v.v. Bạn thậm chí có thể thêm các biến tùy chỉnh như tên tác giả, có thể giống nhau cho phần lớn các bài đăng trên blog của bạn.

Thay vì lặp lại cấu hình này mỗi khi bạn tạo một bài đăng hoặc trang mới, Jekyll cung cấp một cách để thiết lập các mặc định này trong cấu hình trang web. Để làm điều này, bạn có thể chỉ định các mặc định toàn trang web bằng cách sử dụng khóa `defaults` trong tệp `_config.yml` trong thư mục gốc của dự án của bạn.

Khóa `defaults` chứa một mảng các cặp phạm vi/giá trị (scope/values) xác định những mặc định nào nên được thiết lập cho một đường dẫn tệp cụ thể, và tùy chọn, một loại tệp trong đường dẫn đó.

Giả sử rằng bạn muốn thêm một bố cục mặc định cho tất cả các trang và bài đăng trong trang web của mình. Bạn sẽ thêm điều này vào tệp `_config.yml` của mình:

```yaml
defaults:
  -
    scope:
      path: "" # một chuỗi trống ở đây có nghĩa là tất cả các tệp trong dự án
    values:
      layout: "default"
```

<div class="note info">
  <h5>Dừng và chạy lại lệnh `jekyll serve`.</h5>
  <p>
    Tệp cấu hình chính <code>_config.yml</code> chứa các cấu hình toàn cục
    và các định nghĩa biến được đọc một lần tại thời điểm thực thi. Các thay đổi được thực hiện đối với <code>_config.yml</code>
    trong quá trình tái tạo tự động sẽ không được tải cho đến lần thực thi tiếp theo.
  </p>
  <p>
    Lưu ý <a href="{{ '/docs/datafiles/' | relative_url }}">Tệp Dữ liệu</a> được bao gồm và tải lại trong quá trình tái tạo tự động.
  </p>
</div>

Ở đây, chúng tôi đang xác định phạm vi `values` cho bất kỳ tệp nào tồn tại trong đường dẫn `scope`. Vì đường dẫn được đặt là một chuỗi trống, nó sẽ áp dụng cho **tất cả các tệp** trong dự án của bạn. Bạn có thể không muốn đặt một bố cục trên mọi tệp trong dự án của mình - ví dụ như các tệp css - vì vậy bạn cũng có thể chỉ định một giá trị `type` dưới khóa `scope`.

```yaml
defaults:
  -
    scope:
      path: "" # một chuỗi trống ở đây có nghĩa là tất cả các tệp trong dự án
      type: "posts" # trước đây là `post` trong Jekyll 2.2.
    values:
      layout: "default"
```

Bây giờ, điều này sẽ chỉ đặt bố cục cho các tệp có loại là `posts`.
Các loại khác nhau có sẵn cho bạn là `pages`, `posts`, `drafts` hoặc bất kỳ bộ sưu tập nào trong trang web của bạn. Trong khi `type` là tùy chọn, bạn phải chỉ định một giá trị cho `path` khi tạo một cặp `scope/values`.

Như đã đề cập trước đó, bạn có thể đặt nhiều cặp phạm vi/giá trị cho `defaults`.

```yaml
defaults:
  -
    scope:
      path: ""
      type: "pages"
    values:
      layout: "my-site"
  -
    scope:
      path: "projects"
      type: "pages" # trước đây là `page` trong Jekyll 2.2.
    values:
      layout: "project" # ghi đè bố cục mặc định trước đó
      author: "Mr. Hyde"
```

Với các mặc định này, tất cả các trang sẽ sử dụng bố cục `my-site`. Bất kỳ tệp html nào tồn tại trong thư mục `projects/`
sẽ sử dụng bố cục `project`, nếu nó tồn tại. Những tệp đó cũng sẽ có [biến liquid]({{ '/docs/variables/' | relative_url }}) `page.author` được đặt thành `Mr. Hyde`.

```yaml
collections:
  my_collection:
    output: true

defaults:
  -
    scope:
      path: ""
      type: "my_collection" # một bộ sưu tập trong trang web của bạn, ở dạng số nhiều
    values:
      layout: "default"
```

Trong ví dụ này, `layout` được đặt thành `default` bên trong
[bộ sưu tập]({{ '/docs/collections/' | relative_url }}) với tên `my_collection`.

### Mẫu Glob trong mặc định Front Matter

Cũng có thể sử dụng các mẫu glob (hiện bị giới hạn ở các mẫu có chứa `*`) khi khớp các mặc định. Ví dụ, có thể đặt bố cục cụ thể cho mỗi `special-page.html` trong bất kỳ thư mục con nào của thư mục `section`. {%- include docs_version_badge.html version="3.7.0" -%}

```yaml
collections:
  my_collection:
    output: true

defaults:
  -
    scope:
      path: "section/*/special-page.html"
    values:
      layout: "specific-layout"
```

<div class="note warning">
  <h5>Globbing và Hiệu suất</h5>
  <p>
    Xin lưu ý rằng việc globbing một đường dẫn được biết là có tác động tiêu cực đến
    hiệu suất và hiện không được tối ưu hóa, đặc biệt là trên Windows.
    Globbing một đường dẫn sẽ làm tăng thời gian xây dựng của bạn tỷ lệ thuận với kích thước
    của thư mục bộ sưu tập liên quan.
  </p>
</div>

### Thứ tự ưu tiên (Precedence)

Jekyll sẽ áp dụng tất cả các cài đặt cấu hình bạn chỉ định trong phần `defaults` của tệp `_config.yml` của bạn. Bạn có thể chọn ghi đè các cài đặt từ cặp phạm vi/giá trị khác bằng cách chỉ định một đường dẫn cụ thể hơn cho phạm vi.

Bạn có thể thấy điều đó trong ví dụ áp chót ở trên. Đầu tiên, chúng tôi đặt bố cục trang mặc định thành `my-site`. Sau đó, sử dụng một đường dẫn cụ thể hơn, chúng tôi đặt bố cục mặc định cho các trang trong đường dẫn `projects/` thành `project`. Điều này có thể được thực hiện với bất kỳ giá trị nào mà bạn sẽ đặt trong front matter của trang hoặc bài đăng.

Cuối cùng, nếu bạn đặt các mặc định trong cấu hình trang web bằng cách thêm một phần `defaults` vào tệp `_config.yml` của bạn, bạn có thể ghi đè các cài đặt đó trong một tệp bài đăng hoặc trang. Tất cả những gì bạn cần làm là chỉ định các cài đặt trong front matter của bài đăng hoặc trang. Ví dụ:

```yaml
# In _config.yml
...
defaults:
  -
    scope:
      path: "projects"
      type: "pages"
    values:
      layout: "project"
      author: "Mr. Hyde"
      category: "project"
...
```

```yaml
# In projects/foo_project.md
---
author: "John Smith"
layout: "foobar"
---
The post text goes here...
```

`projects/foo_project.md` sẽ có `layout` được đặt thành `foobar` thay vì
`project` và `author` được đặt thành `John Smith` thay vì `Mr. Hyde` khi
trang web được xây dựng.
