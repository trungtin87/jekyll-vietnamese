---
title: Cấu trúc Thư mục
permalink: /docs/structure/
---
Một trang Jekyll cơ bản thường trông giống như thế này:

```
.
├── _config.yml
├── _data
│   └── members.yml
├── _drafts
│   ├── begin-with-the-crazy-ideas.md
│   └── on-simplicity-in-technology.md
├── _includes
│   ├── footer.html
│   └── header.html
├── _layouts
│   ├── default.html
│   └── post.html
├── _posts
│   ├── 2007-10-29-why-every-programmer-should-play-nethack.md
│   └── 2009-04-26-barcamp-boston-4-roundup.md
├── _sass
│   ├── _base.scss
│   └── _layout.scss
├── _site
├── .jekyll-cache
│   └── Jekyll
│       └── Cache
│           └── [...]
├── .jekyll-metadata
└── index.html # cũng có thể là 'index.md' với front matter hợp lệ
```

<div class="note">
  <h5>Cấu trúc thư mục của các trang Jekyll sử dụng giao diện dựa trên gem</h5>
  <p>
    Kể từ phiên bản {% include docs_version_badge.html version="3.2"%}, một dự án Jekyll mới được khởi tạo bằng <code>jekyll new</code> sử dụng <a href="/docs/themes/">giao diện dựa trên gem</a> để xác định giao diện của trang web. Điều này dẫn đến cấu trúc thư mục mặc định nhẹ hơn: <code>_layouts</code>, <code>_includes</code> và <code>_sass</code> được lưu trữ trong theme-gem theo mặc định.
  </p>
  <br />
  <p>
     <a href="https://github.com/jekyll/minima">minima</a> là giao diện mặc định hiện tại, và <code>bundle info minima</code> sẽ hiển thị cho bạn nơi các tệp của giao diện minima được lưu trữ trên máy tính của bạn.
  </p>
</div>

Tổng quan về chức năng của từng thành phần:

