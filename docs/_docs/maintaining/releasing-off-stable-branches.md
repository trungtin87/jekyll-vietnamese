---
title: Phát hành từ các nhánh ổn định cũ hơn
---

Ngoài việc cắt các bản phát hành từ nhánh `master` mặc định, Jekyll Core đôi khi có thể cắt các bản phát hành chứa các bản vá bảo mật và sửa lỗi quan trọng cho các phiên bản cũ hơn đang được bảo trì. Các bản phát hành như vậy được cắt từ các nhánh được đặt tên đặc biệt, theo mẫu `[x].[y]-stable` trong đó `[x]` biểu thị phiên bản chính semver và `[y]`, phiên bản phụ semver. Ví dụ, nhánh `3.9-stable` đề cập đến các cam kết được phát hành như một phần của loạt `jekyll-3.9.x`.

Việc phối hợp phát hành từ một nhánh `*-stable` rất phức tạp chủ yếu là do nhánh mặc định chắc chắn cũng phải phản ánh bản phát hành.

## Yêu cầu

- Người duy trì phải có **quyền ghi** vào cả hai nhánh `*-stable` liên quan và `master`.
- Người duy trì cần hoàn thành nhiệm vụ bằng cách sử dụng **chương trình CLI cục bộ** của họ thay vì gửi qua Giao diện người dùng Web GitHub.
- Người duy trì nắm rõ quy trình làm việc để [phát hành từ `master`]({{ 'docs/maintaining/releasing-a-new-version/' | relative_url }}). Quy trình được ghi lại trong phần sau là một bản chuyển thể rút gọn của quy trình làm việc cho `master`.
- Một bài đăng phát hành đã được soạn thảo và **đang chờ xuất bản lên `master`** thông qua một yêu cầu kéo đã được phê duyệt.
- Kết nối internet ổn định.

## Kích hoạt quy trình phát hành

1. Đảm bảo rằng bạn đã **kiểm tra nhánh `*-stable` liên quan** và được cập nhật với đối tác của nó tại `jekyll/jekyll` tại GitHub.
2. Tăng chuỗi `VERSION` trong `lib/jekyll/version.rb`.
3. Cập nhật **tài liệu Lịch sử** như được ghi lại [tại đây]({{ 'docs/maintaining/releasing-a-new-version/#update-the-history-document' | relative_url }}).<br/>
   (**QUAN TRỌNG: Tuy nhiên, không chạy `rake site:generate` trên nhánh ổn định**).
4. Sao chép toàn bộ phần Lịch sử liên quan đến bản phát hành hiện tại và dán vào tab / cửa sổ mới của trình soạn thảo văn bản của bạn. Chúng tôi sẽ sử dụng đoạn mã tạm thời này ở giai đoạn sau.
5. Cam kết các thay đổi đối với tệp phiên bản và tài liệu Lịch sử với thông điệp cam kết `Release :gem: v[CURRENT_VERSION]`.
6. Đẩy cam kết lên điều khiển từ xa ngược dòng `jekyll/jekyll` tại GitHub.

## Xuất bản bài đăng phát hành

1. Đảm bảo quy trình làm việc `Release Gem` đã hoàn thành thành công.
2. Hợp nhất yêu cầu kéo bài đăng phát hành vào `master`.

## Cập nhật nhánh mặc định để phản ánh phát hành từ nhánh ổn định

1. Tại địa phương, kiểm tra `master` và đảm bảo nó được cập nhật với đối tác từ xa của nó tại `jekyll/jekyll` tại GitHub.
2. Cập nhật tài liệu Lịch sử bằng cách sử dụng đoạn mã trong tab / cửa sổ tạm thời được tạo trước đó. Các phần khác nhau trong tài liệu Lịch sử chủ yếu theo thứ tự thời gian ngược và thứ hai là phạm vi phiên bản chính semver. Ví dụ, một phần phát hành cho `v3.9.2` sẽ được liệt kê phía trên phần cho `v3.9.1` nhưng dưới các phần phát hành cho v4.x.
   Đoạn mã đã lưu trữ trước đó phải được đưa vào đúng vị trí theo cách thủ công.
3. Tùy chọn, cập nhật chuỗi `VERSION` trong `lib/jekyll/version.rb`. (*Nếu phiên bản hiện tại nhỏ hơn phiên bản mới nhất*).
4. Bây giờ **chạy `rake site:generate`** để cập nhật các tệp meta khác nhau:
     - docs/_config.yml
     - docs/_docs/history.md
     - docs/latest_version.txt
5. Cam kết các thay đổi đối với các tệp meta khác nhau với thông điệp cam kết `Release :gem: v[CURRENT_VERSION]`.
6. Đẩy cam kết lên điều khiển từ xa ngược dòng.

## Xuất bản Bản phát hành GitHub

Không giống như các bản phát hành cắt từ nhánh `master`, JekyllBot của chúng tôi không tự động tạo và xuất bản Bản phát hành GitHub cho các thẻ được tạo từ các nhánh *không mặc định*. Do đó, người duy trì phải **tạo và xuất bản thủ công** Bản phát hành GitHub liên quan.

1. Chọn thẻ mới được đẩy.
2. Tiêu đề giống như tên của thẻ đã chọn.
3. Đoạn mã phát hành đã lưu trữ trước đó tạo thành phần thân.
4. Xóa tiêu đề của đoạn mã (`## x.y.z / YYYY-MM-DD`) khỏi phần thân phát hành.
5. Xuất bản.

Lưu ý: Bản phát hành GitHub có thể tùy chọn được *soạn thảo* trước khi cập nhật nhánh mặc định và sau đó *xuất bản* ngay sau khi đẩy cam kết cập nhật lên nhánh mặc định để hợp lý hóa quy trình.
