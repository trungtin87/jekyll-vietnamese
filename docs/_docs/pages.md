---
title: Trang (Pages)
permalink: /docs/pages/
---

Trang là khối xây dựng cơ bản nhất cho nội dung. Chúng hữu ích cho nội dung độc lập
(nội dung không dựa trên ngày tháng hoặc không phải là một nhóm nội dung như thành viên
nhân viên hoặc công thức nấu ăn).

Cách đơn giản nhất để thêm một trang là thêm một tệp HTML vào thư mục gốc
với tên tệp phù hợp. Bạn cũng có thể viết một trang bằng Markdown sử dụng
phần mở rộng `.md` và front matter, nó sẽ chuyển đổi thành HTML khi xây dựng. Đối với một trang web có
trang chủ, trang giới thiệu và trang liên hệ, đây là những gì thư mục gốc
và các URL liên quan có thể trông như thế nào:

```
.
├── about.md    # => http://example.com/about.html
├── index.html    # => http://example.com/
└── contact.html  # => http://example.com/contact.html
```

Nếu bạn có nhiều trang, bạn có thể tổ chức chúng vào các thư mục con. Các thư mục con tương tự được sử dụng để nhóm các trang của bạn trong mã nguồn dự án sau đó sẽ tồn tại trong thư mục `_site` khi trang web của bạn được xây dựng. Tuy nhiên, khi một trang có một liên kết tĩnh *khác* được đặt trong front matter, thư mục con tại `_site` sẽ thay đổi tương ứng.

```
.
├── about.md          # => http://example.com/about.html
├── documentation     # thư mục chứa các trang
│   └── doc1.md       # => http://example.com/documentation/doc1.html
├── design            # thư mục chứa các trang
│   └── draft.md      # => http://example.com/design/draft.html
```

## Thay đổi URL đầu ra

Bạn có thể muốn có một cấu trúc thư mục cụ thể cho các tệp nguồn của mình nhưng thay đổi đối với trang web đã xây dựng. Với [liên kết tĩnh](/docs/permalinks/) bạn có toàn quyền kiểm soát URL đầu ra.

## Trích dẫn cho trang {%- include docs_version_badge.html version="4.1.1" -%}

Người ta có thể *chọn* tạo trích dẫn cho các trang của họ bằng cách đặt `page_excerpts` thành `true` trong tệp cấu hình của họ.