<div class="mobile-side-scroller">
<table>
  <thead>
    <tr>
      <th>Tệp / Thư mục</th>
      <th>Mô tả</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>
        <p><code>_config.yml</code></p>
      </td>
      <td>
        <p>
          Lưu trữ dữ liệu <a href="/docs/configuration/">cấu hình</a>. Nhiều tùy chọn trong số này có thể được chỉ định từ dòng lệnh thực thi nhưng dễ dàng hơn để chỉ định chúng ở đây để bạn không phải nhớ chúng.
        </p>
      </td>
    </tr>
    <tr>
      <td>
        <p><code>_drafts</code></p>
      </td>
      <td>
        <p>
          Bản nháp là các bài đăng chưa được xuất bản. Định dạng của các tệp này không có ngày tháng: <code>title.MARKUP</code>. Tìm hiểu cách <a href="/docs/posts/#drafts">làm việc với bản nháp</a>.
        </p>
      </td>
    </tr>
    <tr>
      <td>
        <p><code>_includes</code></p>
      </td>
      <td>
        <p>
          Đây là các thành phần (partials) có thể được trộn và kết hợp bởi các bố cục và bài đăng của bạn để tạo điều kiện tái sử dụng. Thẻ liquid <code>{% raw %}{% include file.ext %}{% endraw %}</code> có thể được sử dụng để bao gồm thành phần trong <code>_includes/file.ext</code>.
        </p>
      </td>
    </tr>
    <tr>
      <td>
        <p><code>_layouts</code></p>
      </td>
      <td>
        <p>
          Đây là các mẫu bao bọc các bài đăng. Các bố cục được chọn trên cơ sở từng bài đăng trong <a href="/docs/front-matter/">front matter</a>, được mô tả trong phần tiếp theo. Thẻ liquid <code>{% raw %}{{ content }}{% endraw %}</code> được sử dụng để đưa nội dung vào trang web.
        </p>
      </td>
    </tr>
    <tr>
      <td>
        <p><code>_posts</code></p>
      </td>
      <td>
        <p>
          Nội dung động của bạn. Quy ước đặt tên của các tệp này rất quan trọng và phải tuân theo định dạng: <code>YEAR-MONTH-DAY-title.MARKUP</code>. Các <a href="/docs/permalinks/">liên kết tĩnh (permalinks)</a> có thể được tùy chỉnh cho từng bài đăng, nhưng ngày tháng và ngôn ngữ đánh dấu được xác định hoàn toàn bởi tên tệp.
        </p>
      </td>
    </tr>
    <tr>
      <td>
        <p><code>_data</code></p>
      </td>
      <td>
        <p>
          Dữ liệu trang web được định dạng tốt nên được đặt ở đây. Công cụ Jekyll sẽ tự động tải tất cả các tệp dữ liệu (sử dụng các định dạng và phần mở rộng <code>.yml</code>, <code>.yaml</code>, <code>.json</code>, <code>.csv</code> hoặc <code>.tsv</code>) trong thư mục này, và chúng sẽ có thể truy cập được qua `site.data`. Nếu có một tệp <code>members.yml</code> trong thư mục, thì bạn có thể truy cập nội dung của tệp thông qua <code>site.data.members</code>.
        </p>
      </td>
    </tr>
    <tr>
      <td>
        <p><code>_sass</code></p>
      </td>
      <td>
        <p>
          Đây là các thành phần sass có thể được nhập vào <code>main.scss</code> của bạn, sau đó sẽ được xử lý thành một bảng kiểu (stylesheet) duy nhất <code>main.css</code> xác định các kiểu sẽ được sử dụng bởi trang web của bạn. Tìm hiểu <a href="{{ '/docs/assets/' | relative_url }}">cách làm việc với tài sản (assets)</a>.
        </p>
      </td>
    </tr>
    <tr>
      <td>
        <p><code>_site</code></p>
      </td>
      <td>
        <p>
          Đây là nơi trang web được tạo sẽ được đặt (theo mặc định) sau khi Jekyll hoàn tất việc chuyển đổi nó. Có lẽ là một ý tưởng tốt để thêm thư mục này vào tệp <code>.gitignore</code> của bạn.
        </p>
      </td>
    </tr>
    <tr>
      <td>
        <p><code>.jekyll-cache</code></p>
      </td>
      <td>
        <p>
          Giữ một bản sao của các trang và đánh dấu (ví dụ: markdown) đã tạo để phục vụ nhanh hơn. Được tạo khi sử dụng ví dụ: <code>jekyll serve</code>. Có thể bị vô hiệu hóa với <a href="/docs/configuration/options/">một tùy chọn và/hoặc cờ</a>. Thư mục này sẽ không được bao gồm trong trang web được tạo. Có lẽ là một ý tưởng tốt để thêm thư mục này vào tệp <code>.gitignore</code> của bạn.
        </p>
      </td>
    </tr>
    <tr>
      <td>
        <p><code>.jekyll-metadata</code></p>
      </td>
      <td>
        <p>
          Tệp này giúp Jekyll theo dõi các tệp nào chưa được sửa đổi kể từ lần cuối cùng trang web được xây dựng, và các tệp nào sẽ cần được tạo lại trong lần xây dựng tiếp theo. Chỉ được tạo khi sử dụng <a href="/docs/configuration/incremental-regeneration/">tái tạo gia tăng</a> (ví dụ: với <code>jekyll serve -I</code>). Tệp này sẽ không được bao gồm trong trang web được tạo. Có lẽ là một ý tưởng tốt để thêm tệp này vào tệp <code>.gitignore</code> của bạn.
        </p>
      </td>
    </tr>
    <tr>
      <td>
        <p><code>index.html</code> hoặc <code>index.md</code> và các tệp HTML, Markdown khác</p>
      </td>
      <td>
        <p>
          Miễn là tệp có phần <a href="/docs/front-matter/">front matter</a>, nó sẽ được chuyển đổi bởi Jekyll. Điều tương tự cũng sẽ xảy ra đối với bất kỳ tệp <code>.html</code>, <code>.markdown</code>, <code>.md</code>, hoặc <code>.textile</code> nào trong thư mục gốc của trang web của bạn hoặc các thư mục không được liệt kê ở trên.
        </p>
      </td>
    </tr>
    <tr>
      <td>
        <p>Các Tệp/Thư mục Khác</p>
      </td>
      <td>
        <p>
          Ngoại trừ các trường hợp đặc biệt được liệt kê ở trên, mọi thư mục và tệp khác—chẳng hạn như các thư mục <code>css</code> và <code>images</code>, tệp <code>favicon.ico</code>, v.v.—sẽ được sao chép nguyên văn sang trang web được tạo. Có rất nhiều <a href="/showcase/">trang web đã sử dụng Jekyll</a> nếu bạn tò mò muốn xem cách chúng được bố trí.
        </p>
      </td>
    </tr>
  </tbody>
</table>
</div>

Mọi tệp hoặc thư mục bắt đầu bằng các ký tự sau: `.`, `_`, `#` hoặc `~` trong thư mục `source` sẽ không được bao gồm trong thư mục `destination`. Các đường dẫn như vậy sẽ phải được chỉ định rõ ràng qua tệp cấu hình trong chỉ thị `include` để đảm bảo chúng được sao chép qua:

```yaml
include:
 - _pages
 - .htaccess
 ```
