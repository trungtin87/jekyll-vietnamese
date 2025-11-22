---
title: Chủ đề (Themes)
permalink: /docs/themes/
---

Jekyll có một hệ thống chủ đề mở rộng cho phép bạn tận dụng các mẫu và kiểu được cộng đồng duy trì để tùy chỉnh cách trình bày trang web của bạn. Các chủ đề Jekyll chỉ định các plugin và đóng gói các tài sản, bố cục, bao gồm và bảng định kiểu theo cách có thể bị ghi đè bởi nội dung trang web của bạn.

## Chọn một chủ đề

Bạn có thể tìm và xem trước các chủ đề trên các thư viện khác nhau:

- [GitHub.com #jekyll-theme repos](https://github.com/topics/jekyll-theme)
- [jamstackthemes.dev](https://jamstackthemes.dev/ssg/jekyll/)
- [jekyllthemes.org](http://jekyllthemes.org/)
- [jekyllthemes.io](https://jekyllthemes.io/)
- [jekyll-themes.com](https://jekyll-themes.com/)
- [jekyllup.com](https://jekyllup.com/)

Xem thêm: [tài nguyên](/resources/).

## Hiểu về các chủ đề dựa trên gem

Khi bạn [tạo một trang web Jekyll mới](/docs/) (bằng cách chạy lệnh `jekyll new <PATH>`), Jekyll cài đặt một trang web sử dụng chủ đề dựa trên gem có tên là [Minima](https://github.com/jekyll/minima).

Với các chủ đề dựa trên gem, một số thư mục của trang web (chẳng hạn như thư mục `assets`, `_data`, `_layouts`, `_includes`, và `_sass`) được lưu trữ trong gem của chủ đề, ẩn khỏi chế độ xem ngay lập tức của bạn. Tuy nhiên, tất cả các thư mục cần thiết sẽ được đọc và xử lý trong quá trình xây dựng của Jekyll.

Trong trường hợp của Minima, bạn chỉ thấy các tệp sau trong thư mục trang web Jekyll của mình:

```
.
├── Gemfile
├── Gemfile.lock
├── _config.yml
├── _posts
│   └── 2016-12-04-welcome-to-jekyll.markdown
├── about.markdown
└── index.markdown
```

Các tệp `Gemfile` và `Gemfile.lock` được Bundler sử dụng để theo dõi các gem cần thiết và phiên bản gem bạn cần để xây dựng trang web Jekyll của mình.

Các chủ đề dựa trên gem giúp các nhà phát triển chủ đề dễ dàng cung cấp các bản cập nhật cho bất kỳ ai có gem chủ đề. Khi có bản cập nhật, các nhà phát triển chủ đề đẩy bản cập nhật lên RubyGems.

Nếu bạn có gem chủ đề, bạn có thể (nếu bạn muốn) chạy `bundle update` để cập nhật tất cả các gem trong dự án của mình. Hoặc bạn có thể chạy `bundle update <THEME>`, thay thế `<THEME>` bằng tên chủ đề, chẳng hạn như `minima`, để chỉ cập nhật gem chủ đề. Bất kỳ tệp mới hoặc bản cập nhật nào mà nhà phát triển chủ đề đã thực hiện (chẳng hạn như đối với bảng định kiểu hoặc bao gồm) sẽ được kéo vào dự án của bạn một cách tự động.

Mục tiêu của các chủ đề dựa trên gem là cho phép bạn nhận được tất cả các lợi ích của một chủ đề mạnh mẽ, được cập nhật liên tục mà không cần tất cả các tệp của chủ đề cản trở bạn và làm phức tạp quá mức những gì có thể là trọng tâm chính của bạn: tạo nội dung.

## Ghi đè mặc định của chủ đề

Các chủ đề Jekyll đặt dữ liệu, bố cục, bao gồm và bảng định kiểu mặc định. Tuy nhiên, bạn có thể ghi đè bất kỳ mặc định nào của chủ đề bằng nội dung trang web của riêng bạn.

Để thay thế các bố cục hoặc bao gồm trong chủ đề của bạn, hãy tạo một bản sao trong thư mục `_layouts` hoặc `_includes` của bạn của tệp cụ thể mà bạn muốn sửa đổi, hoặc tạo tệp từ đầu với cùng tên với tệp bạn muốn ghi đè.

Ví dụ, nếu chủ đề đã chọn của bạn có bố cục `page`, bạn có thể ghi đè bố cục của chủ đề bằng cách tạo bố cục `page` của riêng bạn trong thư mục `_layouts` (nghĩa là, `_layouts/page.html`).

Để định vị các tệp của chủ đề trên máy tính của bạn:

1. Chạy `bundle info --path` theo sau là tên của gem chủ đề, ví dụ: `bundle info --path minima` cho chủ đề mặc định của Jekyll.

   Điều này trả về vị trí của các tệp chủ đề dựa trên gem. Ví dụ, các tệp của chủ đề Minima có thể nằm trong `/usr/local/lib/ruby/gems/2.6.0/gems/minima-2.5.1` trên macOS.

2. Mở thư mục của chủ đề trong Finder hoặc Explorer:

   ```sh
   # Trên MacOS
   open $(bundle info --path minima)

   # Trên Windows
   # Đầu tiên lấy đường dẫn cài đặt của gem:
   #
   #   bundle info --path minima
   #   => C:/Ruby26-x64/lib/ruby/gems/{{ site.data.ruby.current_version }}/gems/minima-2.5.1
   #
   # sau đó gọi explorer với đường dẫn trên, thay thế `/` bằng `\`
   explorer C:\Ruby26-x64\lib\ruby\gems\{{ site.data.ruby.current_version}}\gems\minima-2.5.1

   # Trên Linux
   xdg-open $(bundle info --path minima)
   ```

   Một cửa sổ Finder hoặc Explorer mở ra hiển thị các tệp và thư mục của chủ đề. Gem chủ đề Minima chứa các tệp này:

   ```
   .
   ├── LICENSE.txt
   ├── README.md
   ├── _includes
   │   ├── disqus_comments.html
   │   ├── footer.html
   │   ├── google-analytics.html
   │   ├── head.html
   │   ├── header.html
   │   ├── icon-github.html
   │   ├── icon-github.svg
   │   ├── icon-twitter.html
   │   └── icon-twitter.svg
   ├── _layouts
   │   ├── default.html
   │   ├── home.html
   │   ├── page.html
   │   └── post.html
   ├── _sass
   │   ├── minima
   │   │   ├── _base.scss
   │   │   ├── _layout.scss
   │   │   └── _syntax-highlighting.scss
   │   └── minima.scss
   └── assets
       └── main.scss
   ```

Với sự hiểu biết rõ ràng về các tệp của chủ đề, giờ đây bạn có thể ghi đè bất kỳ tệp chủ đề nào bằng cách tạo một tệp có tên tương tự trong thư mục trang web Jekyll của bạn.

Giả sử, ví dụ thứ hai, bạn muốn ghi đè chân trang của Minima. Trong trang web Jekyll của bạn, hãy tạo một thư mục `_includes` và thêm một tệp trong đó có tên là `footer.html`. Jekyll bây giờ sẽ sử dụng tệp `footer.html` của trang web của bạn thay vì tệp `footer.html` từ gem chủ đề Minima.

Để sửa đổi bất kỳ bảng định kiểu nào, bạn phải thực hiện bước bổ sung là sao chép tệp sass chính (`_sass/minima.scss` trong chủ đề Minima) vào thư mục `_sass` trong nguồn trang web của bạn.

Jekyll sẽ tìm trước tiên trong nội dung trang web của bạn trước khi tìm trong các mặc định của chủ đề cho bất kỳ tệp nào được yêu cầu trong các thư mục sau:

- `/assets`
- `/_data`
- `/_layouts`
- `/_includes`
- `/_sass`

Lưu ý rằng việc tạo bản sao của các tệp chủ đề sẽ ngăn bạn nhận bất kỳ bản cập nhật chủ đề nào trên các tệp đó. Một giải pháp thay thế, để tiếp tục nhận các bản cập nhật chủ đề trên tất cả các bảng định kiểu, là sử dụng các bộ chọn CSS có độ đặc hiệu cao hơn trong các tệp CSS bổ sung, được đặt tên ban đầu của riêng bạn.

{: .note .info}
Tham khảo tài liệu và kho lưu trữ nguồn của chủ đề đã chọn của bạn để biết thêm thông tin về những tệp nào bạn có thể ghi đè.

### Chủ đề với thư mục `_data` {%- include docs_version_badge.html version="4.3.0" -%}

{: #themes-with-data-directory }

Bắt đầu từ phiên bản 4.3.0, Jekyll cũng tính đến thư mục `_data` của các chủ đề. Điều này cho phép dữ liệu được phân phối qua các chủ đề.

Một ví dụ điển hình là văn bản được sử dụng trong các yếu tố thiết kế.

Hãy tưởng tượng một chủ đề cung cấp tệp bao gồm `testimonials.html`. Yếu tố thiết kế này tạo ra một phần mới trên trang, và đặt một tiêu đề h3 trên danh sách các lời chứng thực.

Một nhà phát triển chủ đề có thể sẽ xây dựng tiêu đề bằng tiếng Anh và đặt nó trực tiếp vào mã nguồn HTML.

Người tiêu dùng của chủ đề có thể sao chép tệp được bao gồm vào dự án của họ và thay thế tiêu đề ở đó.

Với việc xem xét thư mục `_data`, có một giải pháp khác cho nhiệm vụ tiêu chuẩn này.

Thay vì nhập văn bản trực tiếp vào mẫu thiết kế, nhà thiết kế thêm một tham chiếu đến một danh mục văn bản (ví dụ: `site.data.i18n.testimonials.header`) và tạo một tệp `_data/i18n/testimonials.yml` trong thư mục dữ liệu của chủ đề.

Trong tệp này, tiêu đề được đặt dưới khóa `header` và Jekyll lo phần còn lại.

Đối với các nhà phát triển chủ đề, điều này, thoạt nhìn, tất nhiên là một nỗ lực lớn hơn so với trước đây.

Tuy nhiên, đối với người tiêu dùng của chủ đề, việc tùy chỉnh được đơn giản hóa rất nhiều.

Hãy tưởng tượng chủ đề được sử dụng bởi một khách hàng từ Đức. Để cô ấy có được tiêu đề đã dịch cho yếu tố thiết kế lời chứng thực vào, cô ấy chỉ cần tạo một tệp dữ liệu trong thư mục dự án của mình với khóa `site.data.i18n.testimonials.header`, đặt bản dịch tiếng Đức hoặc một tiêu đề theo lựa chọn của cô ấy lên trên nó và yếu tố thiết kế đã được tùy chỉnh.

Cô ấy không còn phải sao chép tệp được bao gồm vào thư mục dự án của mình, tùy chỉnh nó ở đó và, điều nặng nề nhất, từ bỏ tất cả các bản cập nhật của chủ đề, đơn giản vì nhà phát triển chủ đề đã cung cấp cho cô ấy khả năng thực hiện các thay đổi đối với các mô-đun văn bản một cách tập trung thông qua các tệp văn bản.

{: .note .warning}
Các tệp dữ liệu cung cấp mức độ linh hoạt cao. Nơi mà các nhà phát triển chủ đề đặt các mô-đun văn bản có thể khác với nơi của người tiêu dùng chủ đề, điều này có thể gây ra những rắc rối không lường trước được!

Liên quan đến ví dụ trên, khóa ghi đè `site.data.i18n.testimonials.header` từ tệp `_data/i18n/testimonials.yml` của chủ đề trên trang web của người tiêu dùng có thể được đặt ở ba vị trí khác nhau:

- `_data/i18n.yml` với khóa `testimonials.header`
- `_data/i18n/testimonials.yml` với khóa `header` (phản ánh bố cục của ví dụ đã cho)
- `_data/i18n/testimonials/header.yml` không có bất kỳ khóa nào, dòng tiêu đề có thể đi thẳng vào tệp

Các nhà phát triển chủ đề nên ghi nhớ sự mơ hồ này, khi hỗ trợ người tiêu dùng cảm thấy lạc lõng trong việc thiết lập các mô-đun văn bản của họ cho các yếu tố thiết kế mà chủ đề cung cấp.

{: .note .info}
Khi sử dụng tính năng dữ liệu, hãy tự hỏi, khóa mà bạn giới thiệu có phải là thứ thay đổi hành vi của chủ đề khi hiện diện hay không, hay nó chỉ là dữ liệu được hiển thị dù sao đi nữa. Nếu nó thay đổi hành vi của chủ đề, nó nên đi vào `site.config`, nếu không thì nó ổn để được cung cấp thông qua `site.data`.

Việc đóng gói dữ liệu sửa đổi hành vi của một chủ đề được coi là một **mẫu chống đối (anti-pattern)** mà việc sử dụng nó bị phản đối mạnh mẽ. Hoàn toàn phụ thuộc vào tác giả của chủ đề để đảm bảo rằng mọi dữ liệu được cung cấp có thể dễ dàng bị ghi đè bởi người tiêu dùng của chủ đề nếu họ muốn.

## Chuyển đổi các chủ đề dựa trên gem thành các chủ đề thông thường

Giả sử bạn muốn loại bỏ chủ đề dựa trên gem và chuyển đổi nó thành một chủ đề thông thường, trong đó tất cả các tệp đều có mặt trong thư mục trang web Jekyll của bạn, không có gì được lưu trữ trong gem chủ đề.

Để làm điều này, hãy sao chép các tệp từ thư mục của gem chủ đề vào thư mục trang web Jekyll của bạn. (Ví dụ, sao chép chúng vào `/myblog` nếu bạn đã tạo trang web Jekyll của mình tại `/myblog`. Xem phần trước để biết chi tiết.)

Sau đó, bạn phải cho Jekyll biết về các plugin đã được tham chiếu bởi chủ đề. Bạn có thể tìm thấy các plugin này trong tệp gemspec của chủ đề dưới dạng các phụ thuộc thời gian chạy. Nếu bạn đang chuyển đổi chủ đề Minima, ví dụ, bạn có thể thấy:

```ruby
spec.add_runtime_dependency "jekyll-feed", "~> 0.12"
spec.add_runtime_dependency "jekyll-seo-tag", "~> 2.6"
```

Bạn nên bao gồm các tham chiếu này trong `Gemfile` theo một trong hai cách.

Bạn có thể liệt kê chúng riêng lẻ trong cả `Gemfile` và `_config.yml`.

```ruby
# ./Gemfile

gem "jekyll-feed", "~> 0.12"
gem "jekyll-seo-tag", "~> 2.6"
```

```yaml
# ./_config.yml

plugins:
  - jekyll-feed
  - jekyll-seo-tag
```

Hoặc bạn có thể liệt kê chúng một cách rõ ràng là các plugin Jekyll trong Gemfile của bạn, và không cập nhật `_config.yml`, như thế này:

```ruby
# ./Gemfile

group :jekyll_plugins do
  gem "jekyll-feed", "~> 0.12"
  gem "jekyll-seo-tag", "~> 2.6"
end
```

Dù bằng cách nào, đừng quên `bundle update`.

Nếu bạn đang xuất bản trên GitHub Pages, bạn chỉ nên cập nhật `_config.yml` của mình vì GitHub Pages không tải các plugin qua Bundler.

Cuối cùng, xóa các tham chiếu đến gem chủ đề trong `Gemfile` và cấu hình. Ví dụ, để xóa `minima`:

- Mở `Gemfile` và xóa `gem "minima", "~> 2.5"`.
- Mở `_config.yml` và xóa `theme: minima`.

Bây giờ `bundle update` sẽ không còn nhận được các bản cập nhật cho gem chủ đề nữa.

## Cài đặt một chủ đề dựa trên gem {#installing-a-theme}

Lệnh `jekyll new <PATH>` không phải là cách duy nhất để tạo một trang web Jekyll mới với một chủ đề dựa trên gem. Bạn cũng có thể tìm thấy các chủ đề dựa trên gem trực tuyến và kết hợp chúng vào dự án Jekyll của mình.

Ví dụ, tìm kiếm [jekyll theme trên RubyGems](https://rubygems.org/search?utf8=%E2%9C%93&query=jekyll-theme) để tìm các chủ đề dựa trên gem khác. (Lưu ý rằng không phải tất cả các chủ đề đều sử dụng `jekyll-theme` như một quy ước trong tên chủ đề.)

Để cài đặt một chủ đề dựa trên gem:

1. Thêm gem chủ đề vào `Gemfile` của trang web của bạn:

   ```ruby
   # ./Gemfile

   # Đây là một ví dụ, khai báo gem chủ đề bạn muốn sử dụng ở đây
   gem "jekyll-theme-minimal"
   ```

   Hoặc nếu bạn đã bắt đầu với lệnh `jekyll new`, hãy thay thế `gem "minima", "~> 2.0"` bằng gem bạn muốn, ví dụ:

   ```diff
   # ./Gemfile

   - gem "minima", "~> 2.5"
   + gem "jekyll-theme-minimal"
   ```

2. Cài đặt chủ đề:

   ```sh
   bundle install
   ```

3. Thêm phần sau vào `_config.yml` của trang web của bạn để kích hoạt chủ đề:

   ```yaml
   theme: jekyll-theme-minimal
   ```

4. Xây dựng trang web của bạn:

   ```sh
   bundle exec jekyll serve
   ```

{: .note .info}
Bạn có thể có nhiều chủ đề được liệt kê trong `Gemfile` của trang web của bạn, nhưng chỉ có một chủ đề có thể được chọn trong `_config.yml` của trang web của bạn.

Nếu bạn đang xuất bản trang web Jekyll của mình trên [GitHub Pages](https://pages.github.com/), lưu ý rằng GitHub Pages chỉ hỗ trợ [một số chủ đề dựa trên gem](https://pages.github.com/themes/). GitHub Pages cũng hỗ trợ [sử dụng bất kỳ chủ đề nào được lưu trữ trên GitHub](https://help.github.com/articles/adding-a-jekyll-theme-to-your-github-pages-site/#adding-a-jekyll-theme-in-your-sites-_configyml-file) bằng cách sử dụng cấu hình `remote_theme` như thể nó là một chủ đề dựa trên gem.

## Tạo một chủ đề dựa trên gem

Nếu bạn là một nhà phát triển chủ đề Jekyll (thay vì là người tiêu dùng của các chủ đề), bạn có thể đóng gói chủ đề của mình trong RubyGems và cho phép người dùng cài đặt nó thông qua Bundler.

Nếu bạn không quen với việc tạo Ruby gems, đừng lo lắng. Jekyll sẽ giúp bạn tạo khung cho một chủ đề mới với lệnh `new-theme`. Chạy `jekyll new-theme` với tên chủ đề làm đối số.

Đây là một ví dụ:

```sh
jekyll new-theme jekyll-theme-awesome
    create /path/to/jekyll-theme-awesome/_layouts
    create /path/to/jekyll-theme-awesome/_includes
    create /path/to/jekyll-theme-awesome/_sass
    create /path/to/jekyll-theme-awesome/_layouts/page.html
    create /path/to/jekyll-theme-awesome/_layouts/post.html
    create /path/to/jekyll-theme-awesome/_layouts/default.html
    create /path/to/jekyll-theme-awesome/Gemfile
    create /path/to/jekyll-theme-awesome/jekyll-theme-awesome.gemspec
    create /path/to/jekyll-theme-awesome/README.md
    create /path/to/jekyll-theme-awesome/LICENSE.txt
    initialize /path/to/jekyll-theme-awesome/.git
    create /path/to/jekyll-theme-awesome/.gitignore
Chủ đề Jekyll mới của bạn, jekyll-theme-awesome, đã sẵn sàng cho bạn trong /path/to/jekyll-theme-awesome!
Để được trợ giúp bắt đầu, hãy đọc /path/to/jekyll-theme-awesome/README.md.
```

Thêm các tệp mẫu của bạn vào các thư mục tương ứng. Sau đó hoàn thành `.gemspec` và các tệp README theo nhu cầu của bạn.

### Bố cục và bao gồm

Các bố cục và bao gồm của chủ đề hoạt động giống như cách chúng hoạt động trong bất kỳ trang web Jekyll nào. Đặt các bố cục trong thư mục `/_layouts` của chủ đề của bạn, và đặt các bao gồm trong thư mục `/_includes` của chủ đề của bạn.

Ví dụ, nếu chủ đề của bạn có một tệp `/_layouts/page.html`, và một trang có `layout: page` trong front matter của nó, Jekyll trước tiên sẽ tìm trong thư mục `_layouts` của trang web cho bố cục `page`, và nếu không tồn tại, sẽ sử dụng bố cục `page` của chủ đề của bạn.

### Tài sản (Assets)

Bất kỳ tệp nào trong `/assets` sẽ được sao chép sang trang web của người dùng khi xây dựng trừ khi họ có một tệp có cùng đường dẫn tương đối. Bạn có thể gửi bất kỳ loại tài sản nào ở đây: SCSS, hình ảnh, webfont, v.v. Các tệp này hoạt động giống như các trang và tệp tĩnh trong Jekyll:

- Nếu tệp có [front matter](/docs/front-matter/) ở đầu, nó sẽ được hiển thị.
- Nếu tệp không có front matter, nó sẽ chỉ đơn giản là được sao chép sang trang web kết quả.

Điều này cho phép những người tạo chủ đề gửi một tệp `/assets/styles.scss` mặc định mà các bố cục của họ có thể phụ thuộc vào như `/assets/styles.css`.

Tất cả các tệp trong `/assets` sẽ được xuất vào trang web đã biên dịch trong thư mục `/assets` giống như bạn mong đợi từ việc sử dụng Jekyll trên các trang web của mình.

### Bảng định kiểu

Các bảng định kiểu của chủ đề của bạn nên được đặt trong thư mục `_sass` của chủ đề của bạn, một lần nữa, giống như bạn sẽ làm khi tác giả một trang web Jekyll.

```
_sass
└── jekyll-theme-awesome.scss
```

Các kiểu của chủ đề của bạn có thể được bao gồm trong bảng định kiểu của người dùng bằng cách sử dụng chỉ thị `@import`.

{% raw %}

```css
@import "{{ site.theme }}";
```

{% endraw %}

### Phụ thuộc gem chủ đề {%- include docs_version_badge.html version="3.5.0" -%}

Jekyll sẽ tự động yêu cầu tất cả các `runtime_dependencies` đã được đưa vào danh sách trắng của gem chủ đề của bạn ngay cả khi chúng không được bao gồm rõ ràng dưới mảng `plugins` trong tệp cấu hình của trang web. (Lưu ý: việc đưa vào danh sách trắng chỉ được yêu cầu khi xây dựng hoặc phục vụ với tùy chọn `--safe`.)

Với điều này, người dùng cuối không cần phải theo dõi các plugin cần thiết để được bao gồm trong tệp cấu hình của họ để gem chủ đề của họ hoạt động như dự định.

### Cấu hình trước các Gem chủ đề {%- include docs_version_badge.html version="4.0" -%}

Jekyll sẽ đọc một `_config.yml` tại gốc của gem chủ đề và hợp nhất dữ liệu của nó vào dữ liệu cấu hình hiện có của trang web.

Nhưng không giống như các thực thể khác được tải từ bên trong chủ đề, việc tải tệp cấu hình đi kèm với một vài hạn chế, như được tóm tắt dưới đây:

- Các cài đặt mặc định của Jekyll không thể bị ghi đè bởi một cấu hình chủ đề. *Quả bóng đó vẫn nằm trong sân của người dùng.*
- Tệp cấu hình chủ đề không thể là một liên kết tượng trưng (symlink), bất kể `chế độ an toàn` và liệu tệp được trỏ đến bởi liên kết tượng trưng có phải là một tệp hợp pháp trong gem chủ đề hay không.
- Cấu hình chủ đề nên là một tập hợp các cặp khóa-giá trị. Một tệp cấu hình trống, một tệp cấu hình chỉ đơn giản là *liệt kê các mục* dưới một khóa, hoặc một tệp cấu hình chỉ với một chuỗi văn bản đơn giản sẽ đơn giản bị bỏ qua một cách âm thầm. Người dùng sẽ không nhận được cảnh báo hoặc bất kỳ đầu ra nhật ký nào liên quan đến sự khác biệt này.
- Bất kỳ cài đặt nào được định nghĩa bởi cấu hình chủ đề đều có thể bị ghi đè bởi người dùng.

Mặc dù tính năng này là để cho phép áp dụng chủ đề dễ dàng hơn, các hạn chế đảm bảo rằng cấu hình chủ đề không thể ảnh hưởng đến việc xây dựng theo cách đáng lo ngại. Bất kỳ plugin nào được yêu cầu bởi chủ đề sẽ phải được liệt kê thủ công bởi người dùng hoặc được cung cấp bởi tệp `gemspec` của chủ đề.

Tính năng này sẽ cho phép gem chủ đề hoạt động với *các biến cấu hình cụ thể cho chủ đề* ngay lập tức.

### Tài liệu hóa chủ đề của bạn

Chủ đề của bạn nên bao gồm một tệp `/README.md`, giải thích cách các tác giả trang web có thể cài đặt và sử dụng chủ đề của bạn. Những bố cục nào được bao gồm? Những bao gồm nào? Họ có cần thêm bất cứ điều gì đặc biệt vào tệp cấu hình trang web của họ không?

### Thêm ảnh chụp màn hình

Các chủ đề là trực quan. Cho người dùng thấy chủ đề của bạn trông như thế nào bằng cách bao gồm một ảnh chụp màn hình dưới dạng `/screenshot.png` trong kho lưu trữ của chủ đề của bạn nơi nó có thể được truy xuất theo chương trình. Bạn cũng có thể bao gồm ảnh chụp màn hình này trong tài liệu của chủ đề của bạn.

### Xem trước chủ đề của bạn

Để xem trước chủ đề của bạn khi bạn đang tác giả nó, có thể hữu ích khi thêm nội dung giả vào, ví dụ, các tệp `/index.html` và `/page.html`. Điều này sẽ cho phép bạn sử dụng các lệnh `jekyll build` và `jekyll serve` để xem trước chủ đề của bạn, giống như bạn xem trước một trang web Jekyll.

{: .note .info}
Nếu bạn xem trước chủ đề của mình cục bộ, hãy chắc chắn thêm `/_site` vào tệp `.gitignore` của chủ đề của bạn để ngăn trang web đã biên dịch cũng được bao gồm khi bạn phân phối chủ đề của mình.

### Xuất bản chủ đề của bạn

Các chủ đề được xuất bản qua [RubyGems.org](https://rubygems.org). Bạn sẽ cần một tài khoản RubyGems, mà bạn có thể [tạo miễn phí](https://rubygems.org/sign_up).

1. Đầu tiên, bạn cần có nó trong một kho lưu trữ git:

   ```sh
   git init # Chỉ lần đầu tiên
   git add -A
   git commit -m "Init commit"
   ```

2. Tiếp theo, đóng gói chủ đề của bạn, bằng cách chạy lệnh sau, thay thế `jekyll-theme-awesome` bằng tên chủ đề của bạn:

   ```sh
   gem build jekyll-theme-awesome.gemspec
   ```

3. Cuối cùng, đẩy chủ đề đã đóng gói của bạn lên dịch vụ RubyGems, bằng cách chạy lệnh sau, một lần nữa thay thế `jekyll-theme-awesome` bằng tên chủ đề của bạn:

   ```sh
   gem push jekyll-theme-awesome-*.gem
   ```

4. Để phát hành một phiên bản mới của chủ đề của bạn, hãy cập nhật số phiên bản trong tệp gemspec, ( `jekyll-theme-awesome.gemspec` trong ví dụ này ), và sau đó lặp lại các Bước 1 - 3 ở trên. Chúng tôi khuyên bạn nên tuân theo [Semantic Versioning](https://semver.org) trong khi tăng phiên bản chủ đề của bạn.
