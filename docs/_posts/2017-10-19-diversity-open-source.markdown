---
title: "Đa dạng trong Mã nguồn Mở, và vai trò của Jekyll trong đó"
date: 2017-10-19 21:33:00 +0200
author: oe
categories: [community]
---

Mã nguồn Mở có vấn đề về đa dạng. GitHub gần đây đã thực hiện một [khảo sát](http://opensourcesurvey.org/2017) cho thấy 95% người trả lời tự nhận là nam giới. Điều này thậm chí còn tệ hơn trong ngành công nghệ nói chung, nơi tỷ lệ này chỉ khoảng 76%. Cứ mỗi tuần khác, dường như lại có một trường hợp người duy trì tham gia vào việc quấy rối có chủ đích đối với các nhóm thiểu số. Tuy nhiên, mọi người bằng cách nào đó lại cho rằng hoàn toàn ổn khi để những điều này trôi qua.

May mắn thay, có một số điều chúng ta có thể làm để làm cho việc đóng góp vào các dự án của chúng ta dễ dàng và thoải mái hơn cho những người chưa bao giờ đóng góp vào bất kỳ dự án mã nguồn mở nào trước đây.

## Thêm Quy tắc Ứng xử và thực thi nó

Đây có vẻ như là một trong những bước dễ nhất để thực hiện, nhưng nó thực sự đòi hỏi rất nhiều sự cống hiến để thực hiện. Về cơ bản, Quy tắc Ứng xử là một tài liệu chi tiết những gì được và không được chấp nhận trong dự án của bạn. Một Quy tắc Ứng xử tốt cũng chi tiết các thủ tục thực thi, có nghĩa là cách xử lý người vi phạm Quy tắc Ứng xử. Đây là điểm mà tôi đã thấy rấttttt nhiều dự án thất bại. Sao chép-dán Quy tắc Ứng xử vào dự án của bạn là đủ dễ, nhưng quan trọng hơn là phải rõ ràng về cách thực thi nó. Việc thực thi không nhất quán —hoặc tệ hơn, không tồn tại— chỉ sẽ làm cho người mới đến sợ hãi hơn nữa!

Quy tắc Ứng xử được áp dụng rộng rãi nhất là [Contributor Covenant](https://www.contributor-covenant.org/). Đây là một tài liệu bao quát rất tốt, nhưng nó hơi nhẹ trong phần thực thi, vì vậy tôi khuyên bạn nên mở rộng nó bằng cách tự mình, bằng cách thêm thông tin liên hệ hoặc mở rộng các quy tắc thực thi.

Bất kể bạn chọn Quy tắc Ứng xử nào, điều quan trọng nhất là thực sự _tự đọc nó_. Điều tồi tệ nhất trong mã nguồn mở là một người duy trì không biết khi nào họ đã vi phạm Quy tắc Ứng xử của chính mình.

## Ghi lại quy trình đóng góp của bạn

Vấn đề khiến mọi người nản lòng nhất là tài liệu không đầy đủ hoặc thiếu, như được tiết lộ qua [khảo sát mã nguồn mở](http://opensourcesurvey.org/2017) của GitHub. Một huyền thoại rất phổ biến trong lập trình là code tốt tự giải thích chính nó, điều này có thể đúng, nhưng chỉ đối với người viết nó. Điều quan trọng, đặc biệt là khi bạn đưa dự án của mình ra cho thế giới xem, là ghi lại không chỉ code của bạn, mà còn cả quy trình mà bạn duy trì nó. Nếu không, sẽ cực kỳ khó khăn cho người mới đến để thậm chí tìm ra nơi bắt đầu đóng góp vào dự án của bạn.

Jekyll có [toàn bộ một phần trong tài liệu](/docs/contributing/) dành riêng cho thông tin về cách đóng góp vì lý do này. Mỗi trang tài liệu đều có liên kết để chỉnh sửa và cải thiện trực tiếp trên GitHub. Cũng quan trọng là nhận ra rằng không phải tất cả các đóng góp đều là code. Nó có thể là tài liệu, nó có thể là xem xét pull request, nhưng nó cũng có thể chỉ là cân nhắc vào các issue, và tất cả điều này nên được công nhận theo cùng một cách. Tại Jekyll, trong số 397 pull request được merge tổng cộng trong năm qua, __204__ là pull request tài liệu!

## Tạo các issue thân thiện với người mới

Đối với hầu hết những người mới với mã nguồn mở, rào cản lớn nhất là tạo pull request đầu tiên của họ. Đó là lý do tại sao các sáng kiến như [YourFirstPR](https://twitter.com/yourfirstpr) và [First Timers Only](http://www.firsttimersonly.com/) được bắt đầu. Gần đây, [một bot GitHub tự động tạo các issue thân thiện với người mới lần đầu](https://github.com/hoodiehq/first-timers-bot) đã được ra mắt, giúp người duy trì dễ dàng chuyển đổi các thay đổi nhỏ hoặc tầm thường thành các pull request khả thi có thể được người mới đảm nhận! Vì vậy, chúng tôi quyết định thử nó, và chúng tôi đã tạo một số issue `first timers only` rất dễ:

- [Issue #6437](https://github.com/jekyll/jekyll/issues/6437)
- [Issue #6438](https://github.com/jekyll/jekyll/issues/6438)
- [Issue #6439](https://github.com/jekyll/jekyll/issues/6439)

(Cũng có danh sách cập nhật của tất cả các issue `first timers only` của chúng tôi [tại đây](https://github.com/jekyll/jekyll/issues?q=is%3Aissue+is%3Aopen+label%3Afirst-time-only))

Những issue này được thiết kế để chỉ được đảm nhận bởi người có ít hoặc không có kinh nghiệm đóng góp vào mã nguồn mở trước đây, và ngoài ra, người duy trì dự án cung cấp hỗ trợ trong trường hợp có câu hỏi phát sinh.

Jekyll là một dự án mã nguồn mở rất lớn và phổ biến, và chúng tôi hy vọng rằng với những issue đặc biệt này, chúng tôi có thể giúp những người chưa đóng góp vào mã nguồn mở trước đây có chỗ đứng trong những vùng nước không ổn định này.

## Hãy tử tế

Tôi biết đây là một cliché và một cụm từ được sử dụng quá mức, nhưng thực sự, nó hoạt động nếu bạn thực hiện nó. Chấp nhận thực tế rằng một số người không nhanh hoặc đáng tin cậy như bạn có thể nghĩ. Đừng tức giận khi một người đóng góp mất nhiều thời gian hơn một ngày so với bạn muốn. Đối xử với những người đóng góp mới vào dự án của bạn với sự tôn trọng, nhưng cũng với lòng hiếu khách. Suy nghĩ hai lần trước khi bạn gửi bình luận đó với những lời lăng mạ trong đó.

Tôi đã đóng góp vào mã nguồn mở khoảng 4 năm nay, và tôi đã có phần trải nghiệm khủng khiếp, khủng khiếp của mình. Nhưng Jekyll trong lịch sử luôn là một dự án luôn đánh giá cao những người đóng góp cho nó hơn chính code, và tôi hy vọng chúng ta có thể giữ nó như vậy. Tôi cũng hy vọng rằng các người duy trì dự án khác đọc điều này và lấy cảm hứng từ bài viết này. Mọi dự án nên đa dạng hơn.
