Tính năng: Bộ nhớ đệm
  Là một nhà phát triển thích tạo plugin
  Tôi muốn có khả năng lưu trữ đệm một số khía cạnh nhất định qua nhiều lần build
  Và truy xuất các khía cạnh đã được lưu đệm khi cần

  Kịch bản: Thư mục Cache mặc định
    Giả sử tôi có trang "index.md" chứa nội dung "{{ site.title }}"
    Và tôi có file cấu hình với "title" được đặt thành "Hello World"
    Khi tôi chạy jekyll build
    Thì tôi nên nhận được trạng thái thoát bằng không
    Và thư mục .jekyll-cache nên tồn tại
    Và thư mục .jekyll-cache/Jekyll/Cache/Jekyll--Cache nên tồn tại
    Và thư mục _site nên tồn tại
    Và tôi nên thấy "<p>Hello World</p>" trong "_site/index.html"

  Kịch bản: Thư mục Cache tùy chỉnh
    Giả sử tôi có trang "index.md" chứa nội dung "{{ site.title }}"
    Và tôi có file cấu hình với:
      | key       | value       |
      | title     | Hello World |
      | cache_dir | .foo-cache  |
    Khi tôi chạy jekyll build
    Thì tôi nên nhận được trạng thái thoát bằng không
    Và thư mục .foo-cache nên tồn tại
    Và thư mục .foo-cache/Jekyll/Cache/Jekyll--Cache nên tồn tại
    Nhưng thư mục .jekyll-cache không nên tồn tại
    Và thư mục _site nên tồn tại
    Và tôi nên thấy "<p>Hello World</p>" trong "_site/index.html"

  Kịch bản: Sử dụng đĩa trong chế độ an toàn
    Giả sử tôi có trang "index.md" chứa nội dung "{{ site.title }}"
    Và tôi có file cấu hình với "title" được đặt thành "Hello World"
    Khi tôi chạy jekyll build --safe
    Thì tôi nên nhận được trạng thái thoát bằng không
    Nhưng thư mục .jekyll-cache không nên tồn tại
    Và thư mục _site nên tồn tại
    Và tôi nên thấy "<p>Hello World</p>" trong "_site/index.html"

  Kịch bản: Vô hiệu hóa sử dụng đĩa trong chế độ không an toàn
    Giả sử tôi có trang "index.md" chứa nội dung "{{ site.title }}"
    Và tôi có file cấu hình với "title" được đặt thành "Hello World"
    Khi tôi chạy jekyll build --disable-disk-cache
    Thì tôi nên nhận được trạng thái thoát bằng không
    Và thư mục _site nên tồn tại
    Và tôi nên thấy "<p>Hello World</p>" trong "_site/index.html"
    Nhưng thư mục .jekyll-cache không nên tồn tại
