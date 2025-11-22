---
title: Biến (Variables)
permalink: /docs/variables/
---

Jekyll duyệt qua trang web của bạn để tìm các tệp cần xử lý. Bất kỳ tệp nào có
[front matter](/docs/front-matter/) đều phải chịu sự xử lý. Đối với mỗi tệp này,
Jekyll cung cấp nhiều dữ liệu khác nhau thông qua [Liquid](/docs/liquid/).
Dưới đây là tài liệu tham khảo về dữ liệu có sẵn.

## Biến Toàn cục (Global Variables)

{% include docs_variables_table.html scope=site.data.jekyll_variables.global %}

## Biến Trang web (Site Variables)

{% include docs_variables_table.html scope=site.data.jekyll_variables.site %}

## Biến Trang (Page Variables)

{% include docs_variables_table.html scope=site.data.jekyll_variables.page %}

<div class="note">
  <h5>Mẹo chuyên nghiệp™: Sử dụng Front Matter Tùy chỉnh</h5>
  <p>
    Bất kỳ front matter tùy chỉnh nào mà bạn chỉ định sẽ có sẵn dưới
    <code>page</code>. Ví dụ, nếu bạn chỉ định <code>custom_css: true</code>
    trong front matter của một trang, giá trị đó sẽ có sẵn dưới dạng <code>page.custom_css</code>.
  </p>
  <p>
    Nếu bạn chỉ định front matter trong một bố cục, hãy truy cập nó qua <code>layout</code>.
    Ví dụ, nếu bạn chỉ định <code>class: full_page</code> trong front matter của một bố cục,
    giá trị đó sẽ có sẵn dưới dạng <code>layout.class</code> trong bố cục và các cha của nó.
  </p>
</div>

## Biến Jekyll (Jekyll Variables)

{% include docs_variables_table.html scope=site.data.jekyll_variables.jekyll %}

## Biến Chủ đề (Theme Variables) {%- include docs_version_badge.html version="4.3.0" -%}

{: #theme-variables }

{% include docs_variables_table.html scope=site.data.jekyll_variables.theme %}

## Paginator

{% include docs_variables_table.html scope=site.data.jekyll_variables.paginator %}

<div class="note info">
  <h5>Tính khả dụng của biến Paginator</h5>
  <p>
    Những biến này chỉ có sẵn trong các tệp chỉ mục (index files), tuy nhiên chúng có thể nằm trong một thư mục con,
    chẳng hạn như <code>/blog/index.html</code>.
  </p>
</div>
