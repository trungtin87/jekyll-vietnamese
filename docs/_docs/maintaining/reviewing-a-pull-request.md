---
title: "Xem xét một Yêu cầu Kéo"
---

**Hướng dẫn này dành cho những người duy trì.** Những người đặc biệt này có **quyền ghi** vào một hoặc nhiều kho lưu trữ của Jekyll và giúp hợp nhất các đóng góp của người khác. Bạn có thể thấy những gì được viết ở đây thú vị, nhưng nó chắc chắn không dành cho tất cả mọi người.
{: .note .info}

## Phản hồi Tử tế

Trên hết, hãy xem xét một yêu cầu kéo một cách tử tế. Cộng đồng của chúng tôi chỉ có thể mạnh mẽ nếu chúng tôi biến nó thành một môi trường chào đón và hòa nhập. Để thúc đẩy hơn nữa điều này, cộng đồng Jekyll được quản lý bởi một [Quy tắc Ứng xử](/docs/conduct/) mà tất cả các thành viên cộng đồng phải tuân theo.

Sử dụng biểu tượng cảm xúc một cách tự do :heart: :tada: :sparkles: :confetti_ball: và thoải mái biểu cảm!! Các đóng góp giữ cho dự án này tiến lên phía trước và chúng tôi luôn vui mừng nhận được chúng, ngay cả khi yêu cầu kéo cuối cùng không được hợp nhất.

Bài đăng của Mike McQuaid trên blog GitHub có tiêu đề ["Kindly Closing Pull Requests"](https://github.com/blog/2124-kindly-closing-pull-requests) là một nơi tuyệt vời để bắt đầu. Nó mô tả các tình huống khác nhau trong đó việc đóng một yêu cầu kéo vì những lý do khác ngoài sự thiếu toàn vẹn kỹ thuật hoặc độ chính xác là chấp nhận được. Một phần của việc tử tế là phản hồi và giải quyết các yêu cầu kéo một cách nhanh chóng.

## Phản hồi Nhanh chóng

Chúng tôi nên có thể xem xét tất cả các yêu cầu kéo trong vòng một tuần. Thời gian duy nhất xem xét ban đầu nên mất nhiều thời gian hơn là nếu tất cả những người duy trì bí ẩn đi nghỉ trong cùng một tuần. Sự nhanh chóng khuyến khích các đóng góp thường xuyên, chất lượng cao từ các thành viên cộng đồng và những người duy trì khác.

Nếu phản hồi của bạn yêu cầu phản hồi từ phía tác giả, vui lòng thêm thẻ `pending-feedback`. @jekyllbot sẽ tự động xóa thẻ sau khi tác giả của yêu cầu kéo phản hồi.

## Giải quyết Nhanh chóng

Tương tự, chúng tôi nên nhắm đến việc giải quyết các yêu cầu kéo một cách nhanh chóng. Nếu một yêu cầu kéo giới thiệu một tính năng không phù hợp với mục đích cốt lõi hoặc mục tiêu của dự án, hãy đóng nó ngay lập tức với một lời giải thích tử tế về lý do tại sao nó không được chấp nhận.

Để lại nhận xét chi tiết bất cứ khi nào có thể. Cung cấp cho người đóng góp bối cảnh xung quanh lý do tại sao thay đổi bạn đang yêu cầu là cần thiết, hoặc tại sao câu hỏi bạn đang hỏi là quan trọng để giải quyết. Chúng tôi càng có thể truyền đạt rõ ràng bối cảnh cho người đóng góp, người đóng góp càng có khả năng cung cấp các bản vá chất lượng cao.

Bạn có thể đóng một yêu cầu kéo nếu hơn 30 ngày trôi qua mà không có phản hồi từ tác giả.

Trong một số trường hợp, việc xem xét sẽ liên quan đến nhiều tuần qua lại. Miễn là giao tiếp vẫn tiếp tục, điều này là ổn. Lý tưởng nhất, bất kỳ PR nào cũng có khả năng giải quyết trong vòng 30 ngày kể từ khi nó được mở.

## Tìm kiếm Kiểm tra

Nếu đây là một thay đổi mã, có các bài kiểm tra cho hành vi được cập nhật hoặc thêm vào không? Việc vận chuyển một phiên bản có lỗi là không thể tránh khỏi, nhưng việc đảm bảo các thay đổi được kiểm tra giúp giữ cho các lỗi và hồi quy ở mức tối thiểu.

## CI Phải Vượt qua

Việc yêu cầu một người đóng góp điều tra các lỗi trên Travis và vá chúng trước khi bạn bắt đầu xem xét là ổn. Sẽ rất hữu ích khi để lại một tin nhắn cho người đóng góp cho biết rằng các bài kiểm tra đã thất bại và sẽ không có đánh giá nào xảy ra trước khi các bài kiểm tra vượt qua. Nếu họ yêu cầu giúp đỡ, hãy xem xét và hỗ trợ nếu bạn có thể.

## Quy tắc Hai người

Một yêu cầu kéo có thể được hợp nhất sau khi hai người duy trì đã xem xét yêu cầu kéo và chỉ ra rằng nó được chấp nhận đối với họ. Không cần phải đợi người thứ ba trừ khi một trong hai người đánh giá muốn có một cái nhìn khác.

## Nghĩ về Bảo mật

Chúng tôi nợ người dùng của mình việc đảm bảo rằng việc sử dụng một chủ đề từ cộng đồng hoặc xây dựng trang web của người khác không đi kèm với các lỗ hổng bảo mật tích hợp. Những thứ như nơi các tệp có thể được đọc từ và ghi vào là quan trọng để giữ an toàn. Jekyll cũng là cơ sở cho các dịch vụ được lưu trữ như [GitHub Pages](https://pages.github.com), không thể nâng cấp khi các vấn đề bảo mật được giới thiệu.
