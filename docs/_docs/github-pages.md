---
title: GitHub Pages
permalink: /docs/github-pages/
---

[GitHub Pages](https://pages.github.com) là các trang web công khai cho người dùng,
tổ chức và kho lưu trữ, được lưu trữ miễn phí trên miền `github.io` của GitHub
hoặc trên một tên miền tùy chỉnh do bạn chọn. GitHub Pages được vận hành bởi
Jekyll ở hậu trường, vì vậy chúng là một cách tuyệt vời để lưu trữ trang web
được hỗ trợ bởi Jekyll của bạn miễn phí.

Trang web của bạn được tạo tự động bởi GitHub Pages khi bạn đẩy các tệp nguồn
của mình. Lưu ý rằng GitHub Pages hoạt động tốt như nhau đối với nội dung HTML thông thường,
đơn giản vì Jekyll coi các tệp không có front matter là tài sản tĩnh.
Vì vậy, nếu bạn chỉ cần đẩy HTML đã tạo, bạn đã sẵn sàng mà không cần bất kỳ
thiết lập nào thêm.

[Tài liệu GitHub Pages](https://docs.github.com/en/free-pro-team@latest/github/working-with-github-pages)
rất toàn diện và bao gồm [hướng dẫn thiết lập trang web GitHub Pages sử dụng
Jekyll](https://docs.github.com/en/free-pro-team@latest/github/working-with-github-pages/setting-up-a-github-pages-site-with-jekyll).
Chúng tôi khuyên bạn nên làm theo hướng dẫn này.

Trang này chứa một số thông tin bổ sung có thể hữu ích khi làm việc
trên các trang web GitHub Pages với Jekyll.

<div class="note">
  <h5>Tài liệu, Trợ giúp và Hỗ trợ GitHub Pages</h5>
  <p>
    Để biết thêm thông tin về những gì bạn có thể làm với GitHub Pages, cũng như các
    hướng dẫn khắc phục sự cố, bạn nên xem qua
    <a href="https://docs.github.com/en/free-pro-team@latest/github/working-with-github-pages">phần Trợ giúp Pages của GitHub</a>.
    Nếu mọi cách đều thất bại, bạn nên liên hệ với <a href="https://github.com/contact">Hỗ trợ GitHub</a>.
  </p>
</div>

### Cấu trúc URL Trang Dự án

Đôi khi thật tuyệt khi xem trước trang web Jekyll của bạn trước khi bạn đẩy nhánh `gh-pages`
của mình lên GitHub. Cấu trúc URL giống như thư mục con mà GitHub sử dụng cho
Trang Dự án làm phức tạp việc phân giải URL thích hợp. Để đảm bảo
trang web của bạn được xây dựng đúng cách, hãy sử dụng [bộ lọc URL]({{ '/docs/liquid/filters/' | relative_url }}) tiện dụng:

{% raw %}

```liquid
<!-- Đối với các kiểu có tên tĩnh... -->
<link href="{{ 'assets/css/style.css' | relative_url }}" rel="stylesheet">
<!-- Đối với các tài liệu/trang có URL có thể thay đổi... -->
[{{ page.title }}]("{{ page.url | relative_url }}")
```

{% endraw %}

Bằng cách này, bạn có thể xem trước trang web của mình cục bộ từ thư mục gốc của trang web trên localhost,
nhưng khi GitHub tạo các trang của bạn từ nhánh `gh-pages`, tất cả các URL
sẽ phân giải đúng cách.

## Triển khai Jekyll lên GitHub Pages

GitHub Pages hoạt động bằng cách xem xét các nhánh nhất định của kho lưu trữ trên GitHub.
Có hai loại cơ bản có sẵn: [trang người dùng/tổ chức và trang dự án](https://docs.github.com/en/free-pro-team@latest/github/working-with-github-pages/about-github-pages#types-of-github-pages-sites).
Cách triển khai hai loại trang web này gần như giống hệt nhau, ngoại trừ một
vài chi tiết nhỏ.

### Trang Người dùng và Tổ chức

Các trang người dùng và tổ chức nằm trong một kho lưu trữ GitHub đặc biệt dành riêng cho
chỉ các tệp GitHub Pages. Kho lưu trữ này phải được đặt tên theo tên tài khoản.
Ví dụ: [kho lưu trữ trang người dùng của @mojombo](https://github.com/mojombo/mojombo.github.io) có tên là
`mojombo.github.io`.

Nội dung từ nhánh `master` của kho lưu trữ của bạn sẽ được sử dụng để xây dựng và
xuất bản trang web GitHub Pages, vì vậy hãy đảm bảo trang web Jekyll của bạn được lưu trữ ở đó.

<div class="note info">
  <h5>Tên miền tùy chỉnh không ảnh hưởng đến tên kho lưu trữ</h5>
  <p>
    GitHub Pages ban đầu được cấu hình để sống dưới tên miền phụ
    <code>username.github.io</code>, đó là lý do tại sao các kho lưu trữ phải
    được đặt tên theo cách này <strong>ngay cả khi tên miền tùy chỉnh đang được sử dụng</strong>.
  </p>
</div>

### Trang Dự án

Không giống như Trang người dùng và tổ chức, Trang Dự án được giữ trong cùng một
kho lưu trữ với dự án mà chúng dành cho, ngoại trừ việc nội dung trang web được
lưu trữ trong một nhánh `gh-pages` được đặt tên đặc biệt hoặc trong thư mục `docs` trên
nhánh `master`. Nội dung sẽ được hiển thị bằng Jekyll và đầu ra
sẽ có sẵn dưới một đường dẫn con của tên miền phụ trang người dùng của bạn, chẳng hạn như
`username.github.io/project` (trừ khi tên miền tùy chỉnh được chỉ định).

Bản thân kho lưu trữ dự án Jekyll là một ví dụ hoàn hảo về cấu trúc nhánh này
—[nhánh master]({{ site.repository }}) chứa
dự án phần mềm thực tế cho Jekyll, và trang web Jekyll mà bạn đang
xem ngay bây giờ được chứa trong [thư mục docs]({{ site.repository }}/tree/master/docs) của cùng một kho lưu trữ.

Vui lòng tham khảo tài liệu chính thức của GitHub về
[trang người dùng, tổ chức và dự án](https://docs.github.com/en/free-pro-team@latest/github/working-with-github-pages/about-github-pages#types-of-github-pages-sites)
để xem thêm các ví dụ chi tiết.

<div class="note warning">
  <h5>Tệp nguồn phải nằm trong thư mục gốc</h5>
  <p>
    GitHub Pages <a href="https://help.github.com/en/github/working-with-github-pages/troubleshooting-jekyll-build-errors-for-github-pages-sites">ghi đè</a>
    giá trị cấu hình <a href="{{ '/docs/configuration/options/' | relative_url }}">“Site Source”</a>,
    vì vậy nếu bạn đặt các tệp của mình ở bất kỳ đâu khác ngoài
    thư mục gốc, trang web của bạn có thể không được xây dựng chính xác.
  </p>
</div>

<div class="note info">
  <h5>Cài đặt gem <code>github-pages</code> trên Windows</h5>

  <p>
    Mặc dù Windows không được hỗ trợ chính thức, nhưng vẫn có thể
    cài đặt gem <code>github-pages</code> trên Windows.
    Các hướng dẫn đặc biệt có thể được tìm thấy trên
    <a href="{{ '/docs/installation/windows/' | relative_url }}">trang tài liệu dành riêng cho Windows</a> của chúng tôi.
  </p>
</div>

### Chạy và Kiểm thử Cục bộ

Khi dự án được cấu hình với môi trường github-pages, khá khó để chuyển đổi qua lại giữa các cài đặt cục bộ và cài đặt cấp sản xuất. Vì vậy, chúng ta có thể sử dụng các tùy chọn CLI nhất định để quy trình làm việc không gặp rắc rối.

```sh
bundle exec jekyll serve --baseurl=""
```

Lệnh này sẽ chạy máy chủ jekyll trên máy cục bộ của bạn, tức là trên `http://localhost:4000`. Tham khảo <a href="{{ '/docs/configuration/options/#serve-command-options' | relative_url }}">tùy chọn máy chủ</a> để biết các tùy chọn có sẵn.
