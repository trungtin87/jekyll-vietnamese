---
title: Triển khai Tự động (Automated Deployment)
permalink: /docs/deployment/automated/
---
Có một số cách để dễ dàng tự động hóa việc triển khai một trang web Jekyll.

## Dịch vụ Tích hợp Liên tục (Continuous Integration Service)

Một trong những cách dễ nhất để thiết lập luồng triển khai tự động là sử dụng một
CI.

Các dịch vụ này chạy một tập lệnh khi có một cam kết (commit) trên kho lưu trữ Git của bạn.
Bạn có thể muốn tập lệnh này xây dựng trang web, chạy thử nghiệm trên đầu ra sau đó triển khai nó đến
dịch vụ bạn chọn.

Chúng tôi có hướng dẫn cho các nhà cung cấp sau:

* [GitHub Actions]({{ '/docs/continuous-integration/github-actions/' | relative_url }})
* [Travis CI]({{ '/docs/continuous-integration/travis-ci/' | relative_url }})
* [CircleCI]({{ '/docs/continuous-integration/circleci/' | relative_url }})
* [Buddy]({{ '/docs/continuous-integration/buddyworks/' | relative_url }})
* [Razorops CI/CD]({{ '/docs/continuous-integration/razorops/' | relative_url }})

## Git post-receive hook

Để có một máy chủ từ xa xử lý việc triển khai cho bạn mỗi khi bạn đẩy các thay đổi bằng Git, bạn có thể tạo một tài khoản người dùng có tất cả các khóa công khai được ủy quyền để triển khai trong tệp `authorized_keys` của nó. Với điều đó tại chỗ, việc thiết lập post-receive hook được thực hiện như sau:

```sh
laptop$ ssh deployer@example.com
server$ mkdir myrepo.git
server$ cd myrepo.git
server$ git --bare init
server$ cp hooks/post-receive.sample hooks/post-receive
server$ mkdir /var/www/myrepo
```

Tiếp theo, thêm các dòng sau vào hooks/post-receive và đảm bảo Jekyll được
cài đặt trên máy chủ:

```bash
#!/bin/bash -l

# Install Ruby Gems to ~/gems
export GEM_HOME=$HOME/gems
export PATH=$GEM_HOME/bin:$PATH

TMP_GIT_CLONE=$HOME/tmp/myrepo
GEMFILE=$TMP_GIT_CLONE/Gemfile
PUBLIC_WWW=/var/www/myrepo

git clone $GIT_DIR $TMP_GIT_CLONE
BUNDLE_GEMFILE=$GEMFILE bundle install
BUNDLE_GEMFILE=$GEMFILE bundle exec jekyll build -s $TMP_GIT_CLONE -d $PUBLIC_WWW
rm -Rf $TMP_GIT_CLONE
exit
```

Cuối cùng, chạy lệnh sau trên bất kỳ máy tính xách tay của người dùng nào cần có khả năng
triển khai bằng hook này:

```sh
laptops$ git remote add deploy deployer@example.com:~/myrepo.git
```

Việc triển khai bây giờ dễ dàng như bảo nginx hoặc Apache xem xét
`/var/www/myrepo` và chạy lệnh sau:

```sh
laptops$ git push deploy master
```
