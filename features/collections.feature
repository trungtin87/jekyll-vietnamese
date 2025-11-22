Tính năng: Collections
  As a hacker who likes to structure content
  I want to be able to create collections of similar information
  Và render them

  Kịch bản: Unrendered collection
    Giả sử I have an "index.html" page that contains "Collections: {{ site.methods }}"
    Và I have fixture collections
    Và I have a "_methods/static-file.txt" file that contains "Static Content {{ site.title }}"
    Và I have a configuration với "collections" set to "['methods']"
    Khi I run jekyll build
    Thì I should get a zero exit status
    Và thư mục _site nên tồn tại
    Nhưng the _site/methods không nên tồn tại
    Và the "_site/methods/configuration.html" không nên tồn tại
    Và the "_site/methods/static-file.txt" không nên tồn tại

  Kịch bản: Rendered collection
    Giả sử I have an "index.html" page that contains "Collections: output => {{ site.collections[0].output }} label => {{ site.collections[0].label }}"
    Và I have an "collection_metadata.html" page that contains "Methods metadata: {{ site.collections[0].foo }} {{ site.collections[0] }}"
    Và I have fixture collections
    Và I have a "_methods/static-file.txt" file that contains "Static Content {{ site.title }}"
    Và I have a "_config.yml" với nội dung:
    """
    collections:
      methods:
        output: true
        foo:   bar
    """
    Khi I run jekyll build
    Thì I should get a zero exit status
    Và thư mục _site nên tồn tại
    Và I should see "Collections: output => true" in "_site/index.html"
    Và I should see "label => methods" in "_site/index.html"
    Và I should see "Methods metadata: bar" in "_site/collection_metadata.html"
    Và I should see "<p>Whatever: foo.bar</p>" in "_site/methods/configuration.html"
    Và I should see "Static Content {{ site.title }}" in "_site/methods/static-file.txt"

  Kịch bản: Rendered collection at a custom URL
    Giả sử I have an "index.html" page that contains "Collections: {{ site.collections }}"
    Và I have fixture collections
    Và I have a "_config.yml" với nội dung:
    """
    collections:
      methods:
        output: true
        permalink: /:collection/:path/
    """
    Khi I run jekyll build
    Thì I should get a zero exit status
    Và thư mục _site nên tồn tại
    Và I should see "<p>Whatever: foo.bar</p>" in "_site/methods/configuration/index.html"

  Kịch bản: Rendered document in a layout
    Giả sử I have an "index.html" page that contains "Collections: output => {{ site.collections[0].output }} label => {{ site.collections[0].label }} foo => {{ site.collections[0].foo }}"
    Và I have a default layout that contains "<div class='title'>Tom Preston-Werner</div> {{content}}"
    Và I have fixture collections
    Và I have a "_config.yml" với nội dung:
    """
    collections:
      methods:
        output: true
        foo:   bar
    """
    Khi I run jekyll build
    Thì I should get a zero exit status
    Và thư mục _site nên tồn tại
    Và I should see "Collections: output => true" in "_site/index.html"
    Và I should see "label => methods" in "_site/index.html"
    Và I should see "foo => bar" in "_site/index.html"
    Và I should see "<p>Run your generators! default</p>" in "_site/methods/site/generate.html"
    Và I should see "<div class='title'>Tom Preston-Werner</div>" in "_site/methods/site/generate.html"

  Kịch bản: Collections specified as an array
    Giả sử I have an "index.html" page that contains "Collections: {% for method in site.methods %}{{ method.relative_path }} {% endfor %}"
    Và I have fixture collections
    Và I have a "_config.yml" với nội dung:
    """
    collections:
    - methods
    """
    Khi I run jekyll build
    Thì I should get a zero exit status
    Thì thư mục _site nên tồn tại
    Và I should see "Collections: _methods/3940394-21-9393050-fifif1323-test.md _methods/collection/entries _methods/configuration.md _methods/escape-\+ #%20\[\].md _methods/sanitized_path.md _methods/site/generate.md _methods/site/initialize.md _methods/trailing-dots...md _methods/um_hi.md" in "_site/index.html" if platform supports symlinks
    Và I should see "Collections: _methods/3940394-21-9393050-fifif1323-test.md _methods/collection/entries _methods/configuration.md _methods/escape-\+ #%20\[\].md _methods/sanitized_path.md _methods/site/generate.md _methods/site/initialize.md _methods/trailing-dots...md _methods/yaml_with_dots.md" in "_site/index.html" if platform does not support symlinks

  Kịch bản: Collections specified as an hash
    Giả sử I have an "index.html" page that contains "Collections: {% for method in site.methods %}{{ method.relative_path }} {% endfor %}"
    Và I have fixture collections
    Và I have a "_config.yml" với nội dung:
    """
    collections:
    - methods
    """
    Khi I run jekyll build
    Thì I should get a zero exit status
    Thì thư mục _site nên tồn tại
    Và I should see "Collections: _methods/3940394-21-9393050-fifif1323-test.md _methods/collection/entries _methods/configuration.md _methods/escape-\+ #%20\[\].md _methods/sanitized_path.md _methods/site/generate.md _methods/site/initialize.md _methods/trailing-dots...md _methods/um_hi.md" in "_site/index.html" if platform supports symlinks
    Và I should see "Collections: _methods/3940394-21-9393050-fifif1323-test.md _methods/collection/entries _methods/configuration.md _methods/escape-\+ #%20\[\].md _methods/sanitized_path.md _methods/site/generate.md _methods/site/initialize.md _methods/trailing-dots...md _methods/yaml_with_dots.md" in "_site/index.html" if platform does not support symlinks

  Kịch bản: Rendered collection with document with future date
    Giả sử I have a _puppies directory
    Và I have the following documents under the puppies collection:
      | title  | date       | content             |
      | Rover  | 2007-12-31 | content for Rover.  |
      | Fido   | 2120-12-31 | content for Fido.   |
    Và I have a "_config.yml" với nội dung:
    """
    collections:
      puppies:
        output: true
    """
    Khi I run jekyll build
    Thì I should get a zero exit status
    Và thư mục _site nên tồn tại
    Và I should see "content for Rover" in "_site/puppies/rover.html"
    Và the "_site/puppies/fido.html" không nên tồn tại
    Khi I run jekyll build --future
    Thì I should get a zero exit status
    Và thư mục _site nên tồn tại
    Và the "_site/puppies/fido.html" nên tồn tại

  Kịch bản: Access rendered collection with future dated document via Liquid
    Giả sử I have a _puppies directory
    Và I have the following documents under the puppies collection:
      | title  | date       | content             |
      | Rover  | 2007-12-31 | content for Rover.  |
      | Fido   | 2120-12-31 | content for Fido.   |
    Và I have a "_config.yml" với nội dung:
    """
    collections:
      puppies:
        output: true
    """
    Và I have a "index.html" page that contains "Newest puppy: {% assign puppy = site.puppies.last %}{{ puppy.title }}"
    Khi I run jekyll build
    Thì I should get a zero exit status
    Và thư mục _site nên tồn tại
    Và I should see "Newest puppy: Fido" in "_site/index.html"
    Nhưng the "_site/puppies/fido.html" không nên tồn tại
    Khi I run jekyll build --future
    Thì I should get a zero exit status
    Và thư mục _site nên tồn tại
    Và I should see "Newest puppy: Fido" in "_site/index.html"
    Và the "_site/puppies/fido.html" nên tồn tại

  Kịch bản: Access rendered and published collection documents via Liquid
    Giả sử I have a _puppies directory
    Và I have the following documents under the puppies collection:
      | title  | date       | content             | published |
      | Rover  | 2007-12-31 | content for Rover.  | true      |
      | Figor  | 2007-12-31 | content for Figor.  | false     |
      | Snowy  | 2199-12-31 | content for Snowy.  | true      |
      | Hardy  | 2199-12-31 | content for Hardy.  | false     |
    Và I have a "_config.yml" với nội dung:
    """
    collections:
      puppies:
        output: true
    """
    Và I have a "index.md" page that contains "{% for puppy in site.puppies %}<div>{{ puppy.title }}</div>{% endfor %}"
    Khi I run jekyll build
    Thì I should get a zero exit status
    Và thư mục _site nên tồn tại
    Và I should see "<div>Rover</div>" in "_site/index.html"
    Nhưng I should see "<div>Snowy</div>" in "_site/index.html"
    Và I should not see "<div>Figor</div>" in "_site/index.html"
    Và I should not see "<div>Hardy</div>" in "_site/index.html"
    Và the "_site/puppies/rover.html" nên tồn tại
    Và the "_site/puppies/figor.html" không nên tồn tại
    Và the "_site/puppies/snowy.html" không nên tồn tại
    Và the "_site/puppies/hardy.html" không nên tồn tại
    Khi I run jekyll build --future
    Thì I should get a zero exit status
    Và thư mục _site nên tồn tại
    Và I should see "<div>Rover</div>" in "_site/index.html"
    Và I should see "<div>Snowy</div>" in "_site/index.html"
    Và I should not see "<div>Figor</div>" in "_site/index.html"
    Nhưng I should not see "<div>Hardy</div>" in "_site/index.html"
    Và the "_site/puppies/rover.html" nên tồn tại
    Và the "_site/puppies/figor.html" không nên tồn tại
    Và the "_site/puppies/hardy.html" không nên tồn tại
    Nhưng the "_site/puppies/snowy.html" nên tồn tại

  Kịch bản: Unrendered collection with future dated document
    Giả sử I have a _puppies directory
    Và I have the following documents under the puppies collection:
      | title  | date       | content             |
      | Rover  | 2007-12-31 | content for Rover.  |
      | Fido   | 2120-12-31 | content for Fido.   |
    Và I have a "_config.yml" với nội dung:
    """
    collections:
      puppies:
        output: false
    """
    Và I have a "foo.txt" chứa nội dung "random static file"
    Khi I run jekyll build
    Thì I should get a zero exit status
    Và thư mục _site nên tồn tại
    Và the "_site/puppies/rover.html" không nên tồn tại
    Và the "_site/puppies/fido.html" không nên tồn tại
    Khi I run jekyll build --future
    Thì I should get a zero exit status
    Và thư mục _site nên tồn tại
    Và the "_site/puppies/fido.html" không nên tồn tại

  Kịch bản: Access unrendered collection with future dated document via Liquid
    Giả sử I have a _puppies directory
    Và I have the following documents under the puppies collection:
      | title  | date       | content             |
      | Rover  | 2007-12-31 | content for Rover.  |
      | Fido   | 2120-12-31 | content for Fido.   |
    Và I have a "_config.yml" với nội dung:
    """
    collections:
      puppies:
        output: false
    """
    Và I have a "index.html" page that contains "Newest puppy: {% assign puppy = site.puppies.last %}{{ puppy.title }}"
    Khi I run jekyll build
    Thì I should get a zero exit status
    Và thư mục _site nên tồn tại
    Và I should see "Newest puppy: Fido" in "_site/index.html"
    Nhưng the "_site/puppies/fido.html" không nên tồn tại
    Khi I run jekyll build --future
    Thì I should get a zero exit status
    Và thư mục _site nên tồn tại
    Và I should see "Newest puppy: Fido" in "_site/index.html"
    Và the "_site/puppies/fido.html" không nên tồn tại

  Kịch bản: Access unrendered but publishable collection documents via Liquid
    Giả sử I have a _puppies directory
    Và I have the following documents under the puppies collection:
      | title  | date       | content             | published |
      | Rover  | 2007-12-31 | content for Rover.  | true      |
      | Figor  | 2007-12-31 | content for Figor.  | false     |
      | Snowy  | 2199-12-31 | content for Snowy.  | true      |
      | Hardy  | 2199-12-31 | content for Hardy.  | false     |
    Và I have a "_config.yml" với nội dung:
    """
    collections:
      puppies:
        output: false
    """
    Và I have a "index.md" page that contains "{% for puppy in site.puppies %}<div>{{ puppy.title }}</div>{% endfor %}"
    Khi I run jekyll build
    Thì I should get a zero exit status
    Và thư mục _site nên tồn tại
    Và I should see "<div>Rover</div>" in "_site/index.html"
    Nhưng I should see "<div>Snowy</div>" in "_site/index.html"
    Và I should not see "<div>Figor</div>" in "_site/index.html"
    Và I should not see "<div>Hardy</div>" in "_site/index.html"
    Và the "_site/puppies/rover.html" không nên tồn tại
    Và the "_site/puppies/figor.html" không nên tồn tại
    Và the "_site/puppies/snowy.html" không nên tồn tại
    Và the "_site/puppies/hardy.html" không nên tồn tại
    Khi I run jekyll build --future
    Thì I should get a zero exit status
    Và thư mục _site nên tồn tại
    Và I should see "<div>Rover</div>" in "_site/index.html"
    Và I should see "<div>Snowy</div>" in "_site/index.html"
    Và I should not see "<div>Figor</div>" in "_site/index.html"
    Nhưng I should not see "<div>Hardy</div>" in "_site/index.html"
    Và the "_site/puppies/rover.html" không nên tồn tại
    Và the "_site/puppies/figor.html" không nên tồn tại
    Và the "_site/puppies/snowy.html" không nên tồn tại
    Và the "_site/puppies/hardy.html" không nên tồn tại

  Kịch bản: Access rendered collection with future date and unpublished flag via Liquid
    Giả sử I have a _puppies directory
    Và I have the following documents under the puppies collection:
      | title  | date       | content             | published |
      | Rover  | 2007-12-31 | content for Rover.  | true      |
      | Figor  | 2007-12-31 | content for Figor.  | false     |
      | Snowy  | 2199-12-31 | content for Snowy.  | true      |
      | Hardy  | 2199-12-31 | content for Hardy.  | false     |
    Và I have a "_config.yml" với nội dung:
    """
    collections:
      puppies:
        output: true
    """
    Và I have a "index.md" page that contains "{% for puppy in site.puppies %}<div>{{ puppy.title }}</div>{% endfor %}"
    Khi I run jekyll build
    Thì I should get a zero exit status
    Và thư mục _site nên tồn tại
    Và I should see "<div>Rover</div>" in "_site/index.html"
    Nhưng I should see "<div>Snowy</div>" in "_site/index.html"
    Và I should not see "<div>Figor</div>" in "_site/index.html"
    Và I should not see "<div>Hardy</div>" in "_site/index.html"
    Và the "_site/puppies/rover.html" nên tồn tại
    Và the "_site/puppies/snowy.html" không nên tồn tại
    Và the "_site/puppies/figor.html" không nên tồn tại
    Và the "_site/puppies/hardy.html" không nên tồn tại
    Khi I run jekyll build --unpublished
    Thì I should get a zero exit status
    Và thư mục _site nên tồn tại
    Và I should see "<div>Rover</div>" in "_site/index.html"
    Và I should see "<div>Snowy</div>" in "_site/index.html"
    Và I should see "<div>Figor</div>" in "_site/index.html"
    Nhưng I should see "<div>Hardy</div>" in "_site/index.html"
    Và the "_site/puppies/rover.html" nên tồn tại
    Và the "_site/puppies/snowy.html" không nên tồn tại
    Và the "_site/puppies/figor.html" nên tồn tại
    Và the "_site/puppies/hardy.html" không nên tồn tại
    Khi I run jekyll build --unpublished --future
    Thì I should get a zero exit status
    Và thư mục _site nên tồn tại
    Và I should see "<div>Rover</div>" in "_site/index.html"
    Và I should see "<div>Snowy</div>" in "_site/index.html"
    Và I should see "<div>Figor</div>" in "_site/index.html"
    Nhưng I should see "<div>Hardy</div>" in "_site/index.html"
    Và the "_site/puppies/rover.html" nên tồn tại
    Và the "_site/puppies/snowy.html" nên tồn tại
    Và the "_site/puppies/figor.html" nên tồn tại
    Và the "_site/puppies/hardy.html" nên tồn tại

  Kịch bản: Access unrendered collection with future date and unpublished flag via Liquid
    Giả sử I have a _puppies directory
    Và I have the following documents under the puppies collection:
      | title  | date       | content             | published |
      | Rover  | 2007-12-31 | content for Rover.  | true      |
      | Figor  | 2007-12-31 | content for Figor.  | false     |
      | Snowy  | 2199-12-31 | content for Snowy.  | true      |
      | Hardy  | 2199-12-31 | content for Hardy.  | false     |
    Và I have a "_config.yml" với nội dung:
    """
    collections:
      puppies:
        output: false
    """
    Và I have a "index.md" page that contains "{% for puppy in site.puppies %}<div>{{ puppy.title }}</div>{% endfor %}"
    Khi I run jekyll build
    Thì I should get a zero exit status
    Và thư mục _site nên tồn tại
    Và I should see "<div>Rover</div>" in "_site/index.html"
    Nhưng I should see "<div>Snowy</div>" in "_site/index.html"
    Và I should not see "<div>Figor</div>" in "_site/index.html"
    Và I should not see "<div>Hardy</div>" in "_site/index.html"
    Và the "_site/puppies/rover.html" không nên tồn tại
    Và the "_site/puppies/snowy.html" không nên tồn tại
    Và the "_site/puppies/figor.html" không nên tồn tại
    Và the "_site/puppies/hardy.html" không nên tồn tại
    Khi I run jekyll build --unpublished
    Thì I should get a zero exit status
    Và thư mục _site nên tồn tại
    Và I should see "<div>Rover</div>" in "_site/index.html"
    Và I should see "<div>Snowy</div>" in "_site/index.html"
    Và I should see "<div>Figor</div>" in "_site/index.html"
    Nhưng I should see "<div>Hardy</div>" in "_site/index.html"
    Và the "_site/puppies/rover.html" không nên tồn tại
    Và the "_site/puppies/snowy.html" không nên tồn tại
    Và the "_site/puppies/figor.html" không nên tồn tại
    Và the "_site/puppies/hardy.html" không nên tồn tại
    Khi I run jekyll build --unpublished --future
    Thì I should get a zero exit status
    Và thư mục _site nên tồn tại
    Và I should see "<div>Rover</div>" in "_site/index.html"
    Và I should see "<div>Snowy</div>" in "_site/index.html"
    Và I should see "<div>Figor</div>" in "_site/index.html"
    Nhưng I should see "<div>Hardy</div>" in "_site/index.html"
    Và the "_site/puppies/rover.html" không nên tồn tại
    Và the "_site/puppies/snowy.html" không nên tồn tại
    Và the "_site/puppies/figor.html" không nên tồn tại
    Và the "_site/puppies/hardy.html" không nên tồn tại

  Kịch bản: All the documents
    Giả sử I have an "index.html" page that contains "All documents: {% for doc in site.documents %}{{ doc.relative_path }} {% endfor %}"
    Và I have fixture collections
    Và I have a "_config.yml" với nội dung:
    """
    collections:
    - methods
    """
    Khi I run jekyll build
    Thì I should get a zero exit status
    Thì thư mục _site nên tồn tại
    Và I should see "All documents: _methods/3940394-21-9393050-fifif1323-test.md _methods/collection/entries _methods/configuration.md _methods/escape-\+ #%20\[\].md _methods/sanitized_path.md _methods/site/generate.md _methods/site/initialize.md _methods/trailing-dots...md _methods/um_hi.md" in "_site/index.html" if platform supports symlinks
    Và I should see "All documents: _methods/3940394-21-9393050-fifif1323-test.md _methods/collection/entries _methods/configuration.md _methods/escape-\+ #%20\[\].md _methods/sanitized_path.md _methods/site/generate.md _methods/site/initialize.md _methods/trailing-dots...md _methods/yaml_with_dots.md" in "_site/index.html" if platform does not support symlinks

  Kịch bản: Documents have an output attribute, which is the converted HTML
    Giả sử I have an "index.html" page that contains "Second document's output: {{ site.documents[2].output }}"
    Và I have fixture collections
    Và I have a "_config.yml" với nội dung:
    """
    collections:
    - methods
    """
    Khi I run jekyll build
    Thì I should get a zero exit status
    Thì thư mục _site nên tồn tại
    Và I should see "Second document's output: <p>Use <code class=\"language-plaintext highlighter-rouge\">Jekyll.configuration</code> to build a full configuration for use w/Jekyll.</p>\n\n<p>Whatever: foo.bar</p>" in "_site/index.html"

  Kịch bản: Documents have an output attribute, which is the converted HTML based on site.config
    Giả sử I have an "index.html" page that contains "Second document's output: {{ site.documents[2].output }}"
    Và I have fixture collections
    Và I have a "_config.yml" với nội dung:
    """
    kramdown:
      guess_lang: false
    collections:
    - methods
    """
    Khi I run jekyll build
    Thì I should get a zero exit status
    Thì thư mục _site nên tồn tại
    Và I should see "Second document's output: <p>Use <code>Jekyll.configuration</code> to build a full configuration for use w/Jekyll.</p>\n\n<p>Whatever: foo.bar</p>" in "_site/index.html"

  Kịch bản: Filter documents by where
    Giả sử I have an "index.html" page that contains "{% assign items = site.methods | where: 'whatever','foo.bar' %}Item count: {{ items.size }}"
    Và I have fixture collections
    Và I have a "_config.yml" với nội dung:
    """
    collections:
    - methods
    """
    Khi I run jekyll build
    Thì I should get a zero exit status
    Và thư mục _site nên tồn tại
    Và I should see "Item count: 2" in "_site/index.html"

  Kịch bản: Sort by title
    Giả sử I have an "index.html" page that contains "{% assign items = site.methods | sort: 'title' %}2. of {{ items.size }}: {{ items[2].output }}"
    Và I have fixture collections
    Và I have a "_config.yml" với nội dung:
    """
    collections:
    - methods
    """
    Khi I run jekyll build
    Thì I should get a zero exit status
    Và thư mục _site nên tồn tại
    Và I should see "2. of 10: <p>vớiout title.</p>" in "_site/index.html" if platform supports symlinks
    Và I should see "2. of 9: <p>vớiout title.</p>" in "_site/index.html" if platform does not support symlinks

  Kịch bản: Sort by relative_path
    Giả sử I have an "index.html" page that contains "Collections: {% assign methods = site.methods | sort: 'relative_path' %}{{ methods | map:"title" | join: ", " }}"
    Và I have fixture collections
    Và I have a "_config.yml" với nội dung:
    """
    collections:
    - methods
    """
    Khi I run jekyll build
    Thì I should get a zero exit status
    Thì thư mục _site nên tồn tại
    Và I should see "Collections: this is a test!, Collection#entries, Jekyll.configuration, Jekyll.escape, Jekyll.sanitized_path, Site#generate, Initialize, Ellipsis Path, Site#generate, YAML with Dots" in "_site/index.html" if platform supports symlinks
    Và I should see "Collections: this is a test!, Collection#entries, Jekyll.configuration, Jekyll.escape, Jekyll.sanitized_path, Site#generate, Initialize, Ellipsis Path, YAML with Dots" in "_site/index.html" if platform does not support symlinks

  Kịch bản: Sort all entries by a Front Matter key defined in all entries
    Giả sử I have an "index.html" page that contains "Collections: {{ site.tutorials | map: 'title' | join: ', ' }}"
    Và I have fixture collections
    Và I have a thư mục _layouts
    Và I have a "_layouts/tutorial.html" với nội dung:
    """
    {% if page.previous %}Previous: {{ page.previous.title }}{% endif %}

    {% if page.next %}Next: {{ page.next.title }}{% endif %}
    """
    Và I have a "_config.yml" với nội dung:
    """
    collections:
      tutorials:
        output: true
        sort_by: lesson

    defaults:
      - scope:
          path: ""
          type: tutorials
        values:
          layout: tutorial

    """
    Khi I run jekyll build
    Thì I should get a zero exit status
    Thì thư mục _site nên tồn tại
    Và I should see "Collections: Getting Started, Let's Roll!, Dive-In and Publish Already!, Tip of the Iceberg, Extending with Plugins, Graduation Day" in "_site/index.html"
    Và I should not see "Previous: Graduation Day" in "_site/tutorials/lets-roll.html"
    Và I should not see "Next: Tip of the Iceberg" in "_site/tutorials/lets-roll.html"
    Nhưng I should see "Previous: Getting Started" in "_site/tutorials/lets-roll.html"
    Và I should see "Next: Dive-In and Publish Already!" in "_site/tutorials/lets-roll.html"

  Kịch bản: Sort all entries by a Front Matter key defined in only some entries
    Giả sử I have an "index.html" page that contains "Collections: {{ site.tutorials | map: 'title' | join: ', ' }}"
    Và I have fixture collections
    Và I have a thư mục _layouts
    Và I have a "_layouts/tutorial.html" với nội dung:
    """
    {% if page.previous %}Previous: {{ page.previous.title }}{% endif %}

    {% if page.next %}Next: {{ page.next.title }}{% endif %}
    """
    Và I have a "_config.yml" với nội dung:
    """
    collections:
      tutorials:
        output: true
        sort_by: approx_time

    defaults:
    - scope:
        path: ""
        type: tutorials
      values:
        layout: tutorial

    """
    Khi I run jekyll build
    Thì I should get a zero exit status
    Thì thư mục _site nên tồn tại
    Và I should see "'approx_time' not defined" trong kết quả build
    Và I should see "Collections: Extending with Plugins, Let's Roll!, Getting Started, Graduation Day, Dive-In and Publish Already!, Tip of the Iceberg" in "_site/index.html"
    Và I should see "Previous: Getting Started" in "_site/tutorials/graduation-day.html"
    Và I should see "Next: Dive-In and Publish Already!" in "_site/tutorials/graduation-day.html"

  Kịch bản: Manually sort entries
    Giả sử I have an "index.html" page that contains "Collections: {{ site.tutorials | map: 'title' | join: ', ' }}"
    Và I have fixture collections
    Và I have a thư mục _layouts
    Và I have a "_layouts/tutorial.html" với nội dung:
    """
    {% if page.previous %}Previous: {{ page.previous.title }}{% endif %}

    {% if page.next %}Next: {{ page.next.title }}{% endif %}
    """
    Và I have a "_config.yml" với nội dung:
    """
    collections:
      tutorials:
        output: true
        order:
          - getting-started.md
          - tip-of-the-iceberg.md
          - lets-roll.md
          - dive-in-and-publish-already.md
          - graduation-day.md
          - random-plugins.md

    defaults:
      - scope:
          path: ""
          type: tutorials
        values:
          layout: tutorial

    """
    Khi I run jekyll build
    Thì I should get a zero exit status
    Thì thư mục _site nên tồn tại
    Và I should see "Collections: Getting Started, Tip of the Iceberg, Let's Roll!, Dive-In and Publish Already!, Graduation Day, Extending with Plugins" in "_site/index.html"
    Và I should not see "Previous: Graduation Day" in "_site/tutorials/lets-roll.html"
    Và I should not see "Next: Tip of the Iceberg" in "_site/tutorials/lets-roll.html"
    Nhưng I should see "Previous: Tip of the Iceberg" in "_site/tutorials/lets-roll.html"
    Và I should see "Next: Dive-In and Publish Already!" in "_site/tutorials/lets-roll.html"

  Kịch bản: Manually sort some entries
    Giả sử I have an "index.html" page that contains "Collections: {{ site.tutorials | map: 'title' | join: ', ' }}"
    Và I have fixture collections
    Và I have a thư mục _layouts
    Và I have a "_layouts/tutorial.html" với nội dung:
    """
    {% if page.previous %}Previous: {{ page.previous.title }}{% endif %}

    {% if page.next %}Next: {{ page.next.title }}{% endif %}
    """
    Và I have a "_config.yml" với nội dung:
    """
    collections:
      tutorials:
        output: true
        order:
          - getting-started.md
          - lets-roll.md
          - dive-in-and-publish-already.md
          - graduation-day.md

    defaults:
      - scope:
          path: ""
          type: tutorials
        values:
          layout: tutorial

    """
    Khi I run jekyll build
    Thì I should get a zero exit status
    Thì thư mục _site nên tồn tại
    Và I should see "Collections: Getting Started, Let's Roll!, Dive-In and Publish Already!, Graduation Day, Extending with Plugins, Tip of the Iceberg" in "_site/index.html"
    Và I should not see "Previous: Graduation Day" in "_site/tutorials/lets-roll.html"
    Và I should not see "Previous: Tip of the Iceberg" in "_site/tutorials/lets-roll.html"
    Và I should not see "Next: Tip of the Iceberg" in "_site/tutorials/lets-roll.html"
    Nhưng I should see "Previous: Getting Started" in "_site/tutorials/lets-roll.html"
    Và I should see "Next: Dive-In and Publish Already!" in "_site/tutorials/lets-roll.html"

  Kịch bản: Rendered collection with date/dateless filename
    Giả sử I have an "index.html" page that contains "Collections: {% for method in site.thanksgiving %}{{ method.title }} {% endfor %}"
    Và I have fixture collections
    Và I have a "_config.yml" với nội dung:
    """
    collections:
      thanksgiving:
        output: true
    """
    Khi I run jekyll build
    Thì I should get a zero exit status
    Và thư mục _site nên tồn tại
    Và I should see "Thanksgiving Black Friday" in "_site/index.html"
    Và I should see "Happy Thanksgiving" in "_site/thanksgiving/2015-11-26-thanksgiving.html"
    Và I should see "Black Friday" in "_site/thanksgiving/black-friday.html"

  Kịch bản: Rendered collection with custom permalinks and static file contents
    Giả sử I have fixture collections
    Và I have a "_config.yml" với nội dung:
    """
    collections:
      methods:
        output: true
        permalink: /:collection/:name
    """
    Khi I run jekyll build
    Thì I should get a zero exit status
    Và thư mục _site nên tồn tại
    Và I should see "I have no front matter." in "_site/methods/extensionless_static_file"

  Kịch bản: Rendered collection with an extensionless document
    Giả sử I have fixture collections
    Và I have a "_config.yml" với nội dung:
    """
    collections:
      methods:
        output: true
    """
    Khi I run jekyll build
    Thì I should get a zero exit status
    Và thư mục _site nên tồn tại
    Và I should see "I have no file extension but I should still be a part of the collection." in "_site/methods/collection/entries"

  Kịch bản: Rendered collection with an extensionless document in a strict site
    Giả sử I have fixture collections
    Và I have a thư mục _posts
    Và I have an "_posts/2019-12-26-extensioned.md" chứa nội dung "Hello!"
    Và I have an "_posts/2019-12-26-extensionless" chứa nội dung "Aloha!"
    Và I have an "index.md" page that contains "{{ site.posts | map: 'title' }}"
    Và I have a "_config.yml" với nội dung:
    """
    strict_front_matter: true
    collections:
      methods:
        output: true
    """
    Khi I run jekyll build
    Thì I should get a zero exit status
    Và thư mục _site nên tồn tại
    Và I should see "I have no file extension but I should still be a part of the collection." in "_site/methods/collection/entries"
    Và I should see "Extensioned" in "_site/index.html"
    Nhưng I should not see "Extensionless" in "_site/index.html"
