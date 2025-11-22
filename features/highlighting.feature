Tính năng: Làm nổi bật cú pháp
  Là một hacker thích viết blog
  Tôi muốn chia sẻ các đoạn code trong blog của mình
  Và làm cho chúng đẹp mắt cho mọi người xem

  Kịch bản: làm nổi bật cấu hình apache
    Giả sử tôi có trang "index.html" với nội dung:
      """
      {% highlight apache %}
      RewriteEngine On
      RewriteCond %{REQUEST_FILENAME} !-f
      RewriteCond %{REQUEST_FILENAME} !-d
      RewriteRule ^(.*)$ index.php [QSA,L]
      {% endhighlight %}
      """
    Khi tôi chạy jekyll build
    Thì tôi nên nhận được trạng thái thoát bằng không
    Và tôi nên thấy "<span class=\"nc\">RewriteCond</span>" trong "_site/index.html"

  Kịch bản: đánh dấu dòng 1 và 2 trong khối code Ruby với cú pháp hợp lệ
    Giả sử tôi có trang "index.html" với nội dung:
      """
      {% highlight ruby mark_lines="1 2" %}
      module Jekyll
        module Tags
          class HighlightBlock < Liquid::Block
      {% endhighlight %}
      """
    Khi tôi chạy jekyll build
    Thì tôi nên nhận được trạng thái thoát bằng không
    Và tôi nên thấy "<span class=\"hll\"><span class=\"k\">module</span> <span class=\"nn\">Jekyll</span>" trong "_site/index.html"
    Và tôi nên thấy "<span class=\"hll\">  <span class=\"k\">module</span> <span class=\"nn\">Tags</span>" trong "_site/index.html"
    Và tôi nên thấy "<span class=\"k\">class</span> <span=\"nc\">HighlightBlock</span" trong "_site/index.html"

  Kịch bản: đánh dấu một dòng trong khối code Ruby với cú pháp không hợp lệ
    Giả sử tôi có trang "index.html" với nội dung:
      """
      {% highlight ruby mark_lines=1 %}
      module Jekyll
        module Tags
          class HighlightBlock < Liquid::Block
      {% endhighlight %}
      """
    Khi tôi chạy jekyll build
    Thì tôi nên thấy "Liquid Exception: Syntax Error" trong kết quả build
