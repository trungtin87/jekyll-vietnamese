---
title: Điều hướng (Navigation)
author: tomjoht
date: 2017-01-24 15:38:17 -0800
---

Nếu trang web Jekyll của bạn có nhiều trang, bạn có thể muốn tạo điều hướng cho các trang. Thay vì mã hóa cứng các liên kết điều hướng, bạn có thể lấy danh sách các trang theo chương trình để xây dựng điều hướng cho trang web của mình.

Mặc dù đã có thông tin về [tương tác với tệp dữ liệu]({% link _docs/datafiles.md %}) trong tài liệu Jekyll khác, hướng dẫn này đi sâu vào việc xây dựng điều hướng mạnh mẽ hơn cho trang web của bạn.

Có hai cách chính để lấy các trang trên trang web Jekyll:

* **Lấy các trang được liệt kê trong nguồn dữ liệu YAML**. Lưu trữ dữ liệu trang trong tệp YAML (hoặc JSON hoặc CSV) trong thư mục `_data`, lặp qua các thuộc tính YAML và chèn các giá trị vào giao diện của bạn.
* **Lấy các trang bằng cách lặp qua front matter của trang**. Xem qua front matter của các trang của bạn để xác định các thuộc tính nhất định, trả về các trang đó và chèn các giá trị front matter của trang vào giao diện của bạn.

Các ví dụ sau đây bắt đầu với một kịch bản điều hướng cơ bản và thêm các yếu tố phức tạp hơn để chứng minh các cách khác nhau để trả về các trang. Trong mọi kịch bản, bạn sẽ thấy 3 yếu tố:

* YAML
* Liquid
* Kết quả

Tệp YAML trong thư mục `_data` được gọi là `samplelist.yml`.

Các kịch bản như sau:

* TOC
{:toc}

## Kịch bản 1: Danh sách cơ bản

Bạn muốn trả về một danh sách cơ bản các trang.

**YAML**

```yaml
docs_list_title: Tài liệu ACME
docs:

- title: Giới thiệu
  url: introduction.html

- title: Cấu hình
  url: configuration.html

- title: Triển khai
  url: deployment.html
```

**Liquid**

{% raw %}

```liquid
<h2>{{ site.data.samplelist.docs_list_title }}</h2>
<ul>
   {% for item in site.data.samplelist.docs %}
      <li><a href="{{ item.url }}">{{ item.title }}</a></li>
   {% endfor %}
</ul>
```

{% endraw %}

**Kết quả**
<div class="highlight result" data-proofer-ignore>
   <h2>Tài liệu ACME</h2>
   <ul>
      <li><a href="#">Giới thiệu</a></li>
      <li><a href="#">Cấu hình</a></li>
      <li><a href="#">Triển khai</a></li>
   </ul>
</div>

{: .note .info}
Đối với kết quả trong các mẫu hư cấu này, `#` được thay thế thủ công cho giá trị liên kết thực tế (để tránh lỗi 404.)

Khi bạn sử dụng vòng lặp `for`, bạn chọn cách bạn muốn tham chiếu đến các mục bạn đang lặp qua. Biến bạn chọn (trong trường hợp này là `item`) trở thành cách bạn truy cập các thuộc tính của mỗi mục trong danh sách. Ký hiệu dấu chấm được sử dụng để lấy thuộc tính của mục (ví dụ: `item.url`).

Nội dung YAML có hai loại định dạng chính có liên quan ở đây:

* ánh xạ (mapping)
* danh sách (list)

`docs_list_title: Tài liệu ACME` là một ánh xạ. Bạn truy cập giá trị bằng `site.data.samplelist.docs_list_title`.

