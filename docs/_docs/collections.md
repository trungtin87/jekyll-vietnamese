---
title: Bộ sưu tập (Collections)
permalink: /docs/collections/
---

Bộ sưu tập là một cách tuyệt vời để nhóm nội dung liên quan như các thành viên của một nhóm hoặc
các bài nói chuyện tại một hội nghị.

## Thiết lập

Để sử dụng một Bộ sưu tập, trước tiên bạn cần định nghĩa nó trong `_config.yml`. Ví dụ
đây là một bộ sưu tập các nhân viên:

```yaml
collections:
  - staff_members
```

Trong trường hợp này `collections` được định nghĩa là một chuỗi (tức là, mảng) không có siêu dữ liệu bổ sung nào được định nghĩa cho mỗi bộ sưu tập.
Bạn có thể tùy chọn chỉ định siêu dữ liệu cho bộ sưu tập của mình bằng cách định nghĩa `collections` như một ánh xạ (tức là, hashmap) thay vì chuỗi, và sau đó định nghĩa các trường bổ sung trong đó:

```yaml
collections:
  staff_members:
    people: true
```

{: .note .info}
Khi định nghĩa một bộ sưu tập dưới dạng một chuỗi, các trang của nó sẽ không được hiển thị theo
mặc định. Để kích hoạt điều này, <code>output: true</code> phải được chỉ định trên
bộ sưu tập, điều này yêu cầu định nghĩa bộ sưu tập dưới dạng một ánh xạ. Để biết thêm
thông tin, xem phần <a href="#output">Đầu ra</a>.

<div class="note">
  <h5>Tập hợp các bộ sưu tập của bạn {%- include docs_version_badge.html version="3.7.0" -%}</h5>

  <p>Bạn có thể tùy chọn chỉ định một thư mục để lưu trữ tất cả các bộ sưu tập của mình ở cùng một nơi với <code>collections_dir: my_collections</code>.</p>

  <p>Sau đó Jekyll sẽ tìm trong <code>my_collections/_books</code> cho bộ sưu tập <code>books</code>, và
  trong <code>my_collections/_recipes</code> cho bộ sưu tập <code>recipes</code>.</p>
</div>

<div class="note warning">
  <h5>Hãy chắc chắn di chuyển bản nháp và bài đăng vào thư mục bộ sưu tập tùy chỉnh</h5>

  <p>Nếu bạn chỉ định một thư mục để lưu trữ tất cả các bộ sưu tập của mình ở cùng một nơi với <code>collections_dir: my_collections</code>, thì bạn sẽ cần di chuyển thư mục <code>_drafts</code> và <code>_posts</code> của mình đến <code>my_collections/_drafts</code> và <code>my_collections/_posts</code>. Lưu ý rằng, tên của thư mục bộ sưu tập của bạn không thể bắt đầu bằng dấu gạch dưới (`_`).</p>
</div>

## Thêm nội dung

Tạo một thư mục tương ứng (ví dụ: `<source>/_staff_members`) và thêm
các tài liệu. Front matter được xử lý nếu front matter tồn tại, và mọi thứ
sau front matter được đẩy vào thuộc tính `content` của tài liệu. Nếu không có front
matter nào được cung cấp, Jekyll sẽ coi nó là một [tệp tĩnh]({{ '/docs/static-files/' | relative_url }})
và nội dung sẽ không trải qua quá trình xử lý tiếp theo. Nếu front matter được cung cấp,
Jekyll sẽ xử lý nội dung tệp thành đầu ra mong đợi.

Bất kể front matter có tồn tại hay không, Jekyll sẽ chỉ ghi vào thư mục đích
(ví dụ: `_site`) nếu `output: true` đã được đặt trong siêu dữ liệu của bộ sưu tập.

Ví dụ, đây là cách bạn sẽ thêm một nhân viên vào bộ sưu tập được thiết lập ở trên.
Tên tệp là `./_staff_members/jane.md` với nội dung sau:

```markdown
---
name: Jane Doe
position: Developer
---
Jane has worked on Jekyll for the past *five years*.
```

<em>
  Lưu ý rằng mặc dù được coi là một bộ sưu tập trong nội bộ, điều trên
  không áp dụng cho [bài đăng](/docs/posts/). Các bài đăng có định dạng tên tệp hợp lệ sẽ được
  đánh dấu để xử lý ngay cả khi chúng không chứa front matter.
</em>

<div class="note info">
  <h5>Hãy chắc chắn đặt tên thư mục của bạn một cách chính xác</h5>
  <p>
Thư mục phải được đặt tên giống hệt với bộ sưu tập bạn đã định nghĩa trong
tệp <code>_config.yml</code> của bạn, với việc thêm ký tự <code>_</code> ở trước.
  </p>
</div>

## Đầu ra

