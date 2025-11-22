---
title: API Bộ nhớ đệm (Cache API)
author: pathawks
date: 2018-08-17 12:56:24 -0400
---

Jekyll bao gồm một API bộ nhớ đệm, được sử dụng cả nội bộ cũng như được công khai
cho các plugin, có thể được sử dụng để lưu vào bộ nhớ đệm đầu ra của các hàm xác định để
tăng tốc độ tạo trang web. Bộ nhớ đệm này sẽ tồn tại qua các lần xây dựng, nhưng
sẽ bị xóa khi Jekyll phát hiện bất kỳ thay đổi nào đối với `_config.yml`.

## Jekyll::Cache.new(name) → new_cache

Nếu đã có một bộ nhớ đệm được tạo với `name`, điều này sẽ trả về một
tham chiếu đến Cache hiện có đó. Nếu không, tạo một Cache mới có tên `name`.

Nếu Cache này sẽ được sử dụng bởi một plugin được đóng gói Gem, `name` nên là
tên của Gem, hoặc có tiền tố là tên của Gem theo sau bởi `::` (nếu một
plugin dự kiến sử dụng nhiều Cache). Nếu Cache này sẽ được sử dụng nội bộ bởi
Jekyll, `name` nên là tên của lớp đang sử dụng Cache (tức là:
`"Jekyll::Converters::Markdown"`).

Các đối tượng được lưu trong bộ nhớ đệm được chia sẻ giữa tất cả các Cache được tạo với cùng `name`, nhưng
_không_ được chia sẻ giữa các Cache có tên khác nhau. Có thể có một đối tượng
được lưu trữ với khóa `1` trong `Jekyll::Cache.new("a")` và một đối tượng được lưu trữ với khóa
`1` trong `Jekyll::Cache.new("b")` và những cái này sẽ không trỏ đến cùng một đối tượng
được lưu trong bộ nhớ đệm. Bằng cách này, bạn không cần đảm bảo rằng các khóa là duy nhất toàn cục.

## getset(key) {block}

Đây là cách phổ biến nhất để sử dụng Cache.

`block` là một đoạn mã mất nhiều thời gian để tính toán, nhưng luôn
tạo ra cùng một đầu ra cho một đầu vào cụ thể (như chuyển đổi Markdown thành
HTML). `key` là một `String` (hoặc một đối tượng có `to_s`) xác định duy nhất
đầu vào cho hàm.

Nếu `key` đã tồn tại trong Cache, nó sẽ được trả về và `block` sẽ không bao giờ
được thực thi. Nếu `key` không tồn tại trong Cache, `block` sẽ được thực thi và
kết quả sẽ được thêm vào Cache và được trả về.

```ruby
def cache
  @@cache ||= Jekyll::Cache.new("ConvertMarkdown")
end

def convert_markdown_to_html(markdown)
  cache.getset(markdown) do
    expensive_conversion_method(markdown)
  end
end
```

Trong ví dụ trên, `expensive_conversion_method` sẽ chỉ được gọi một lần cho
bất kỳ đầu vào `markdown` nào. Nếu `convert_markdown_to_html` được gọi lần thứ hai
với cùng đầu vào, đầu ra được lưu trong bộ nhớ đệm sẽ được trả về.

Vì các bài đăng thường sẽ không thay đổi từ lần xây dựng này sang lần xây dựng tiếp theo, đây
là một cách hiệu quả để tránh thực hiện cùng một phép tính mỗi khi trang web
được xây dựng.

## clear

Điều này sẽ xóa tất cả các đối tượng được lưu trong bộ nhớ đệm từ một Cache cụ thể. Cache sẽ
trống, cả trong bộ nhớ và trên đĩa.

### Các phương thức sau đây có thể sẽ chỉ được sử dụng trong các trường hợp đặc biệt

## cache[key] → value

Lấy `key` từ Cache và trả về `value` của nó. Gây ra lỗi nếu `key` không tồn tại
trong Cache.

## cache[key] = value

Thêm `value` vào Cache dưới `key`.
Không trả về gì.

## key?(key) → true hoặc false

Trả về `true` nếu `key` đã tồn tại trong Cache. False nếu không.

## delete(key)

Xóa `key` khỏi Cache.
Không trả về gì.
