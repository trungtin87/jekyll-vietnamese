---
layout: docs
title: Nâng cấp (Upgrading)
permalink: /docs/upgrading/
---

Nâng cấp từ một phiên bản cũ hơn của Jekyll? Nâng cấp lên một phiên bản chính mới của
Jekyll (ví dụ: từ v2.x lên v3.x) có thể gây ra một số vấn đề đau đầu. Hãy làm theo các
hướng dẫn sau để hỗ trợ việc nâng cấp của bạn:

- [Từ 0.x lên 1.x và 2.x](/docs/upgrading/0-to-2/)
- [Từ 2.x lên 3.x](/docs/upgrading/2-to-3/)
- [Từ 3.x lên 4.x](/docs/upgrading/3-to-4/)

## Cập nhật nhỏ

<div class="note">
  <h5>Luôn cập nhật</h5>
  <p>Chúng tôi khuyên bạn nên cập nhật Jekyll thường xuyên nhất có thể để hưởng lợi từ
  các bản sửa lỗi mới nhất.
  </p>
</div>

Nếu bạn đã làm theo các khuyến nghị thiết lập của chúng tôi và cài đặt [Bundler](http://bundler.io/), hãy chạy `bundle update jekyll` hoặc đơn giản là `bundle update` và tất cả các gem của bạn sẽ
cập nhật lên các phiên bản mới nhất.

Nếu bạn chưa cài đặt Bundler, hãy chạy `gem update jekyll`.

Quy trình tương tự [nếu bạn sử dụng gem `github-pages`](https://help.github.com/articles/setting-up-your-github-pages-site-locally-with-jekyll/#keeping-your-site-up-to-date-with-the-github-pages-gem).
