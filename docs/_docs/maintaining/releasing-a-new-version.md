---
title: "Phát hành phiên bản mới"
---

**Hướng dẫn này dành cho những người duy trì.** Những người đặc biệt này có **quyền ghi** vào một hoặc nhiều kho lưu trữ của Jekyll và giúp hợp nhất các đóng góp của người khác. Bạn có thể thấy những gì được viết ở đây thú vị, nhưng nó chắc chắn không dành cho tất cả mọi người.
{: .note .info}

Điều quan trọng nhất cần hiểu trước khi thực hiện phát hành là không cần phải cảm thấy lo lắng. Hầu hết mọi thứ đều có thể hoàn tác, và ngay cả khi bạn xuất bản một phiên bản gem không hoàn chỉnh, chúng tôi luôn có thể bỏ qua phiên bản đó. Đừng ngần ngại liên hệ với những người duy trì khác nếu bạn cảm thấy không chắc chắn hoặc không biết phải làm gì tiếp theo.

### Tăng phiên bản

Nơi quan trọng duy nhất bạn cần tăng phiên bản thủ công là trong `lib/jekyll/version.rb`. Điều chỉnh nó, và mọi thứ khác sẽ hoạt động tốt.

Phiên bản chủ yếu sẽ có định dạng `"major.minor.patch"`. Đôi khi, chúng tôi có thể quyết định gửi các bản phát hành trước sẽ có định dạng `"major.minor.patch.suffix"`. `suffix` không được chuẩn hóa và có thể là bất cứ thứ gì như `pre.alpha1`, `pre.rc2`, hoặc đơn giản là `beta3`, v.v.

Để xác định phiên bản chính xác, hãy tham khảo phần `## HEAD` của tài liệu lịch sử của chúng tôi, `History.markdown`, trước tiên.

- Nếu có một tiểu mục có tiêu đề `Major Enhancements`
  - Tăng thành phần `major` của chuỗi phiên bản và đặt lại cả hai thành phần `minor` và `patch` về `0`.
  - Thêm `suffix` nếu có.
  - Ví dụ, `"3.9.1" => "4.0.0"` hoặc, `"3.9.1 => "4.0.0.alpha1"`.
  - Chuyển sang bước tiếp theo trong quy trình phát hành.

- Nếu có một tiểu mục có tiêu đề `Minor Enhancements`
  - Chỉ tăng thành phần `minor` và đặt lại thành phần vá về `0`.
  - Thêm `suffix` nếu có.
  - Ví dụ, `"4.0.2" => "4.1.0"` hoặc `"4.1.0" => "4.2.0.pre"`.
  - Chuyển sang bước tiếp theo trong quy trình phát hành.

- Đối với bất kỳ điều gì khác, chỉ tăng thành phần `patch` hoặc thành phần `suffix` nếu có. Ví dụ, `"4.0.2" => "4.0.3"` hoặc `"4.1.0.beta3" => "4.1.0.rc"`.

### Viết bài đăng phát hành

Trong trường hợp điều này chưa được thực hiện, bạn có thể tạo một khung bài đăng phát hành mới bằng cách sử dụng lệnh `rake` đi kèm:

```sh
bundle exec rake site:releases:new[3.8.0]
```

trong đó `3.8.0` nên được thay thế bằng phiên bản mới.

Sau đó, viết bài đăng. Hãy chắc chắn cảm ơn tất cả các cộng tác viên và người duy trì đã đóng góp kể từ lần phát hành cuối cùng. Bạn có thể tạo nhật ký tên của họ bằng lệnh sau:

```sh
git shortlog -sn master...v3.7.2
```

trong đó `v3.7.2` là thẻ git cho bản phát hành trước đó. Trong trường hợp thẻ không tồn tại trong kho lưu trữ của bạn, hãy chạy:

```sh
git pull
```

Hãy chắc chắn mở một yêu cầu kéo cho bài đăng phát hành của bạn sau khi hoàn thành.

### Cập nhật tài liệu Lịch sử

Thay thế tiêu đề đầu tiên của `History.markdown` bằng một cột mốc phiên bản. Điều này trông giống như sau:

