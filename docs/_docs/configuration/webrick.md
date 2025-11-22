---
title: Tùy chọn WEBrick (WEBrick Options)
permalink: "/docs/configuration/webrick/"
---
Bạn có thể cung cấp các tiêu đề tùy chỉnh cho trang web của mình bằng cách thêm chúng vào `_config.yml`

```yaml
# File: _config.yml
webrick:
  headers:
    My-Header: My-Value
    My-Other-Header: My-Other-Value
```

### Mặc định (Defaults)

Jekyll cung cấp theo mặc định các tiêu đề phản hồi `Content-Type` và `Cache-Control`: một động để chỉ định bản chất của dữ liệu đang được phục vụ,
cái còn lại tĩnh để vô hiệu hóa bộ nhớ đệm để bạn không phải chiến đấu
với bộ nhớ đệm tích cực của Chrome khi bạn đang ở chế độ phát triển.
