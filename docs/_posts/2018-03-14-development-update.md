---
title: "Jekyll 4.0 đang ở phía chân trời!"
date: "2018-04-19 16:07:00 +0100"
author: oe
categories: [community]
---

Với việc phát hành Jekyll 3.8.0, đã 2 năm rưỡi kể từ bản phát hành chính cuối cùng. Jekyll 3.0.0 được phát hành vào cuối tháng 10 năm 2015! Đó là một thời gian dài trước đây, và chúng tôi đã làm việc hướng tới bản phát hành chính tiếp theo của Jekyll trong vài tháng nay. Đây là một bản xem trước nhỏ về những gì sắp tới:

- Ngừng hỗ trợ Ruby 2.1 và 2.2. Cả hai phiên bản đã đạt đến giai đoạn EOL của chúng.
- Ngừng Pygments như một phụ thuộc. Chúng tôi đã mặc định sử dụng Rouge, và điều này loại bỏ phụ thuộc Python ngầm định. (cuối cùng!)
- Làm cho thẻ `link` sử dụng URL tương đối. Đây là một thay đổi phá vỡ lớn, nhưng đó là giải pháp sạch hơn.

Tuy nhiên, chúng tôi cởi mở với nhiều ý tưởng hơn. Nếu chi phí phát triển không quá cao, hoặc nếu ai đó tình nguyện đảm nhận việc triển khai, có khả năng đề xuất của bạn có thể được đưa vào Jekyll 4.0. Hãy truy cập [issue] này để biết thêm chi tiết. Một số chủ đề thú vị có thể là cải thiện hỗ trợ Quốc tế hóa trong Jekyll, tạo các thẻ Liquid tiện lợi, v.v.

Điều đó nói rằng, giai đoạn phát triển của phiên bản 4.0 bắt đầu _ngay bây giờ_. Điều này có nghĩa là một số điều:

- Các tính năng mới sẽ chỉ được triển khai trong Jekyll 4.0. Sẽ không có 3.9.0 hoặc tương tự.
- Tương tự với các bản sửa lỗi, trừ khi chúng liên quan đến thứ gì đó được giới thiệu trong Jekyll 3.7 hoặc 3.8, trong trường hợp đó chúng tôi sẽ backport các bản sửa lỗi và phát hành phiên bản patch.
- Bây giờ là thời điểm tuyệt vời để cuối cùng đảm nhận tính năng bạn đã muốn thấy trong Jekyll từ lâu! Chỉ cần mở một issue hoặc thử nghiệm với code để bắt đầu!

Về ngày phát hành, chúng tôi hiện đang nhắm đến cuối mùa hè, khoảng tháng 9 hoặc lâu hơn. Tuy nhiên, hãy nhớ rằng dự án này hoàn toàn do tình nguyện viên điều hành, và do đó, sự chậm trễ có thể xảy ra và chúng tôi có thể không đạt được ngày phát hành đó.

Cuối cùng, đây là thời điểm tuyệt vời cho người mới đến mã nguồn mở để thực hiện đóng góp đầu tiên của họ. Chúng tôi sẽ cố gắng hết sức để đánh dấu các đóng góp được đề xuất và tạo các issue thân thiện với người mới, cũng như cung cấp hướng dẫn trong suốt quá trình đóng góp (mặc dù chúng tôi muốn nghĩ rằng chúng tôi đã khá thành thạo trong việc đó). Vì vậy, nếu bạn luôn do dự về việc đóng góp vào một dự án mã nguồn mở lớn, Jekyll là một nơi tốt để bắt đầu!

Chúc bạn Jekyll vui vẻ! :wave:

[issue]: https://github.com/jekyll/jekyll/issues/6948
