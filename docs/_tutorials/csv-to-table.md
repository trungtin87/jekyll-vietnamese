---
title: Tạo Bảng từ Dữ liệu CSV
author: MichaelCurrin
date: 2020-04-01 20:30:00 +0200
---

Hướng dẫn này chỉ cho bạn cách sử dụng Jekyll để đọc CSV và hiển thị dữ liệu dưới dạng bảng HTML.

Cách tiếp cận này sẽ:

- sử dụng hàng đầu tiên của CSV làm tiêu đề bảng HTML.
- sử dụng các hàng còn lại cho phần thân của bảng.
- giữ nguyên thứ tự các cột từ CSV gốc.
- đủ linh hoạt để hoạt động với _bất kỳ_ CSV hợp lệ nào được tham chiếu.

Không cần chỉ định tên các cột là gì, hoặc có bao nhiêu cột.
Thủ thuật của hướng dẫn này là, khi chúng ta lặp qua dữ liệu hàng, chúng ta chọn _hàng đầu tiên_
và giải nén nó để chúng ta có thể lấy tên tiêu đề.

Làm theo các bước bên dưới để chuyển đổi một CSV mẫu của các tác giả thành một bảng HTML.

## 1. Tạo một CSV

Tạo một tệp CSV trong thư mục [Tệp dữ liệu]({{ '/docs/datafiles/' | relative_url }}) của bạn để
Jekyll sẽ nhận nó. Một đường dẫn mẫu và dữ liệu CSV được hiển thị bên dưới:

`_data/authors.csv`

```
First name,Last name,Age,Location
John,Doe,35,United States
Jane,Doe,29,France
Jack,Hill,25,Australia
```

Tệp dữ liệu đó bây giờ sẽ có sẵn trong Jekyll như thế này:

{% raw %}

```liquid
{{ site.data.authors }}
```

{% endraw %}

## 2. Thêm một bảng

Chọn một tệp HTML hoặc markdown nơi bạn muốn bảng của mình được hiển thị.

Ví dụ: `table_test.md`

```yaml
---
title: Kiểm tra bảng
---
```

### Kiểm tra một hàng

Lấy hàng đầu tiên và xem nó trông như thế nào bằng cách sử dụng bộ lọc `inspect`.

{% raw %}

```liquid
{% assign row = site.data.authors[0] %}
{{ row | inspect }}
```

{% endraw %}

Kết quả sẽ là một _hash_ (một đối tượng bao gồm các cặp khóa-giá trị) trông như thế này:

```ruby
{
  "First name"=>"John",
  "Last name"=>"Doe",
  "Age"=>"35",
  "Location"=>"United States"
}
```

Lưu ý rằng Jekyll _thực sự_ giữ nguyên thứ tự ở đây, dựa trên CSV gốc.

### Giải nén một hàng

Một giải pháp đơn giản sẽ là mã hóa cứng tên trường khi tra cứu giá trị hàng theo khóa.

{% raw %}

```liquid
{{ row["First name"] }}
{{ row["Last name"] }}
```

{% endraw %}

Nhưng chúng tôi thích một giải pháp sẽ hoạt động cho _bất kỳ_ CSV nào, mà không cần chỉ định tên cột trước.
Vì vậy, chúng ta lặp qua đối tượng `row` bằng vòng lặp `for`:

{% raw %}

```liquid
{% assign row = site.data.authors[0] %}
{% for pair in row %}
  {{ pair | inspect }}
{% endfor %}
```

{% endraw %}

Điều này tạo ra như sau. Lưu ý mục đầu tiên trong mỗi cặp là _khóa_ và mục thứ hai sẽ là
_giá trị_.

```
["First name", "John"]
["Last name", "Doe"]
["Age", "35"]
["Location", "United States"]
```

### Tạo hàng tiêu đề bảng

Ở đây chúng ta tạo một bảng với một hàng bảng duy nhất (`tr`), được tạo thành từ các thẻ tiêu đề bảng (`th`). Chúng ta tìm
tên tiêu đề bằng cách lấy phần tử đầu tiên (tại chỉ mục `0`) từ `pair`. Chúng ta bỏ qua phần tử thứ hai
vì chúng ta chưa cần giá trị.

{% raw %}

```liquid
<table>
  {% for row in site.data.authors %}
    {% if forloop.first %}
    <tr>
      {% for pair in row %}
        <th>{{ pair[0] }}</th>
      {% endfor %}
    </tr>
    {% endif %}
  {% endfor %}
</table>
{% endraw %}
```

Hiện tại, chúng ta không hiển thị bất kỳ nội dung nào từ hàng thứ hai trở đi. Chúng ta đạt được điều này bằng cách sử dụng
`forloop.first`, vì điều này sẽ trả về true cho hàng _đầu tiên_ và false nếu không.

### Thêm các hàng dữ liệu bảng

Trong phần này, chúng ta thêm các hàng dữ liệu vào bảng. Bây giờ, chúng ta sử dụng phần tử thứ hai của `pair`
để tìm giá trị.

Để thuận tiện, chúng ta hiển thị bằng thẻ `tablerow` - điều này hoạt động giống như vòng lặp `for`, nhưng
dữ liệu bên trong sẽ được hiển thị với các thẻ HTML `tr` và `td` cho chúng ta. Thật không may, không có tương đương cho
hàng tiêu đề, vì vậy chúng ta phải viết ra đầy đủ, như trong phần trước.

{% raw %}

```liquid
---
title: Kiểm tra bảng
---

<table>
  {% for row in site.data.authors %}
    {% if forloop.first %}
    <tr>
      {% for pair in row %}
        <th>{{ pair[0] }}</th>
      {% endfor %}
    </tr>
    {% endif %}

    {% tablerow pair in row %}
      {{ pair[1] }}
    {% endtablerow %}
  {% endfor %}
</table>
```

{% endraw %}

Với mã ở trên, bảng hoàn chỉnh sẽ trông như thế này:

<table>
  <tr>
    <th>First name</th>
    <th>Last name</th>
    <th>Age</th>
    <th>Location</th>
  </tr>
  <tr>
    <td>John</td>
    <td>Doe</td>
    <td>35</td>
    <td>United States</td>
  </tr>
  <tr>
    <td>Jane</td>
    <td>Doe</td>
    <td>29</td>
    <td>France</td>
  </tr>
  <tr>
    <td>Jack</td>
    <td>Hill</td>
    <td>25</td>
    <td>Australia</td>
  </tr>
</table>

Vậy là xong - bây giờ bạn có thể chuyển CSV thành bảng HTML bằng Jekyll.

## Các bước tiếp theo

- Thay đổi tên trường trong CSV.
- Chọn một CSV khác.
- Thêm kiểu CSS vào bảng của bạn.
- Hiển thị bảng bằng tệp đầu vào JSON hoặc YAML.