```diff
- ## HEAD
+ ## 3.7.1 / 2018-01-25
```

Điều chỉnh số phiên bản và ngày tháng. Tiêu đề `## HEAD` sẽ được tạo lại vào lần tới khi một yêu cầu kéo được hợp nhất.

Sắp xếp lại các tiểu mục (như một tổng thể) dựa trên mức độ ưu tiên giảm dần như minh họa bên dưới:

```
## 4.2.0 / 2020-12-14

### Major Enhancements

...

### Minor Enhancements

...

### Bug Fixes

...

### Security Fixes

...

### Optimization Fixes

...

### Development Fixes

...

### Site Enhancements

...
```

Khi bạn đã làm điều này, hãy cập nhật trang web bằng cách chạy lệnh sau:

```sh
bundle exec rake site:generate
```

Điều này cập nhật nhật ký thay đổi của trang web, và đẩy các phiên bản ở nhiều nơi khác.

Bạn nên xem lại tệp `History.markdown` thủ công một lần nữa, trong trường hợp có bất kỳ lỗi chính tả hoặc tương tự. Hãy thoải mái sửa những lỗi đó thủ công, và sau khi bạn hoàn tất việc tạo nhật ký thay đổi trang web, hãy cam kết các thay đổi của bạn.

### Đẩy phiên bản

Trước khi bạn thực hiện bước này, hãy đảm bảo những điều sau đã được thực hiện:

- Một bài đăng phát hành đã được chuẩn bị, và lý tưởng nhất là đã hoạt động thông qua một yêu cầu kéo trước đó.
- Tất cả các bước trước đó đã được thực hiện, đặc biệt là thay đổi đối với `lib/jekyll/version.rb` đã được dàn dựng để cam kết.
- Cam kết các thay đổi đã dàn dựng vào nhánh `master` cục bộ tốt nhất là với thông điệp cam kết `"Release :gem: v[CURRENT_VERSION]"`.

Điều duy nhất còn lại phải làm bây giờ là chạy lệnh này:

```sh
git push upstream master
```

trong đó `upstream` tham chiếu đến `git@github.com:jekyll/jekyll.git`.

Điều này sẽ kích hoạt quy trình làm việc GitHub Actions sẽ tự động xây dựng gem mới, gắn thẻ cam kết phát hành, đẩy thẻ lên GitHub và sau đó cuối cùng, đẩy gem mới lên RubyGems. Đừng lo lắng về việc tạo bản phát hành GitHub, @jekyllbot sẽ lo việc đó khi quy trình làm việc phát hành xuất bản thẻ mới.

Và sau đó, nếu quy trình làm việc đã hoàn thành thành công, bạn đã hoàn tất! :tada:
Hãy thoải mái ăn mừng!

Nếu bạn có quyền truy cập vào tài khoản Twitter [@jekyllrb](https://twitter.com/jekyllrb), bạn nên tweet bài đăng phát hành từ đó. Nếu không, chỉ cần nhờ người duy trì khác làm việc đó hoặc cấp cho bạn quyền truy cập.

### Xây dựng tài liệu

Chúng tôi đóng gói tài liệu của mình dưới dạng :gem: Gem để sử dụng ngoại tuyến.

Điều này được thực hiện với kho lưu trữ [**jekyll-docs**](https://github.com/jekyll/jekyll-docs#building), và các hướng dẫn chi tiết hơn được cung cấp ở đó.

## Đối với các gem không phải cốt lõi

Nếu bạn không phải là người duy trì cho `jekyll/jekyll`, quy trình đơn giản hơn nhiều trong rất nhiều trường hợp. Nói chung, quy trình vẫn trông giống như thế này:

- Tăng phiên bản gem thủ công, thường là trong `lib/<plugin_name>/version.rb`
- Điều chỉnh tệp lịch sử
- Cam kết thay đổi vào nhánh mặc định tốt nhất là với thông điệp `"Release :gem: v[CURRENT_VERSION]"`
- Đẩy lên kho lưu trữ từ xa
- Vui mừng

Hãy chắc chắn hỏi những người duy trì dự án của bạn nếu bạn không chắc chắn!
