---
title: "Hợp nhất một Yêu cầu Kéo"
---

**Hướng dẫn này dành cho những người duy trì.** Những người đặc biệt này có **quyền ghi** vào một hoặc nhiều kho lưu trữ của Jekyll và giúp hợp nhất các đóng góp của người khác. Bạn có thể thấy những gì được viết ở đây thú vị, nhưng nó chắc chắn không dành cho tất cả mọi người.
{: .note .info}

## Xem xét Mã

Tất cả các yêu cầu kéo nên được xem xét mã. Xem xét mã là một [giá trị nền tảng](https://blog.fullstory.com/what-we-learned-from-google-code-reviews-arent-just-for-catching-bugs/) của các đội kỹ thuật tốt. Ngoài việc cung cấp xác nhận về tính chính xác, nó thúc đẩy ý thức cộng đồng và giúp những người duy trì khác hiểu về tất cả các phần của cơ sở mã. Tóm lại, xem xét mã là rất quan trọng đối với một dự án mã nguồn mở lành mạnh.

**Đọc hướng dẫn của chúng tôi về [Xem xét một yêu cầu kéo](../reviewing-a-pull-request/) trước khi hợp nhất.** Đáng chú ý, thay đổi phải có các bài kiểm tra nếu dành cho mã, và ít nhất hai người duy trì phải đồng ý.

## Hợp nhất

Chúng tôi có [một bot nhỏ hữu ích](https://github.com/jekyllbot) mà chúng tôi sử dụng để hợp nhất các yêu cầu kéo. Chúng tôi không sử dụng giao diện GitHub.com vì hai lý do:

1. Bạn không thể sửa đổi bất cứ điều gì trên thiết bị di động (ví dụ: tiêu đề, nhãn)
2. Chúng tôi muốn cung cấp một dấu vết giấy tờ nhất quán trong tệp `History.markdown` cho mỗi bản phát hành

Để hợp nhất một yêu cầu kéo, hãy để lại nhận xét cảm ơn người đóng góp, sau đó thêm yêu cầu hợp nhất đặc biệt:

```
Thank you very much for your contribution. Folks like you make this project and community strong. :heart:

@jekyllbot: merge +dev
```

Yêu cầu hợp nhất bao gồm ba điều:

1. `@jekyllbot:` – đây là tiền tố mà bot của chúng tôi tìm kiếm khi xử lý các lệnh
2. `merge` – lệnh
3. `+dev` – danh mục mà các thay đổi thuộc về.

Các danh mục khớp với các tiêu đề trong tệp `History.markdown`, và chúng là:

1. Cải tiến Chính (`+major`) – cập nhật lớn hoặc thay đổi phá vỡ mã đòi hỏi tăng phiên bản chính (v3 ~> v4)
2. Cải tiến Nhỏ (`+minor`) – cập nhật nhỏ (với các nhãn `feature` hoặc `enhancement`) đòi hỏi tăng phiên bản nhỏ (v3.1 ~> v3.2)
3. Sửa Lỗi (`+bug`) – sửa chữa mã không thay đổi hoặc thêm chức năng, đòi hỏi tăng phiên bản vá (v3.1.0 ~> v3.1.1)
4. Tài liệu (`+doc`) - thay đổi tài liệu được tìm thấy trong `docs/_docs/`
5. Cải tiến Trang web (`+site`) – thay đổi nguồn của [https://jekyllrb.com](https://jekyllrb.com) được tìm thấy trong `docs/`
6. Sửa lỗi Phát triển (`+dev`) – thay đổi không ảnh hưởng đến chức năng hoặc tài liệu hướng tới người dùng, chẳng hạn như sửa lỗi kiểm tra hoặc tăng các phụ thuộc nội bộ
7. Cổng chuyển tiếp (`+port`) — sửa lỗi được áp dụng cho phiên bản trước của Jekyll được kéo vào `master`, ví dụ: các cam kết được chọn lọc từ `3-1-stable` sang `master`

Khi @jekyllbot đã hợp nhất yêu cầu kéo, bạn sẽ thấy ba điều:

1. Một hợp nhất thành công
2. Thêm các nhãn cho danh mục cần thiết nếu chúng chưa được áp dụng
3. Một cam kết vào tệp `History.markdown` thêm ghi chú về thay đổi

Nếu bạn quên danh mục, điều đó vẫn ổn. Bạn luôn có thể quay lại và di chuyển dòng đến tiêu đề danh mục thích hợp sau này. Danh mục luôn cần thiết cho `jekyll/jekyll`, nhưng nhiều plugin có quá ít thay đổi để cần các danh mục nhật ký thay đổi.

## Vui mừng

Bạn đã làm được! Cảm ơn vì đã là người duy trì cho một trong những dự án Jekyll chính thức của chúng tôi. Công việc của bạn có ý nghĩa to lớn đối với hàng ngàn người dùng của chúng tôi, những người dựa vào Jekyll hàng ngày. :heart:
