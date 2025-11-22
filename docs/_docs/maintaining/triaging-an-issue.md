---
title: "Phân loại một Vấn đề"
---

**Hướng dẫn này dành cho những người duy trì.** Những người đặc biệt này có **quyền ghi** vào một hoặc nhiều kho lưu trữ của Jekyll và giúp hợp nhất các đóng góp của người khác. Bạn có thể thấy những gì được viết ở đây thú vị, nhưng nó chắc chắn không dành cho tất cả mọi người.
{: .note .info}

Trước khi đánh giá một vấn đề, điều quan trọng là phải xác định xem đó là một yêu cầu tính năng hay một lỗi. Đối với dự án Jekyll, các định nghĩa sau được sử dụng để xác định một tính năng hoặc một lỗi:

**Tính năng** - Một tính năng được định nghĩa là một yêu cầu thêm chức năng cho Jekyll bên ngoài các khả năng hiện tại của nó.
**Lỗi** - Một lỗi được định nghĩa là một vấn đề xác định một lỗi mà người dùng (hoặc những người dùng) gặp phải khi sử dụng các chức năng hiện tại của Jekyll.

## Tính năng?

Nếu vấn đề mô tả một yêu cầu tính năng, hãy hỏi:

1. Đây có phải là một cài đặt không? [Cài đặt là một chỗ dựa](http://ben.balter.com/2016/03/08/optimizing-for-power-users-and-edge-cases/#settings-are-a-crutch) để làm "điều đúng đắn". Cài đặt thường chỉ ra một mặc định tồi hoặc một trường hợp biên có thể được giải quyết dễ dàng bằng một plugin. Giữ cho :christmas_tree: của các cài đặt càng nhỏ càng tốt để không làm giảm khả năng sử dụng của sản phẩm. Chúng tôi thích triết lý "quyết định không phải tùy chọn."
2. Liệu ít nhất 80% người dùng có thấy nó hữu ích không? Nếu ngay cả một phần tư người dùng của chúng tôi sẽ không sử dụng nó, rất có thể yêu cầu đó không phù hợp với mục tiêu cốt lõi của sản phẩm của chúng tôi.
3. Có cách nào khác để hoàn thành mục tiêu cuối cùng của yêu cầu không? Hầu hết các yêu cầu tính năng là do tài liệu tồi hoặc hiểu sai về một tính năng có sẵn. Xem liệu bạn có thể làm rõ mục tiêu cuối cùng của yêu cầu không. Người dùng đang cố gắng làm gì? Họ có thể hoàn thành mục tiêu đó thông qua một tính năng khác mà chúng tôi đã hỗ trợ không?
4. Ngay cả khi 80% người dùng của chúng tôi sẽ sử dụng nó, nó có phù hợp với mục tiêu cốt lõi của dự án của chúng tôi không? Chúng tôi đang viết một công cụ để tạo các trang web tĩnh, không phải là một con dao quân đội Thụy Sĩ để xuất bản nói chung.

Hãy thoải mái nhận ý kiến của người khác và đặt câu hỏi cho tác giả vấn đề, nhưng tùy thuộc vào câu trả lời cho các câu hỏi trên, nó có thể nằm ngoài phạm vi của dự án của chúng tôi.

Nếu yêu cầu nằm trong phạm vi, hãy ưu tiên nó trên lộ trình sản phẩm với những người duy trì khác. Áp dụng các thẻ thích hợp và đảm bảo đúng người đã cân nhắc để xác định phạm vi và triển khai của tính năng. Nếu bạn muốn trở thành người _tốt nhất bao giờ hết_, hãy tự gửi một PR thêm tính năng đó.

## Lỗi?

### Khả năng tái tạo

Nếu lỗi có các bước tái tạo rõ ràng, hãy dành một phút để thử chúng. Nếu nó giúp ích, hãy viết một bài kiểm tra trong bộ kiểm tra của chúng tôi cho kịch bản sao chép vấn đề. Bạn có thể sao chép vấn đề một cách đáng tin cậy không?

Nếu bạn không thể sao chép vấn đề, hãy đăng các bước sao chép của bạn không hoạt động và yêu cầu làm rõ từ tác giả vấn đề.

### Nền tảng được hỗ trợ

Tác giả có đang sử dụng một nền tảng được hỗ trợ không? Chúng tôi hỗ trợ các phiên bản mới nhất của macOS, Ubuntu, Debian, CentOS, Fedora, và Arch Linux.

Bạn có thể đóng vấn đề ngay lập tức nếu tác giả không thể tái tạo vấn đề trên một nền tảng được hỗ trợ. Đối với các vấn đề liên quan đến Windows, hãy để lại nhận xét cho người dùng biết rằng Windows không được hỗ trợ chính thức, nhưng họ hoàn toàn có thể tiếp tục sử dụng vấn đề để giao tiếp với mọi người từ `@jekyll/windows` để điều tra thêm. Ngoài ra, bạn có thể chỉ họ đến Jekyll Talk (<https://talk.jekyllrb.com>) như một phương tiện để nhận hỗ trợ từ cộng đồng.

Nếu người dùng đang gặp sự cố với GitHub Pages hoặc một nền tảng được lưu trữ khác mà chúng tôi không thể tái tạo, vui lòng hướng dẫn họ đến kênh hỗ trợ của nền tảng và đóng vấn đề.

### Những gì họ muốn so với những gì họ nhận được

Một vấn đề không có giải thích rõ ràng về những gì người dùng nhận được và những gì họ mong đợi nhận được không phải là một vấn đề chúng tôi có thể phản hồi chính xác. Nếu người dùng không cung cấp thông tin này, vui lòng yêu cầu làm rõ và áp dụng nhãn `pending-feedback`. Thông tin này giúp chúng tôi xây dựng các trường hợp kiểm tra sao cho chúng tôi không phá vỡ hành vi một lần nữa trong tương lai. Nhãn `pending-feedback` sẽ được xóa tự động sau khi tác giả vấn đề đăng câu trả lời.

Những gì họ muốn nhận được có phải là điều chúng tôi muốn xảy ra không? Đôi khi một báo cáo lỗi thực sự đang ngụy trang dưới dạng một yêu cầu tính năng. Xem hướng dẫn ở trên để xử lý các yêu cầu tính năng.

### Sự cũ kỹ và tự động đóng

@jekyllbot sẽ tự động đánh dấu các vấn đề là `stale` nếu không có hoạt động nào xảy ra trong ít nhất một tháng. @jekyllbot để lại một nhận xét yêu cầu thông tin về khả năng tái tạo trong các phiên bản hiện tại. Nếu không ai phản hồi sau một tháng nữa, vấn đề sẽ tự động bị đóng. Hành vi này có thể bị chặn bằng cách đặt [`pinned` label](/docs/maintaining/special-labels/#pinned).