`docs:` là một danh sách. Danh sách bắt đầu mỗi mục bằng dấu gạch ngang. Không giống như ánh xạ, bạn thường không truy cập trực tiếp các thuộc tính danh sách như bạn làm với ánh xạ. Nếu bạn muốn truy cập một mục cụ thể trong danh sách, bạn phải xác định vị trí trong danh sách mà bạn muốn, theo ký hiệu mảng điển hình. Ví dụ: `site.data.samplelist.docs[0]` sẽ truy cập mục đầu tiên trong danh sách. Tuy nhiên, điều này hiếm khi được thực hiện.

Với danh sách, bạn thường sử dụng vòng lặp `for` để lặp qua danh sách các mục và làm điều gì đó với mỗi mục. Với menu điều hướng, bạn thường chèn mỗi mục danh sách vào thẻ `li` dựa trên cấu trúc điều hướng bạn đang sử dụng trong giao diện HTML của mình.

Mỗi dấu gạch ngang (`-`) cho biết một mục khác trong danh sách. Ví dụ này chỉ có hai thuộc tính với mỗi mục danh sách: `title` và `url`. Bạn có thể bao gồm bao nhiêu thuộc tính tùy thích cho mỗi mục. Thứ tự của các thuộc tính ở mỗi vị trí trong danh sách không quan trọng.

## Kịch bản 2: Danh sách được sắp xếp

Giả sử bạn muốn sắp xếp danh sách theo `title`. Để làm điều này, hãy chuyển đổi tham chiếu đến bộ sưu tập `docs` thành một biến, sau đó áp dụng bộ lọc `sort` của Liquid cho biến:

**Liquid**

{% raw %}

```liquid
{% assign doclist = site.data.samplelist.docs | sort: 'title'  %}
<ol>
{% for item in doclist %}
    <li><a href="{{ item.url }}">{{ item.title }}</a></li>
{% endfor %}
</ol>
```

{% endraw %}

**Kết quả**

<div class="highlight result" data-proofer-ignore>
   <ol>
      <li><a href="#">Cấu hình</a></li>
      <li><a href="#">Giới thiệu</a></li>
      <li><a href="#">Triển khai</a></li>
   </ol>
</div>

Các mục bây giờ xuất hiện theo thứ tự bảng chữ cái. Thuộc tính `sort` trong bộ lọc Liquid áp dụng cho `title`, là một thuộc tính thực tế trong danh sách. Nếu `title` không phải là một thuộc tính, chúng ta sẽ cần sắp xếp theo một thuộc tính khác.

