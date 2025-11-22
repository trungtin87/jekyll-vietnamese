---
title: Bắt đầu nhanh
permalink: /docs/
redirect_from:
  - /docs/home/
  - /docs/quickstart/
  - /docs/extras/
---
Jekyll là một trình tạo trang tĩnh. Nó lấy văn bản được viết bằng ngôn ngữ đánh dấu yêu thích của bạn và sử dụng các bố cục (layouts) để tạo ra một trang web tĩnh. Bạn có thể tinh chỉnh giao diện của trang web, URL, dữ liệu hiển thị trên trang và nhiều thứ khác.

## Điều kiện tiên quyết

Jekyll yêu cầu những thứ sau:

* Ruby phiên bản **{{ site.data.ruby.min_version }}** hoặc cao hơn
* RubyGems
* GCC và Make

Xem [Yêu cầu]({{ '/docs/installation/#requirements' | relative_url }}) để biết hướng dẫn và chi tiết.

## Hướng dẫn

1. Cài đặt tất cả [các điều kiện tiên quyết]({{ '/docs/installation/' | relative_url }}).
2. Cài đặt jekyll và bundler [gems]({{ '/docs/ruby-101/#gems' | relative_url }}).

```sh
gem install jekyll bundler # Cài đặt jekyll và bundler gems
```

3. Tạo một trang Jekyll mới tại `./myblog`.

```sh
jekyll new myblog # Tạo trang Jekyll mới tại ./myblog
```

4. Chuyển vào thư mục mới của bạn.

```sh
cd myblog # Chuyển vào thư mục mới
```

5. Xây dựng trang web và làm cho nó khả dụng trên máy chủ cục bộ.

```sh
bundle exec jekyll serve # Xây dựng trang web và phục vụ trên máy chủ cục bộ
```

6. Truy cập [http://localhost:4000](http://localhost:4000){:target="_blank"}

{: .note .warning}
Nếu bạn đang sử dụng Ruby phiên bản 3.0.0 hoặc cao hơn, bước 5 [có thể thất bại](https://github.com/github/pages-gem/issues/752). Bạn có thể sửa nó bằng cách thêm `webrick` vào các phụ thuộc của mình: `bundle add webrick`

{: .note .info}
Truyền tùy chọn `--livereload` cho `serve` để tự động làm mới trang với mỗi thay đổi bạn thực hiện đối với các tệp nguồn: `bundle exec jekyll serve --livereload`

Nếu bạn gặp bất kỳ lỗi nào trong quá trình này, hãy kiểm tra xem bạn đã cài đặt tất cả các điều kiện tiên quyết trong [Yêu cầu]({{ '/docs/installation/#requirements' | relative_url }}) chưa.
Nếu bạn vẫn gặp vấn đề, xem [Khắc phục sự cố]({{ '/docs/troubleshooting/#configuration-problems' | relative_url }}).

{: .note .info}
Việc cài đặt thay đổi tùy theo hệ điều hành của bạn. Xem [hướng dẫn]({{ '/docs/installation/#guides' | relative_url }}) của chúng tôi để biết hướng dẫn cụ thể cho từng hệ điều hành.
