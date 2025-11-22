Tính năng: Đóng gói file cấu hình với Theme gem
  Là một nhà phát triển web thích chia sẻ chuyên môn của mình
  Tôi muốn có khả năng cấu hình trước theme gemified của mình
  Để giúp các Jekyllite khác sử dụng theme của tôi dễ dàng hơn

  Kịch bản: Dễ dàng bắt đầu với theme được cấu hình sẵn
    Giả sử tôi có file cấu hình với "theme" được đặt thành "test-theme"
    Và tôi có trang "index.md" chứa nội dung "{{ site.test_theme.skin }}"
    Khi tôi chạy jekyll build
    Thì tôi nên nhận được trạng thái thoát bằng không
    Và thư mục _site nên tồn tại
    Và tôi nên thấy "aero" trong "_site/index.html"

  Kịch bản: Vô hiệu hóa hoàn toàn việc import cấu hình theme
    Giả sử tôi có file cấu hình với:
      | key                 | value      |
      | theme               | test-theme |
      | ignore_theme_config | true       |
    Và tôi có trang "index.md" chứa nội dung "{{ site.test_theme.skin }}"
    Khi tôi chạy jekyll build
    Thì tôi nên nhận được trạng thái thoát bằng không
    Và thư mục _site nên tồn tại
    Và tôi không nên thấy "aero" trong "_site/index.html"

  Kịch bản: Theme được cấu hình sẵn với file cấu hình hợp lệ ghi đè các mặc định của Jekyll
    Giả sử tôi có file cấu hình với "theme" được đặt thành "test-theme"
    Và tôi có trang "index.md" chứa nội dung "{{ site.baseurl }}"
    Và tôi có thư mục node_modules
    Và tôi có file "node_modules/alert.js" chứa nội dung "alert('foo');"
    Khi tôi chạy jekyll build
    Thì tôi nên nhận được trạng thái thoát bằng không
    Và thư mục _site nên tồn tại
    Và file "_site/index.html" nên tồn tại
    Nhưng file "_site/node_modules/alert.js" không nên tồn tại
    Và file "_site/extras/banner.html" không nên tồn tại
    Và tôi không nên thấy "/test-theme" trong "_site/index.html"
