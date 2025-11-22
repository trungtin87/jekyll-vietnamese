---
title:  Sử dụng Dòng lệnh (Command Line Usage)
permalink: /docs/usage/
---

Gem Jekyll làm cho một tệp thực thi `jekyll` có sẵn cho bạn trong terminal của bạn.

Chương trình `jekyll` có một số lệnh nhưng cấu trúc luôn là:

```
jekyll command [argument] [option] [argument_to_option]

Examples:
    jekyll new site/ --blank
    jekyll serve --config _alternative_config.yml
```

Thông thường bạn sẽ sử dụng `jekyll serve` trong khi phát triển cục bộ và `jekyll build` khi bạn cần tạo trang web cho sản xuất.

Để có danh sách đầy đủ các tùy chọn và đối số của chúng, hãy xem [Tùy chọn Lệnh Build](/docs/configuration/options/#build-command-options).

Dưới đây là một số lệnh phổ biến nhất:

* `jekyll new PATH` - Tạo một trang web Jekyll mới với chủ đề dựa trên gem mặc định tại đường dẫn được chỉ định. Các thư mục sẽ được tạo khi cần thiết.
* `jekyll new PATH --blank` - Tạo một khung trang web Jekyll trống mới tại đường dẫn được chỉ định.
* `jekyll build` hoặc `jekyll b` - Thực hiện một lần xây dựng trang web của bạn vào `./_site` (theo mặc định).
* `jekyll serve` hoặc `jekyll s` - Xây dựng trang web của bạn bất cứ khi nào tệp nguồn thay đổi và phục vụ nó cục bộ.
* `jekyll clean` - Xóa tất cả các tệp đã tạo: thư mục đích, tệp siêu dữ liệu, bộ nhớ đệm Sass và Jekyll.
* `jekyll help` - Hiển thị trợ giúp, tùy chọn cho một lệnh con nhất định, ví dụ: `jekyll help build`.
* `jekyll new-theme` - Tạo một khung chủ đề Jekyll mới.
* `jekyll doctor` - Xuất ra bất kỳ vấn đề nào về việc ngừng sử dụng hoặc cấu hình.

Để thay đổi hành vi xây dựng mặc định của Jekyll, hãy xem qua các [tùy chọn cấu hình](/docs/configuration/).
