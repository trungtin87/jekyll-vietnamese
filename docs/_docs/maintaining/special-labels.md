---
title: "Nhãn Đặc biệt"
---

**Hướng dẫn này dành cho những người duy trì.** Những người đặc biệt này có **quyền ghi** vào một hoặc nhiều kho lưu trữ của Jekyll và giúp hợp nhất các đóng góp của người khác. Bạn có thể thấy những gì được viết ở đây thú vị, nhưng nó chắc chắn không dành cho tất cả mọi người.
{: .note .info}

Chúng tôi sử dụng một loạt các "nhãn đặc biệt" trên GitHub.com để tự động hóa việc xử lý một số phần của quy trình yêu cầu kéo và vấn đề. @jekyllbot có thể tự động áp dụng hoặc xóa một số nhãn nhất định dựa trên các hành động được thực hiện bởi người dùng hoặc người duy trì. Dưới đây là các nhãn và cách chúng hoạt động:

## `pending-feedback`

Nhãn này được sử dụng để chỉ ra rằng chúng tôi cần thêm thông tin từ tác giả vấn đề/PR để tiếp tục. Có thể là bạn cần thêm thông tin trước khi bạn có thể phân loại đúng báo cáo lỗi, hoặc bạn có một số câu hỏi chưa được trả lời về PR cần được giải quyết trước khi tiếp tục. Bạn có thể bỏ qua bất kỳ vấn đề nào có nhãn này một cách an toàn, vì nó đang chờ phản hồi.

## `needs-work` & `pending-rebase`

Các nhãn này được sử dụng để chỉ ra rằng trạng thái Git của một yêu cầu kéo phải thay đổi. Cả hai đều bị xóa sau khi một lần đẩy được đăng ký (một sự kiện "synchronize" cho yêu cầu kéo) và yêu cầu kéo trở nên có thể hợp nhất. Thêm `needs-work` vào PR nếu, sau khi xem xét của bạn, nó yêu cầu thay đổi mã. Thêm `pending-rebase` vào PR nếu mã ổn nhưng nhánh không tự động hợp nhất được với nhánh đích (ví dụ: `master`).

## `stale`

Nhãn này được @jekyllbot tự động thêm và xóa dựa trên hoạt động trên một vấn đề hoặc yêu cầu kéo. Các quy tắc cho nhãn này được trình bày trong [Phân loại một vấn đề: Sự cũ kỹ và tự động đóng](../triaging-an-issue/#staleness-and-automatic-closure).

## `pinned`

Nhãn này dành cho @jekyllbot để bỏ qua tuổi của vấn đề, có nghĩa là nhãn `stale` sẽ không được thêm tự động, và vấn đề sẽ không bị đóng sau một thời gian. Điều này cần được thiết lập thủ công, và nên được thiết lập cẩn thận. (Nhãn `has-pull-request` cũng làm điều tương tự, nhưng không nên được sử dụng để _chỉ_ giữ một vấn đề mở)
