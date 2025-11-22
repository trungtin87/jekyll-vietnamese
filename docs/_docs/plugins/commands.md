---
title: Lệnh (Commands)
permalink: /docs/plugins/commands/
---
Kể từ phiên bản {% include docs_version_badge.html version="2.5.0"%}, Jekyll có thể được mở rộng với các plugin cung cấp
các lệnh con cho tệp thực thi `jekyll`. Điều này có thể thực hiện được bằng cách bao gồm các
plugin liên quan trong một nhóm `Gemfile` được gọi là `:jekyll_plugins`:

```ruby
group :jekyll_plugins do
  gem "my_fancy_jekyll_plugin"
end
```

Mỗi `Command` phải là một lớp con của lớp `Jekyll::Command` và phải
chứa một phương thức lớp: `init_with_program`. Một ví dụ:

```ruby
class MyNewCommand < Jekyll::Command
  class << self
    def init_with_program(prog)
      prog.command(:new) do |c|
        c.syntax "new [options]"
        c.description 'Create a new Jekyll site.'

        c.option 'dest', '-d DEST', 'Where the site should go.'

        c.action do |args, options|
          Jekyll::Site.new_site_at(options['dest'])
        end
      end
    end
  end
end
```

Các lệnh nên triển khai phương thức lớp duy nhất này:

<div class="mobile-side-scroller">
<table>
  <thead>
    <tr>
      <th>Phương thức</th>
      <th>Mô tả</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>
        <p><code>init_with_program</code></p>
      </td>
      <td><p>
        Phương thức này chấp nhận một tham số, thể hiện
        <code><a href="https://github.com/jekyll/mercenary#readme">Mercenary::Program</a></code>,
        chính là chương trình Jekyll. Dựa trên chương trình,
        các lệnh có thể được tạo bằng cú pháp trên. Để biết thêm chi tiết,
        hãy truy cập kho lưu trữ Mercenary trên GitHub.com.
      </p></td>
    </tr>
  </tbody>
</table>
</div>
