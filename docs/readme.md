# Trang tài liệu Jekyll

Thư mục này chứa mã nguồn cho trang tài liệu Jekyll, [jekyllrb.com](https://jekyllrb.com/).

## Đóng góp

Để biết thông tin về cách đóng góp, xem [Trang đóng góp](https://jekyllrb.com/docs/contributing/).

## Chạy cục bộ

Bạn có thể xem trước các đóng góp của mình trước khi mở một yêu cầu kéo (pull request) bằng cách chạy các lệnh sau từ trong thư mục:

1. `bundle install --without test test_legacy benchmark` # Cài đặt các phụ thuộc, bỏ qua nhóm test và benchmark
2. `bundle exec rake site:preview` # Chạy tác vụ rake để xem trước trang web

Rốt cuộc thì nó cũng chỉ là một trang Jekyll thôi mà! :wink:

## Cập nhật Font Awesome

1. Truy cập <https://icomoon.io/app/>
2. Chọn Import Icons và tải `icomoon-selection.json` lên
3. Chọn Generate Font → Download
4. Sao chép các tệp phông chữ và điều chỉnh CSS theo đường dẫn chúng ta sử dụng trong Jekyll