Bây giờ bạn có thể lặp qua `site.staff_members` trên một trang và xuất nội dung
cho mỗi nhân viên. Tương tự như các bài đăng, phần thân của tài liệu được truy cập
bằng biến `content`:

{% raw %}

```liquid
{% for staff_member in site.staff_members %}
  <h2>{{ staff_member.name }} - {{ staff_member.position }}</h2>
  <p>{{ staff_member.content | markdownify }}</p>
{% endfor %}
```

{% endraw %}

Nếu bạn muốn Jekyll tạo một trang được hiển thị cho mỗi tài liệu trong
bộ sưu tập của bạn, bạn có thể đặt khóa `output` thành `true` trong siêu dữ liệu
bộ sưu tập của bạn trong `_config.yml`:

```yaml
collections:
  staff_members:
    output: true
```

Bạn có thể liên kết đến trang được tạo bằng thuộc tính `url`:

{% raw %}

```liquid
{% for staff_member in site.staff_members %}
  <h2>
    <a href="{{ staff_member.url }}">
      {{ staff_member.name }} - {{ staff_member.position }}
    </a>
  </h2>
  <p>{{ staff_member.content | markdownify }}</p>
{% endfor %}
```

{% endraw %}

## Liên kết tĩnh (Permalinks)

Có các [biến liên kết tĩnh đặc biệt cho bộ sưu tập]({{ '/docs/permalinks/#collections' | relative_url }}) để
giúp bạn kiểm soát url đầu ra cho toàn bộ bộ sưu tập.

## Sắp xếp Tùy chỉnh Tài liệu {%- include docs_version_badge.html version="4.0" -%}

