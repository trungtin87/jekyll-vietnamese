Tính năng: Cấu hình và sử dụng plugin
  Là một hacker
  Tôi muốn chỉ định các plugin của riêng mình có thể sửa đổi hành vi của Jekyll

  Kịch bản: Thêm một plugin dựa trên gem
    Giả sử tôi có file "index.html" chứa nội dung "Whatever"
    Và tôi có file cấu hình với "plugins" được đặt thành "[jekyll_test_plugin]"
    Khi tôi chạy jekyll build
    Thì tôi nên nhận được trạng thái thoát bằng không
    Và thư mục _site nên tồn tại
    Và tôi nên thấy "Whatever" trong "_site/index.html"
    Và tôi nên thấy "this is a test" trong "_site/test.txt"

  Kịch bản: Thêm danh sách trắng rỗng để hạn chế tất cả các gem
    Giả sử tôi có file "index.html" chứa nội dung "Whatever"
    Và tôi có file cấu hình với:
      | key       | value                |
      | plugins   | [jekyll_test_plugin] |
      | whitelist | []                   |
    Khi tôi chạy jekyll build --safe
    Thì tôi nên nhận được trạng thái thoát bằng không
    Và thư mục _site nên tồn tại
    Và tôi nên thấy "Whatever" trong "_site/index.html"
    Và file "_site/test.txt" không nên tồn tại

  Kịch bản: Thêm danh sách trắng để hạn chế một số gem nhưng cho phép các gem khác
    Giả sử tôi có file "index.html" chứa nội dung "Whatever"
    Và tôi có file cấu hình với:
      | key       | value                                              |
      | plugins   | [jekyll_test_plugin, jekyll_test_plugin_malicious] |
      | whitelist | [jekyll_test_plugin]                               |
    Khi tôi chạy jekyll build --safe
    Thì tôi nên nhận được trạng thái thoát bằng không
    Và thư mục _site nên tồn tại
    Và tôi nên thấy "Whatever" trong "_site/index.html"
    Và file "_site/test.txt" nên tồn tại
    Và tôi nên thấy "this is a test" trong "_site/test.txt"
