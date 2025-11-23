---
layout: page
title: Triết lý
permalink: /philosophy/
---

Jekyll đưa ra một triết lý độc đáo khi tiếp cận vấn đề tạo trang web tĩnh. Triết lý cốt lõi này thúc đẩy sự phát triển và các quyết định về sản phẩm. Khi một người đóng góp, người duy trì, hoặc người dùng tự hỏi Jekyll là gì, các nguyên tắc sau đây nên xuất hiện trong tâm trí:

### 1. Không có Ma thuật

Jekyll không phải là ma thuật. Người dùng có thể hiểu được các quy trình cơ bản tạo nên quá trình build Jekyll mà không cần đọc nhiều. Nó chỉ nên làm những gì bạn yêu cầu và không hơn. Khi người dùng thực hiện một hành động nhất định, kết quả phải dễ hiểu và tập trung.

### 2. Nó "Chỉ Hoạt động"

Trải nghiệm ngay từ đầu phải là nó "chỉ hoạt động". Chạy `gem install jekyll` và nó sẽ build bất kỳ trang Jekyll nào được cung cấp. Các tính năng như tự động tạo lại và cài đặt như trình kết xuất markdown nên đại diện cho các giá trị mặc định hợp lý hoạt động hoàn hảo cho phần lớn các trường hợp. Gánh nặng cấu hình ban đầu không nên đặt lên người dùng.

### 3. Nội dung là Vua

Tại sao Jekyll được yêu thích bởi những người sáng tạo nội dung? Nó tập trung vào nội dung trước tiên và quan trọng nhất, làm cho quá trình xuất bản nội dung trên Web trở nên dễ dàng. Người dùng nên thấy việc quản lý nội dung của họ thú vị và đơn giản.

### 4. Ổn định

Nếu trang web của người dùng build được hôm nay, nó phải build được ngày mai. Khả năng tương thích ngược nên được ưu tiên mạnh mẽ hơn các thay đổi phá vỡ. Các thay đổi phá vỡ nên được thực hiện để hỗ trợ một mục tiêu thực tế mạnh mẽ, và các thay đổi phá vỡ không bao giờ nên được thực hiện để thúc đẩy "sự thuần khiết" của codebase, hoặc các thay đổi khác chỉ để làm cho cuộc sống của người duy trì dễ dàng hơn. Các thay đổi phá vỡ tạo ra một lượng ma sát đáng kể giữa các lần nâng cấp và giảm sự tự tin của người dùng vào phần mềm này, và do đó nên được tránh trừ khi thực sự cần thiết. Khi có thay đổi phá vỡ, hãy cung cấp một con đường rõ ràng để người dùng nâng cấp.

### 5. Nhỏ & Có thể Mở rộng

Lõi của Jekyll nên đơn giản và nhỏ, và khả năng mở rộng nên là một tính năng hạng nhất để cung cấp chức năng bổ sung từ những người đóng góp cộng đồng. Lõi nên được giữ cho các tính năng được sử dụng bởi ít nhất 90% người dùng–mọi thứ khác nên được cung cấp dưới dạng plugin. Các tính năng mới nên được vận chuyển dưới dạng plugin và trọng tâm nên được đặt vào việc tạo các API lõi có thể mở rộng để hỗ trợ các plugin phong phú.