{: #custom-sorting-of-documents}

Theo mặc định, hai tài liệu trong một bộ sưu tập được sắp xếp theo thuộc tính `date` của chúng khi cả hai đều có khóa `date` trong front matter của chúng. Tuy nhiên, nếu một trong hai hoặc cả hai tài liệu không có khóa `date` trong front matter, chúng được sắp xếp theo đường dẫn tương ứng của chúng.

Bạn có thể kiểm soát việc sắp xếp này thông qua siêu dữ liệu của bộ sưu tập.

### Sắp xếp Theo Khóa Front Matter

Các tài liệu có thể được sắp xếp dựa trên một khóa front matter bằng cách đặt siêu dữ liệu `sort_by` thành chuỗi khóa front matter. Ví dụ,
để sắp xếp một bộ sưu tập các hướng dẫn dựa trên khóa `lesson`, cấu hình sẽ là:

```yaml
collections:
  tutorials:
    sort_by: lesson
```

Các tài liệu được sắp xếp theo thứ tự tăng dần của giá trị khóa. Nếu một tài liệu không có khóa front matter được định nghĩa
thì tài liệu đó được đặt ngay sau các tài liệu đã sắp xếp. Khi nhiều tài liệu không có khóa front matter được định nghĩa,
những tài liệu đó được sắp xếp theo ngày hoặc đường dẫn của chúng và sau đó được đặt ngay sau các tài liệu đã sắp xếp.

### Sắp xếp Tài liệu Thủ công

Bạn cũng có thể sắp xếp thủ công các tài liệu bằng cách đặt siêu dữ liệu `order` với **tên tệp được liệt kê** theo thứ tự mong muốn.
Ví dụ, một bộ sưu tập các hướng dẫn sẽ được cấu hình như sau:

```yaml
collections:
  tutorials:
    order:
      - hello-world.md
      - introduction.md
      - basic-concepts.md
      - advanced-concepts.md
```

Bất kỳ tài liệu nào có tên tệp không khớp với mục danh sách chỉ đơn giản là được đặt sau các tài liệu đã sắp xếp lại. Nếu một tài liệu được
lồng dưới các thư mục con, hãy bao gồm chúng trong các mục nhập:

```yaml
collections:
  tutorials:
    order:
      - hello-world.md
      - introduction.md
      - concepts/basics.md
      - concepts/advanced.md
```

Nếu cả hai khóa siêu dữ liệu đã được định nghĩa đúng cách, danh sách `order` sẽ được ưu tiên.

## Thuộc tính Liquid

### Bộ sưu tập

Các bộ sưu tập cũng có sẵn dưới `site.collections`, với siêu dữ liệu
bạn đã chỉ định trong `_config.yml` (nếu có) và thông tin sau:

<div class="mobile-side-scroller">
<table>
  <thead>
    <tr>
      <th>Biến</th>
      <th>Mô tả</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>
        <p><code>label</code></p>
      </td>
      <td>
        <p>
          Tên của bộ sưu tập của bạn, ví dụ: <code>my_collection</code>.
        </p>
      </td>
    </tr>
    <tr>
      <td>
        <p><code>docs</code></p>
      </td>
      <td>
        <p>
          Một mảng các <a href="#documents">tài liệu</a>.
        </p>
      </td>
    </tr>
    <tr>
      <td>
        <p><code>files</code></p>
      </td>
      <td>
        <p>
          Một mảng các tệp tĩnh trong bộ sưu tập.
        </p>
      </td>
    </tr>
    <tr>
      <td>
        <p><code>relative_directory</code></p>
      </td>
      <td>
        <p>
          Đường dẫn đến thư mục nguồn của bộ sưu tập, tương đối với nguồn trang web.
        </p>
      </td>
    </tr>
    <tr>
      <td>
        <p><code>directory</code></p>
      </td>
      <td>
        <p>
          Đường dẫn đầy đủ đến thư mục nguồn của bộ sưu tập.
        </p>
      </td>
    </tr>
    <tr>
      <td>
        <p><code>output</code></p>
      </td>
      <td>
        <p>
          Liệu các tài liệu của bộ sưu tập có được xuất ra dưới dạng các tệp riêng lẻ hay không.
        </p>
      </td>
    </tr>
  </tbody>
</table>
</div>

<div class="note info">
  <h5>Một Bộ sưu tập Được mã hóa cứng</h5>
  <p>Ngoài bất kỳ bộ sưu tập nào bạn tự tạo, bộ sưu tập
  <code>posts</code> được mã hóa cứng vào Jekyll. Nó tồn tại cho dù
  bạn có thư mục <code>_posts</code> hay không. Đây là điều cần lưu ý
  khi lặp qua <code>site.collections</code> vì bạn có thể cần phải
  lọc nó ra.</p>
  <p>Bạn có thể muốn sử dụng bộ lọc để tìm bộ sưu tập của mình:
  <code>{% raw %}{{ site.collections | where: "label", "myCollection" | first }}{% endraw %}</code></p>
</div>

<div class="note info">
  <h5>Bộ sưu tập và Thời gian</h5>
  <p>Ngoại trừ các tài liệu trong bộ sưu tập mặc định được mã hóa cứng <code>posts</code>, tất cả các tài liệu trong các bộ sưu tập
    bạn tạo, đều có thể truy cập được qua Liquid bất kể ngày được chỉ định của chúng, nếu có, và do đó có thể hiển thị.
  </p>
  <p>Các tài liệu chỉ được cố gắng ghi vào đĩa nếu siêu dữ liệu bộ sưu tập liên quan
    có <code>output: true</code>. Ngoài ra, các tài liệu có ngày trong tương lai chỉ được ghi nếu
    <code>site.future</code> <em>cũng là true</em>.
  </p>
  <p>Kiểm soát chi tiết hơn đối với các tài liệu được ghi vào đĩa có thể được thực hiện bằng cách đặt
    <code>published: false</code> (<em><code>true</code> theo mặc định</em>) trong front matter của tài liệu.
  </p>
</div>

### Tài liệu

Ngoài bất kỳ front matter nào được cung cấp trong tệp tương ứng của tài liệu,
mỗi tài liệu có các thuộc tính sau:

<div class="mobile-side-scroller">
<table>
  <thead>
    <tr>
      <th>Biến</th>
      <th>Mô tả</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>
        <p><code>content</code></p>
      </td>
      <td>
        <p>
          Nội dung (chưa được hiển thị) của tài liệu. Nếu không có front matter nào được
          cung cấp, Jekyll sẽ không tạo tệp trong bộ sưu tập của bạn. Nếu
          front matter được sử dụng, thì đây là tất cả nội dung của tệp
          sau dấu kết thúc
          `---` của front matter.
        </p>
      </td>
    </tr>
    <tr>
      <td>
        <p><code>output</code></p>
      </td>
      <td>
        <p>
          Đầu ra được hiển thị của tài liệu, dựa trên
          <code>content</code>.
        </p>
      </td>
    </tr>
    <tr>
      <td>
        <p><code>path</code></p>
      </td>
      <td>
        <p>
          Đường dẫn đầy đủ đến tệp nguồn của tài liệu.
        </p>
      </td>
    </tr>
    <tr>
      <td>
        <p><code>relative_path</code></p>
      </td>
      <td>
        <p>
          Đường dẫn đến tệp nguồn của tài liệu tương đối với nguồn trang web.
        </p>
      </td>
    </tr>
    <tr>
      <td>
        <p><code>url</code></p>
      </td>
      <td>
        <p>
          URL của bộ sưu tập được hiển thị. Tệp chỉ được ghi vào đích khi bộ sưu tập mà nó thuộc về có <code>output: true</code> trong cấu hình của trang web.
          </p>
      </td>
    </tr>
    <tr>
      <td>
        <p><code>collection</code></p>
      </td>
      <td>
        <p>
          Tên của bộ sưu tập của tài liệu.
        </p>
      </td>
    </tr>
    <tr>
      <td>
        <p><code>date</code></p>
      </td>
      <td>
        <p>
          Ngày của bộ sưu tập của tài liệu.
        </p>
      </td>
    </tr>
  </tbody>
</table>
</div>
