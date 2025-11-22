---
title: Tùy chọn Markdown (Markdown Options)
permalink: "/docs/configuration/markdown/"
---
Các trình kết xuất Markdown khác nhau được hỗ trợ bởi Jekyll đôi khi có thêm các tùy chọn
có sẵn.

## Kramdown

Kramdown là trình kết xuất Markdown mặc định cho Jekyll, và thường hoạt động tốt mà không cần cấu hình bổ sung. Tuy nhiên, nó hỗ trợ nhiều tùy chọn cấu hình.

### Bộ xử lý Kramdown (Kramdown Processor)

Theo mặc định, Jekyll sử dụng [bộ xử lý GitHub Flavored Markdown (GFM)](https://github.com/kramdown/parser-gfm) cho Kramdown. (Việc chỉ định `input: GFM` là tốt, nhưng dư thừa.) GFM hỗ trợ một vài tùy chọn Kramdown bổ sung, được ghi lại bởi [kramdown-parser-gfm](https://github.com/kramdown/parser-gfm). Các tùy chọn này có thể được sử dụng trực tiếp trong cấu hình Kramdown Jekyll của bạn, như thế này:

```yaml
kramdown:
  gfm_quirks: [paragraph_end]
```

Bạn cũng có thể thay đổi bộ xử lý được sử dụng bởi Kramdown (như được chỉ định cho khóa `input` trong [Kramdown RDoc](https://kramdown.gettalong.org/rdoc/Kramdown/Document.html#method-c-new)). Ví dụ, để sử dụng bộ xử lý Kramdown không phải GFM trong Jekyll, hãy thêm phần sau vào cấu hình của bạn.

```yaml
kramdown:
  input: Kramdown
```

Tài liệu cho các trình phân tích cú pháp Kramdown có sẵn trong [tài liệu Kramdown](https://kramdown.gettalong.org/parser/kramdown.html). Nếu bạn sử dụng trình phân tích cú pháp Kramdown khác ngoài Kramdown hoặc GFM, bạn sẽ cần thêm gem cho nó.

### Tô sáng Cú pháp (CodeRay)

Để sử dụng trình tô sáng cú pháp [CodeRay](http://coderay.rubychan.de/) với Kramdown, bạn cần thêm một phụ thuộc vào gem `kramdown-syntax-coderay`. Ví dụ, `bundle add kramdown-syntax-coderay`. Sau đó, bạn sẽ có thể chỉ định CodeRay trong cấu hình `syntax_highlighter` của mình:

```yaml
kramdown:
  syntax_highlighter: coderay
```

CodeRay hỗ trợ một số tùy chọn cấu hình riêng của nó, được ghi lại trong [tài liệu kramdown-syntax-coderay](https://github.com/kramdown/syntax-coderay) có thể được chuyển qua dưới dạng `syntax_highlighter_opts` như thế này:

```yaml
kramdown:
  syntax_highlighter: coderay
  syntax_highlighter_opts:
    line_numbers: table
    bold_every: 5
```

### Tùy chọn Kramdown Nâng cao

Kramdown hỗ trợ nhiều tùy chọn tương đối nâng cao khác như `header_offset` và `smart_quotes`. Những điều này được ghi lại trong [tài liệu cấu hình Kramdown](https://kramdown.gettalong.org/options.html) và có thể được thêm vào cấu hình Kramdown của bạn như thế này:

```yaml
kramdown:
  header_offset: 2
```

<div class="note warning">
  <h5>Có một số tùy chọn kramdown không được hỗ trợ</h5>
  <p>
    Xin lưu ý rằng Jekyll sử dụng trình chuyển đổi HTML của Kramdown. Các tùy chọn Kramdown chỉ được sử dụng bởi các trình chuyển đổi khác, chẳng hạn như <code>remove_block_html_tags</code> (được sử dụng bởi trình chuyển đổi RemoveHtmlTags), sẽ không hoạt động.
  </p>
</div>

## CommonMark

[CommonMark](https://commonmark.org/) là một phiên bản hợp lý hóa của cú pháp Markdown, được triển khai bằng C và do đó nhanh hơn Kramdown mặc định được triển khai bằng Ruby. Nó [hơi khác](https://github.com/commonmark/CommonMark#differences-from-original-markdown) so với Markdown gốc và không hỗ trợ tất cả các yếu tố cú pháp được triển khai trong Kramdown, như [Block Inline Attribute Lists](https://kramdown.gettalong.org/syntax.html#block-ials).

Nó có hai hương vị: CommonMark cơ bản với plugin [jekyll-commonmark](https://github.com/jekyll/jekyll-commonmark) và [GitHub Flavored Markdown được hỗ trợ bởi GitHub Pages](https://github.com/github/jekyll-commonmark-ghpages).

### Bộ xử lý Markdown Tùy chỉnh

Nếu bạn quan tâm đến việc tạo một bộ xử lý markdown tùy chỉnh, bạn thật may mắn! Tạo một lớp mới trong không gian tên `Jekyll::Converters::Markdown`:

```ruby
class Jekyll::Converters::Markdown::MyCustomProcessor
  def initialize(config)
    require 'funky_markdown'
    @config = config
  rescue LoadError
    STDERR.puts 'You are missing a library required for Markdown. Please run:'
    STDERR.puts '  $ [sudo] gem install funky_markdown'
    raise FatalException.new("Missing dependency: funky_markdown")
  end

  def convert(content)
    ::FunkyMarkdown.new(content).convert
  end
end
```

Khi bạn đã tạo lớp của mình và thiết lập nó đúng cách dưới dạng plugin trong thư mục `_plugins` hoặc dưới dạng gem, hãy chỉ định nó trong `_config.yml` của bạn:

```yaml
markdown: MyCustomProcessor
```
