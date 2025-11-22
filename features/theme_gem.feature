Tính năng: Xây dựng Theme Gem
  Là một hacker thích chia sẻ chuyên môn của mình
  Tôi muốn có khả năng tạo một rubygem chính thống từ theme của mình
  Để chia sẻ kỹ năng phong cách tuyệt vời của tôi với các Jekyllite khác

  Kịch bản: Tạo một Jekyll Theme mới
    Khi tôi chạy jekyll new-theme my-cool-theme
    Thì tôi nên nhận được trạng thái thoát bằng không
    Và thư mục my-cool-theme nên tồn tại

  Kịch bản: Kiểm tra xem một Theme gem chính thống có được build từ scaffolding được tạo không
    Khi tôi chạy jekyll new-theme my-cool-theme
    Thì thư mục my-cool-theme nên tồn tại
    Khi tôi quyết định build theme gem
    Thì file "_includes/blank.html" nên tồn tại
    Thì file "_sass/blank.scss" nên tồn tại
    Thì file "assets/blank.scss" nên tồn tại
    Khi tôi chạy git add .
    Thì tôi nên nhận được git index đã cập nhật
    Khi tôi chạy gem build --force my-cool-theme.gemspec
    Thì file "./my-cool-theme-0.1.0.gem" nên tồn tại
    Khi tôi chạy gem unpack my-cool-theme-0.1.0.gem
    Thì thư mục my-cool-theme-0.1.0 nên tồn tại
    Và file "my-cool-theme-0.1.0/_layouts/default.html" nên tồn tại
    Và file "my-cool-theme-0.1.0/_includes/blank.html" nên tồn tại
    Và file "my-cool-theme-0.1.0/_sass/blank.scss" nên tồn tại
    Và file "my-cool-theme-0.1.0/assets/blank.scss" nên tồn tại
    Và file "my-cool-theme-0.1.0/_config.yml" nên tồn tại
    Và thư mục my-cool-theme-0.1.0/.git không nên tồn tại
    Và file "my-cool-theme-0.1.0/.gitignore" không nên tồn tại
    Và file "my-cool-theme-0.1.0/Gemfile" không nên tồn tại
    Và file "my-cool-theme-0.1.0/my-cool-theme.gemspec" không nên tồn tại