Xem [bộ lọc mảng Liquid](https://help.shopify.com/themes/liquid/filters/array-filters) để biết thêm tùy chọn bộ lọc. Lưu ý rằng bạn không thể chỉ đơn giản sử dụng cú pháp này:

{% raw %}

```liquid
{% for item in site.data.samplelist.docs | sort: "title" %}{% endfor %}
```

{% endraw %}

Bạn phải chuyển đổi `site.data.samplelist.docs` thành một biến trước bằng cách sử dụng thẻ `assign` hoặc `capture`.

## Kịch bản 3: Danh sách điều hướng hai cấp

Giả sử bạn muốn một danh sách mạnh mẽ hơn kết hợp nhiều phần tiêu đề và các mục con. Để làm điều này, hãy thêm một cấp độ bổ sung cho mỗi mục danh sách để lưu trữ thông tin này:

**YAML**

```yaml
toc:
  - title: Nhóm 1
    subfolderitems:
      - page: Thứ 1
        url: /thing1.html
      - page: Thứ 2
        url: /thing2.html
      - page: Thứ 3
        url: /thing3.html
  - title: Nhóm 2
    subfolderitems:
      - page: Phần 1
        url: /piece1.html
      - page: Phần 2
        url: /piece2.html
      - page: Phần 3
        url: /piece3.html
  - title: Nhóm 3
    subfolderitems:
      - page: Widget 1
        url: /widget1.html
      - page: Widget 2
        url: /widget2.html
      - page: Widget 3
        url: /widget3.html
```

**Liquid**

{% raw %}

```liquid
{% for item in site.data.samplelist.toc %}
    <h3>{{ item.title }}</h3>
      <ul>
        {% for entry in item.subfolderitems %}
          <li><a href="{{ entry.url }}">{{ entry.page }}</a></li>
        {% endfor %}
      </ul>
  {% endfor %}
```

{% endraw %}

**Kết quả**
<div class="highlight result" data-proofer-ignore>
    <h3>Nhóm 1</h3>
      <ul>
          <li><a href="#">Thứ 1</a></li>
          <li><a href="#">Thứ 2</a></li>
          <li><a href="#">Thứ 3</a></li>
      </ul>

    <h3>Nhóm 2</h3>
      <ul>
          <li><a href="#">Phần 1</a></li>
          <li><a href="#">Phần 2</a></li>
          <li><a href="#">Phần 3</a></li>
      </ul>

    <h3>Nhóm 3</h3>
      <ul>
          <li><a href="#">Widget 1</a></li>
          <li><a href="#">Widget 2</a></li>
          <li><a href="#">Widget 3</a></li>
      </ul>
</div>

Trong ví dụ này, `Nhóm 1` là mục danh sách đầu tiên. Trong mục danh sách đó, các trang con của nó được bao gồm dưới dạng một thuộc tính tự chứa một danh sách (`subfolderitems`).

Mã Liquid xem qua cấp độ đầu tiên với `for item in site.data.samplelist.toc`, sau đó xem qua thuộc tính cấp độ thứ hai với `for entry in item.subfolderitems`. Giống như `item` là một tên tùy ý cho các mục chúng ta đang lặp qua, `entry` cũng vậy.

## Kịch bản 4: Danh sách điều hướng ba cấp

Dựa trên phần trước, hãy thêm một cấp độ sâu nữa (`subsubfolderitems`) vào danh sách. Định dạng sẽ phức tạp hơn ở đây, nhưng các nguyên tắc vẫn giống nhau.

**YAML**

```yaml
toc2:
  - title: Nhóm 1
    subfolderitems:
      - page: Thứ 1
        url: /thing1.html
      - page: Thứ 2
        url: /thing2.html
        subsubfolderitems:
          - page: Thứ con 1
            url: /subthing1.html
          - page: Thứ con 2
            url: /subthing2.html
      - page: Thứ 3
        url: /thing3.html
  - title: Nhóm 2
    subfolderitems:
      - page: Phần 1
        url: /piece1.html
      - page: Phần 2
        url: /piece2.html
      - page: Phần 3
        url: /piece3.html
        subsubfolderitems:
          - page: Phần con 1
            url: /subpiece1.html
          - page: Phần con 2
            url: /subpiece2.html
  - title: Nhóm 3
    subfolderitems:
      - page: Widget 1
        url: /widget1.html
        subsubfolderitems:
          - page: Widget con 1
            url: /subwidget1.html
          - page: Widget con 2
            url: /subwidget2.html
      - page: Widget 2
        url: /widget2.html
      - page: Widget 3
        url: /widget3.html
```

**Liquid**

{% raw %}

```liquid
<div>
{% if site.data.samplelist.toc2[0] %}
  {% for item in site.data.samplelist.toc2 %}
    <h3>{{ item.title }}</h3>
      {% if item.subfolderitems[0] %}
        <ul>
          {% for entry in item.subfolderitems %}
              <li><a href="{{ entry.url }}">{{ entry.page }}</a>
                {% if entry.subsubfolderitems[0] %}
                  <ul>
                  {% for subentry in entry.subsubfolderitems %}
                      <li><a href="{{ subentry.url }}">{{ subentry.page }}</a></li>
                  {% endfor %}
                  </ul>
                {% endif %}
              </li>
          {% endfor %}
        </ul>
      {% endif %}
    {% endfor %}
{% endif %}
</div>
```

{% endraw %}

**Kết quả**

<div class="highlight result" data-proofer-ignore>
   <div>
      <h3>Nhóm 1</h3>
      <ul>
         <li><a href="#">Thứ 1</a></li>
         <li><a href="#">Thứ 2</a></li>
         <ul>
            <li><a href="#">Thứ con 1</a></li>
            <li><a href="#">Thứ con 2</a></li>
         </ul>
         <li><a href="#">Thứ 3</a></li>
      </ul>
      <h3>Nhóm 2</h3>
      <ul>
         <li><a href="#">Phần 1</a></li>
         <li><a href="#">Phần 2</a></li>
         <li><a href="#">Phần 3</a></li>
         <ul>
            <li><a href="#">Phần con 1</a></li>
            <li><a href="#">Phần con 2</a></li>
         </ul>
      </ul>
      <h3>Nhóm 3</h3>
      <ul>
         <li><a href="#">Widget 1</a></li>
         <ul>
            <li><a href="#">Widget con 1</a></li>
            <li><a href="#">Widget con 2</a></li>
         </ul>
         <li><a href="#">Widget 2</a></li>
         <li><a href="#">Widget 3</a></li>
      </ul>
   </div>
</div>

Trong ví dụ này, `if site.data.samplelist.toc2[0]` được sử dụng để đảm bảo rằng cấp độ YAML thực sự chứa các mục. Nếu không có gì ở vị trí `[0]`, chúng ta có thể bỏ qua việc tìm kiếm ở cấp độ này.

<div class="note">
  <h5>Mẹo: Căn chỉnh vòng lặp <code>for</code> và câu lệnh <code>if</code></h5>
  <p>Để giữ mã rõ ràng, hãy căn chỉnh các thẻ Liquid mở và đóng, chẳng hạn như vòng lặp <code>for</code> và câu lệnh <code>if</code>. Bằng cách này, bạn biết khi nào các thẻ mở đã được đóng. Nếu mã sẽ xuất hiện trong trang Markdown, hãy giữ các thẻ HTML mở và đóng sát với cạnh trái để bộ lọc Markdown không coi nội dung là mẫu mã. Nếu cần, bạn có thể bọc toàn bộ mẫu mã trong thẻ <code>div</code> để đảm bảo mã có các thẻ HTML đánh dấu mã.</p>
</div>

## Kịch bản 5: Sử dụng biến trang để chọn danh sách YAML

Giả sử thanh bên của bạn sẽ khác nhau dựa trên các bộ tài liệu khác nhau. Bạn có thể có 3 sản phẩm khác nhau trên trang web của mình và vì vậy bạn muốn 3 thanh bên khác nhau &mdash; mỗi thanh duy nhất cho sản phẩm đó.

Bạn có thể lưu trữ tên của danh sách thanh bên trong front matter của trang và sau đó chuyển giá trị đó vào danh sách một cách động.

**Front matter của trang**

```yaml
---
title: Trang của tôi
sidebar: toc
---
```

**Liquid**

{% raw %}

```liquid
<ul>
    {% for item in site.data.samplelist[page.sidebar] %}
      <li><a href="{{ item.url }}">{{ item.title }}</a></li>
    {% endfor %}
</ul>
```

{% endraw %}

**Kết quả**

<div class="highlight result" data-proofer-ignore>
   <ul>
      <li><a href="#">Giới thiệu</a></li>
      <li><a href="#">Cấu hình</a></li>
      <li><a href="#">Triển khai</a></li>
   </ul>
</div>

Trong kịch bản này, chúng ta muốn chuyển các giá trị từ front matter của trang vào vòng lặp `for` có chứa một biến. Khi biến được gán không phải là một chuỗi mà là một tham chiếu dữ liệu, bạn phải sử dụng dấu ngoặc vuông (thay vì dấu ngoặc nhọn) để tham chiếu đến giá trị của front matter.

Để biết thêm thông tin, hãy xem [Biểu thức và Biến](https://github.com/Shopify/liquid/wiki/Liquid-for-Designers#expressions-and-variables) trong tài liệu của Liquid. Dấu ngoặc vuông được sử dụng ở những nơi mà ký hiệu dấu chấm không thể được sử dụng. Bạn cũng có thể đọc thêm chi tiết trong [câu trả lời Stack Overflow này](http://stackoverflow.com/questions/4968406/javascript-property-access-dot-notation-vs-brackets/4968448#4968448).

## Kịch bản 6: Áp dụng lớp active cho trang hiện tại

Ngoài việc chèn các mục từ tệp dữ liệu YAML vào danh sách của bạn, bạn cũng thường muốn làm nổi bật liên kết hiện tại nếu người dùng đang xem trang đó. Bạn thực hiện điều này bằng cách chèn một lớp `active` cho các mục khớp với URL trang hiện tại.

**CSS**

```css
.result li.active a {
    color: lightgray;
    cursor: default;
}
```

**Liquid**

{% raw %}

```liquid
{% for item in site.data.samplelist.docs %}
    <li class="{% if item.url == page.url %}active{% endif %}">
      <a href="{{ item.url }}">{{ item.title }}</a>
    </li>
{% endfor %}
```

{% endraw %}

**Kết quả**

<style>
.result li.active a {
    color: lightgray;
    cursor: default;
  }
</style>

<div class="highlight result" data-proofer-ignore>
   <ul>
      <li class=""><a href="#">Giới thiệu</a></li>
      <li class=""><a href="#">Cấu hình</a></li>
      <li class="active"><a href="#">Triển khai</a></li>
   </ul>
</div>

Trong trường hợp này, giả sử `Triển khai` là trang hiện tại.

Để đảm bảo `item.url` (được lưu trữ trong tệp YAML) khớp với `page.url`, có thể hữu ích khi in {% raw %}`{{ page.url }}`{% endraw %} ra trang.

## Kịch bản 7: Bao gồm các mục có điều kiện

Bạn có thể muốn bao gồm các mục có điều kiện trong danh sách của mình. Ví dụ: có thể bạn có nhiều đầu ra trang web và chỉ muốn bao gồm mục thanh bên cho một số đầu ra nhất định. Bạn có thể thêm các thuộc tính trong mỗi mục danh sách và sau đó sử dụng các thuộc tính đó để bao gồm nội dung có điều kiện.

**YAML**

```yaml
docs2_list_title: Tài liệu ACME
docs2:

- title: Giới thiệu
  url: introduction.html
  version: 1

- title: Cấu hình
  url: configuration.html
  version: 1

- title: Triển khai
  url: deployment.html
  version: 2
```

**Liquid**

{% raw %}

```liquid
  <ul>
    {% for item in site.data.samplelist.docs2 %}
      {% if item.version == 1 %}
        <li><a href="{{ item.url }}">{{ item.title }}</a></li>
      {% endif %}
    {% endfor %}
</ul>
```

{% endraw %}

**Kết quả**

<div class="highlight result" data-proofer-ignore>
   <ul>
      <li><a href="#">Giới thiệu</a></li>
      <li><a href="#">Cấu hình</a></li>
   </ul>
</div>

Trang `Triển khai` bị loại trừ vì `version` của nó là `2`.

## Kịch bản 8: Lấy các mục dựa trên thuộc tính front matter

Nếu bạn không muốn lưu trữ các mục điều hướng của mình trong tệp YAML trong thư mục `_data`, bạn có thể sử dụng vòng lặp `for` để xem qua front matter của mỗi trang hoặc bộ sưu tập và lấy nội dung dựa trên các thuộc tính trong front matter.

Trong kịch bản này, giả sử chúng ta có một bộ sưu tập có tên `_docs`. Bộ sưu tập thường tốt hơn các trang vì chúng cho phép bạn thu hẹp danh sách những gì bạn đang lặp qua. (Cố gắng tránh các kịch bản mà bạn lặp qua số lượng lớn các mục, vì nó sẽ tăng thời gian xây dựng của bạn. [Bộ sưu tập]({% link _docs/collections.md %}) giúp bạn thu hẹp phạm vi.)

Trong kịch bản của chúng ta, có 6 tài liệu trong bộ sưu tập `docs`: Mẫu 1, Mẫu 2, Chủ đề 1, Chủ đề 2, Widget 1 và Widget 2.

Mỗi tài liệu trong bộ sưu tập chứa ít nhất 3 thuộc tính trong front matter:

* `title`
* `category`
* `order`

Front matter cho mỗi trang như sau (được hợp nhất ở đây để ngắn gọn):

```yaml
---
Title: Mẫu 1
category: getting-started
order: 1
---

---
Title: Mẫu 2
category: getting-started
order: 2
---

---
Title: Chủ đề 1
category: configuration
order: 1
---

---
Title: Chủ đề 2
category: configuration
order: 2
---

---
Title: Widget 1
category: deployment
order: 1
---

---
Title: Widget 2
category: deployment
order: 2
---
```

Lưu ý rằng mặc dù `category` được sử dụng trong front matter của tài liệu, `category` không phải là một biến tích hợp như với bài đăng. Nói cách khác, bạn không thể nhìn trực tiếp vào `category` với `site.docs.category`.

Nếu bạn chỉ muốn lấy tất cả các tài liệu trong bộ sưu tập cho một danh mục cụ thể, bạn có thể sử dụng vòng lặp `for` với điều kiện `if` để kiểm tra một danh mục cụ thể:

{% raw %}

```liquid
<h3>Bắt đầu</h3>
<ul>
    {% for doc in site.docs %}
      {% if doc.category == "getting-started" %}
        <li><a href="{{ doc.url }}">{{ doc.title }}</a></li>
      {% endif %}
    {% endfor %}
</ul>
```

{% endraw %}

Kết quả sẽ như sau:

<div class="highlight result" data-proofer-ignore>
   <h3>Bắt đầu</h3>
   <ul>
      <li><a href="#">Mẫu1</a></li>
      <li><a href="#">Mẫu2</a></li>
   </ul>
</div>

Điều này có thể hữu ích nếu bạn đang thiết lập một cơ sở kiến thức và có hàng chục chủ đề trong mỗi danh mục, với mỗi danh mục hiển thị trên trang riêng của nó.

Nhưng giả sử bạn muốn sắp xếp các mục theo danh mục và nhóm chúng dưới tên danh mục, mà không mã hóa cứng tên danh mục. Để đạt được điều này, bạn có thể sử dụng hai bộ lọc:

* `group_by`
* `sort`

Đây là mã để lấy danh sách các trang được nhóm dưới các tiêu đề danh mục tương ứng của chúng:

**Liquid**

{% raw %}

```liquid
{% assign mydocs = site.docs | group_by: 'category' %}
{% for cat in mydocs %}
<h2>{{ cat.name | capitalize }}</h2>
    <ul>
      {% assign items = cat.items | sort: 'order' %}
      {% for item in items %}
        <li><a href="{{ item.url }}">{{ item.title }}</a></li>
      {% endfor %}
    </ul>
{% endfor %}
```

{% endraw %}

**Kết quả**

<div class="highlight result" data-proofer-ignore>
   <h2>Getting-started</h2>
   <ul>
      <li><a href="#">Mẫu2</a></li>
      <li><a href="#">Mẫu1</a></li>
   </ul>
   <h2>Configuration</h2>
   <ul>
      <li><a href="#">Chủ đề2</a></li>
      <li><a href="#">Chủ đề1</a></li>
   </ul>
   <h2>Deployment</h2>
   <ul>
      <li><a href="#">Widget2</a></li>
      <li><a href="#">Widget1</a></li>
   </ul>
</div>

Hãy đi qua mã. Đầu tiên, chúng ta gán một biến (`mydocs`) cho nội dung bộ sưu tập (`site.docs`).

Bộ lọc `group_by` nhóm nội dung bộ sưu tập theo `category`. Cụ thể hơn, bộ lọc `group_by` chuyển đổi `mydocs` thành một mảng với các thuộc tính `name`, `items` và `size`, giống như thế này:

```json
[
  {"name": "getting-started", "items": [Mẫu 1, Mẫu 2],"size": 2},
  {"name": "configuration", "items": [Chủ đề 1, Chủ đề 2], "size": 2},
  {"name": "deployment", "items": [Widget 1, Widget 2], "size": 2}
]
```

Sử dụng `for cat in mydocs`, chúng ta xem qua từng mục trong mảng `mydocs` và in `name` danh mục.

Sau khi lấy tên danh mục, chúng ta gán biến `items` cho các tài liệu và sử dụng bộ lọc `sort` để sắp xếp các tài liệu theo thuộc tính `order` của chúng. Ký hiệu dấu chấm `cat.items` được sử dụng vì chúng ta đang truy cập nội dung trong mảng `items`. Bộ lọc `sort` sắp xếp các mục theo số của chúng theo thứ tự tăng dần.

Vòng lặp `for item in items` xem qua từng `item` và lấy `title` và `url` để tạo liên kết mục danh sách.

Để biết thêm chi tiết về bộ lọc `group_by`, hãy xem [Tài liệu Templates của Jekyll](https://jekyllrb.com/docs/templates/) cũng như [hướng dẫn Siteleaf này](https://www.siteleaf.com/blog/advanced-liquid-group-by/). Để biết thêm chi tiết về bộ lọc `sort`, hãy xem [sort](https://shopify.github.io/liquid/filters/sort/) trong tài liệu của Liquid.

Cho dù bạn sử dụng các thuộc tính trong front matter của tài liệu để lấy các trang của mình hay một tệp dữ liệu YAML, trong cả hai trường hợp, bạn có thể xây dựng điều hướng mạnh mẽ hơn theo chương trình cho trang web của mình.

## Kịch bản 9: Điều hướng cây lồng nhau với đệ quy

Giả sử bạn muốn một điều hướng cây lồng nhau với độ sâu bất kỳ. Chúng ta có thể đạt được điều này bằng cách lặp đệ quy qua cây liên kết điều hướng của chúng ta.

**YAML**

```yaml
nav:
  - title: Triển khai
    url: deployment.html
    subnav:
      - title: Heroku
        url: heroku.html
        subnav:
          - title: Jekyll trên Heroku
            url: jekyll-on-heroku.html
  - title: Trợ giúp
    url: help.html
```

**Liquid**

Đầu tiên, chúng ta sẽ tạo một include mà chúng ta có thể sử dụng để hiển thị cây điều hướng. Tệp này sẽ là `_includes/nav.html`

{% raw %}

```liquid
<ul>
  {% for item in include.nav %}
    <li><a href="{{ item.url }}">{{ item.title }}</a>
      {% if item.subnav %}
        {% include nav.html nav=item.subnav %}
      {% endif %}
    </li>
  {% endfor %}
</ul>
```

{% endraw %}

Để hiển thị điều này trong bố cục hoặc trang của bạn, bạn chỉ cần bao gồm template và chuyển tham số `nav`. Trong trường hợp này, chúng ta sẽ sử dụng `page.nav` để lấy nó từ yaml frontmatter.

{% raw %}

```liquid
{% include nav.html nav=page.nav %}
```

{% endraw %}

Include của chúng ta sẽ sử dụng cái này trước, sau đó xem qua từng mục để tìm thuộc tính `subnav` để hiển thị đệ quy các danh sách lồng nhau.

**Kết quả**
<div class="highlight result" data-proofer-ignore>
   <ul>
      <li><a href="#">Triển khai</a></li>
      <ul>
        <li><a href="#">Heroku</a></li>
        <ul>
          <li><a href="#">Jekyll Trên Heroku</a></li>
        </ul>
      </ul>
      <li><a href="#">Trợ giúp</a></li>
   </ul>
</div>
