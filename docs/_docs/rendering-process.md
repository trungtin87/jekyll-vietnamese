---
---

Đối với bất kỳ trang web Jekyll nào, một *phiên xây dựng* bao gồm các giai đoạn riêng biệt theo thứ tự sau --- *thiết lập plugin,
đọc tệp nguồn, chạy trình tạo, hiển thị mẫu*, và cuối cùng *ghi tệp vào đĩa*.

Trong khi các giai đoạn trên là tự giải thích, giai đoạn cần phân tích là *giai đoạn hiển thị*.

Giai đoạn hiển thị có thể chia nhỏ thành ba giai đoạn tùy chọn. Mọi tệp được hiển thị, đi qua một hoặc nhiều
giai đoạn này được xác định bởi chuỗi nội dung của tệp, front matter và phần mở rộng. Các giai đoạn giống như một dây chuyền lắp ráp,
với *đầu ra* từ một giai đoạn là *đầu vào* cho giai đoạn kế tiếp:

- **Thông dịch các biểu thức Liquid trong tệp**<br/>
  Giai đoạn này đánh giá các biểu thức Liquid trong tệp hiện tại. Theo mặc định, việc thông dịch là *nông* --- ở chỗ
  bất kỳ biểu thức Liquid nào trong đầu ra kết quả đều không được thông dịch thêm. Hơn nữa, bất kỳ biểu thức Liquid nào trong
  front matter của tệp đều được giữ nguyên.
- **Giải phóng các trình chuyển đổi**<br/>
  Giai đoạn này gọi trình chuyển đổi được ánh xạ tới phần mở rộng của tệp hiện tại và chuyển đổi chuỗi đầu vào. Đây là khi
  Markdown được chuyển đổi thành HTML và Sass / Scss thành CSS hoặc CoffeeScript thành JavaScript, v.v. Vì giai đoạn này
  được xác định bởi phần mở rộng của tệp, Markdown hoặc Sass bên trong tệp `.html` sẽ vẫn được giữ nguyên.
- **Điền vào các bố cục**<br/>
  Đến giai đoạn này, *tệp nguồn* được coi là đã hiển thị và nó sẽ không được xem lại. Tuy nhiên, dựa trên
  phần mở rộng của tệp và do đó dựa trên front matter, nó được xác định xem có lấy chuỗi *đầu ra* từ
  giai đoạn trước và đặt vào bố cục hay không. Trong khi đầu ra từ các tệp Sass hoặc tệp CoffeeScript *không bao giờ*
  được đặt vào một bố cục, đầu ra văn bản thông thường có thể đi theo cả hai cách dựa trên việc một bố cục có được gán thông qua front
  matter hay không.<br/><br/>
  Việc đặt vào các bố cục hoạt động tương tự như cách búp bê Nga bao bọc những con nhỏ hơn bên trong nó hoặc cách một con hàu
  tạo ra một viên ngọc trai --- đầu ra đã chuyển đổi từ giai đoạn trước tạo thành lõi và (các) bố cục được
  *hiển thị* riêng biệt lên lõi một cách liên tiếp.
