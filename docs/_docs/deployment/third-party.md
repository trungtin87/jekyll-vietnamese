---
title: Bên thứ 3 (3rd Party)
permalink: /docs/deployment/third-party/
---


## AWS Amplify

[AWS Amplify Console](https://console.amplify.aws) cung cấp triển khai liên tục và lưu trữ cho các ứng dụng web hiện đại (ứng dụng một trang và trình tạo trang tĩnh). Triển khai liên tục cho phép các nhà phát triển triển khai các bản cập nhật cho ứng dụng web của họ trên mỗi cam kết mã (code commit) vào kho lưu trữ Git của họ. Lưu trữ bao gồm các tính năng như CDN khả dụng toàn cầu, thiết lập tên miền tùy chỉnh 1 lần nhấp + HTTPS, triển khai nhánh tính năng, chuyển hướng, dấu gạch chéo ở cuối và bảo vệ bằng mật khẩu.

Đọc [hướng dẫn từng bước](https://medium.com/@jameshamann/deploy-your-jekyll-site-using-aws-amplify-with-only-a-few-clicks-8f3dd8f26112) này để triển khai và lưu trữ trang web Jekyll của bạn trên AWS Amplify.

## CloudCannon

[CloudCannon](https://cloudcannon.com) có mọi thứ bạn cần để xây dựng, lưu trữ
và cập nhật các trang web Jekyll. Tận dụng CDN toàn cầu, SSL tự động,
triển khai liên tục và [nhiều hơn nữa](https://cloudcannon.com/features/) của chúng tôi.

## GitHub Pages

Các trang web trên GitHub Pages được cung cấp bởi Jekyll ở hậu trường, vì vậy nếu bạn đang tìm kiếm một giải pháp không rắc rối, không tốn kém, GitHub Pages là một cách tuyệt vời để [lưu trữ trang web được cung cấp bởi Jekyll của bạn miễn phí](/docs/github-pages/).

## GitLab Pages

[GitLab Pages](https://about.gitlab.com/stages-devops-lifecycle/pages/) cung cấp dịch vụ lưu trữ miễn phí với các tên miền tùy chỉnh. [Bắt đầu với Jekyll](https://docs.gitlab.com/ee/user/project/pages/getting_started/pages_from_scratch.html) và một đường ống (pipeline) hoàn toàn có thể tùy chỉnh.

## KeyCDN

[KeyCDN](https://www.keycdn.com) tăng tốc các trang web được cung cấp bởi Jekyll với một loạt các tính năng khác như xử lý hình ảnh thời gian thực bao gồm chuyển đổi WebP.
[Hướng dẫn lưu trữ Jekyll](https://www.keycdn.com/support/jekyll-hosting) cung cấp các tùy chọn khác nhau để tăng cường các trang web Jekyll chỉ với một vài bước. Nó kết hợp tính linh hoạt tốt nhất và hiệu suất tuyệt vời.

## Kickster

Sử dụng [Kickster](https://kickster.nielsenramon.com/) để triển khai tự động lên GitHub Pages khi sử dụng các plugin không được hỗ trợ trên GitHub Pages.

Kickster cung cấp một thiết lập dự án Jekyll cơ bản được đóng gói với các phương pháp hay nhất về web và các công cụ tối ưu hóa hữu ích giúp tăng chất lượng dự án tổng thể của bạn. Kickster đi kèm với các tập lệnh triển khai tự động và không phải lo lắng cho GitHub Pages.

Cài đặt gem Kickster và bạn đã sẵn sàng. Tài liệu khác có thể được tìm thấy [tại đây](https://github.com/nielsenramon/kickster#kickster). Nếu bạn không muốn sử dụng gem hoặc bắt đầu một dự án mới, bạn chỉ cần sao chép dán các tập lệnh triển khai cho [Travis CI](https://github.com/nielsenramon/kickster/tree/master/snippets/travis) hoặc [Circle CI](https://github.com/nielsenramon/kickster#automated-deployment-with-circle-ci).

## Netlify

Netlify cung cấp CDN Toàn cầu, Triển khai Liên tục, HTTPS một lần nhấp và [nhiều hơn nữa](https://www.netlify.com/features/), cung cấp cho các nhà phát triển một bộ công cụ mạnh mẽ cho các dự án web hiện đại, mà không cần thêm sự phức tạp. Netlify hỗ trợ các plugin tùy chỉnh cho Jekyll và có gói miễn phí cho các dự án mã nguồn mở.

Đọc [hướng dẫn từng bước Jekyll](https://www.netlify.com/blog/2020/04/02/a-step-by-step-guide-jekyll-4.0-on-netlify/) này để thiết lập trang web Jekyll của bạn trên Netlify.

## Render

[Render](https://render.com) cung cấp triển khai liên tục không cần cấu hình cho các trang web tĩnh. Dịch vụ này miễn phí dưới 100GB băng thông hàng tháng.

## Hostman

[Hostman](https://hostman.com) cho phép bạn lưu trữ các trang web miễn phí mà không cần cấu hình. Đọc [hướng dẫn này](https://hostman.com/docs/jekyll) để triển khai trang web Jekyll của bạn trên Hostman.

## Static Publisher

[Static Publisher](https://github.com/static-publisher/static-publisher) là một tùy chọn triển khai tự động khác với một máy chủ lắng nghe các bài đăng webhook, mặc dù nó không gắn liền với GitHub cụ thể. Nó có triển khai một lần nhấp lên Heroku, nó có thể xem nhiều dự án từ một máy chủ, nó có giao diện quản trị dễ sử dụng và có thể xuất bản lên S3 hoặc kho lưu trữ git (ví dụ: gh-pages).

## Vercel

[Vercel](https://vercel.com/) cung cấp triển khai liên tục không cần cấu hình, Tên miền tùy chỉnh HTTPS, CDN thông minh hiệu suất cao, bạn nhận được triển khai tĩnh ngay lập tức miễn phí.

## 21YunBox

[21YunBox](https://www.21yunbox.com) cung cấp CDN Trung Quốc cực nhanh, Triển khai Liên tục, HTTPS một lần nhấp và [nhiều hơn nữa](https://www.21yunbox.com/docs/), cung cấp cho các nhà phát triển một giải pháp không rắc rối để khởi chạy các dự án web của họ tại Trung Quốc.

Đọc [hướng dẫn từng bước Jekyll](https://www.21yunbox.com/docs/#/deploy-jekyll) này để triển khai trang web Jekyll của bạn trên 21YunBox.

## Layer0

[Layer0](https://www.layer0.co) là một nền tảng tất cả trong một để phát triển, triển khai, xem trước, thử nghiệm, giám sát và chạy giao diện người dùng không đầu (headless frontend) của bạn. Nó tập trung vào các trang web lớn, năng động và hiệu suất tốt nhất thông qua EdgeJS (Mạng phân phối nội dung dựa trên JavaScript), tìm nạp trước dự đoán và giám sát hiệu suất. Layer0 cung cấp một tầng miễn phí. Bắt đầu chỉ trong vài phút bằng cách làm theo [hướng dẫn của Layer0 để triển khai Jekyll](https://docs.layer0.co/guides/jekyll).

## Kinsta Application Hosting

[Kinsta Application Hosting](https://kinsta.com/application-hosting) là một Nền tảng Đám mây được thiết kế để giúp công ty và các nhóm phát triển của bạn vận chuyển các dự án web nhanh hơn và hiệu quả hơn. Bạn có thể lưu trữ các ứng dụng, cơ sở dữ liệu và trang web của mình tất cả ở một nơi. Dễ dàng kết nối với GitHub và tự động hóa việc triển khai và nhận hỗ trợ 24/7 cho tất cả các ngôn ngữ và khung công tác yêu thích của bạn.

Đọc [hướng dẫn này](https://kinsta.com/docs/jekyll-static-site-example/) để tìm hiểu cách triển khai trang web Jekyll trên Kinsta.

## Supranode

[Supranode](https://supranode.com) cung cấp triển khai liên tục có thể tùy chỉnh cho các trang web tĩnh, có tính năng HTTPS tự động, CDN hiệu suất cao, quản lý bí mật, xem trước triển khai, bảo vệ bằng mật khẩu và hơn thế nữa.

## Azion

[Azion](https://www.azion.com/en/) là một nền tảng web cung cấp một loạt các dịch vụ. Nó cho phép bạn lưu trữ các trang web tĩnh, bao gồm các trang web được cung cấp bởi Jekyll, với các tính năng như HTTPS tự động, tên miền tùy chỉnh và phân tích thời gian thực. Nền tảng của Azion được thiết kế cho hiệu suất và khả năng mở rộng, làm cho nó trở thành một lựa chọn tuyệt vời để lưu trữ các trang web toàn cầu.

Trong [hướng dẫn này](https://www.azion.com/en/documentation/products/guides/jekyll-boilerplate/), bạn có thể tìm hiểu cách triển khai một trang web Jekyll trên Azion.
