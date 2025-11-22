Tính năng: Collections Directory
  As a hacker who likes to structure content without clutter
  I want to be able to organize my collections under a single directory
  Và render them from there

  Kịch bản: Custom collections_dir containing only posts
    Và I have a collections/thư mục _posts
    Và I have the following post within the "collections" directory:
      | title         | date       | content         |
      | Gathered Post | 2009-03-27 | Random Content. |
    Và I have a "_config.yml" với nội dung:
    """
    collections_dir: collections
    """
    Khi I run jekyll build
    Thì I should get a zero exit status
    Và thư mục _site nên tồn tại
    Và I should see "Random Content." in "_site/2009/03/27/gathered-post.html"

  Kịch bản: Rendered collection in custom collections_dir also containing posts
    Giả sử I have a collections/_puppies directory
    Và I have the following document under the "puppies" collection within the "collections" directory:
      | title  | date       | content            |
      | Rover  | 2007-12-31 | content for Rover. |
    Và I have a collections/thư mục _posts
    Và I have the following post within the "collections" directory:
      | title         | date       | content         |
      | Gathered Post | 2009-03-27 | Random Content. |
    Và I have a "_config.yml" với nội dung:
    """
    collections:
      puppies:
        output: true

    collections_dir: collections
    """
    Khi I run jekyll build
    Thì I should get a zero exit status
    Và thư mục _site nên tồn tại
    Và the "_site/puppies/rover.html" nên tồn tại
    Và I should see "Random Content." in "_site/2009/03/27/gathered-post.html"

  Kịch bản: Rendered collection in custom collections_dir with posts at the site root
    Giả sử I have a collections/_puppies directory
    Và I have the following document under the "puppies" collection within the "collections" directory:
      | title  | date       | content            |
      | Rover  | 2007-12-31 | content for Rover. |
    Và I have a thư mục _posts
    Và I have the following post:
      | title        | date       | content         |
      | Post At Root | 2009-03-27 | Random Content. |
    Và I have a "_config.yml" với nội dung:
    """
    collections:
      puppies:
        output: true

    collections_dir: collections
    """
    Khi I run jekyll build
    Thì I should get a zero exit status
    Và thư mục _site nên tồn tại
    Và the "_site/puppies/rover.html" nên tồn tại
    Và the "_site/2009/03/27/post-at-root.html" không nên tồn tại
    Và the _site/_posts không nên tồn tại

  Kịch bản: Rendered collection in custom collections_dir also containing drafts
    Giả sử I have a collections/_puppies directory
    Và I have the following document under the "puppies" collection within the "collections" directory:
      | title  | date       | content            |
      | Rover  | 2007-12-31 | content for Rover. |
    Và I have a collections/_drafts directory
    Và I have the following draft within the "collections" directory:
      | title          | date       | content         |
      | Gathered Draft | 2009-03-27 | Random Content. |
    Và I have a "_config.yml" với nội dung:
    """
    collections:
      puppies:
        output: true

    collections_dir: collections
    """
    Khi I run jekyll build --drafts
    Thì I should get a zero exit status
    Và thư mục _site nên tồn tại
    Và the "_site/puppies/rover.html" nên tồn tại
    Và I should see "Random Content." in "_site/2009/03/27/gathered-draft.html"
    Và the _site/collections không nên tồn tại

  Kịch bản: Rendered collection in custom collections_dir with drafts at the site root
    Giả sử I have a collections/_puppies directory
    Và I have the following document under the "puppies" collection within the "collections" directory:
      | title  | date       | content            |
      | Rover  | 2007-12-31 | content for Rover. |
    Và I have a _drafts directory
    Và I have the following draft:
      | title         | date       | content         |
      | Draft At Root | 2009-03-27 | Random Content. |
    Và I have a "_config.yml" với nội dung:
    """
    collections:
      puppies:
        output: true

    collections_dir: collections
    """
    Khi I run jekyll build --drafts
    Thì I should get a zero exit status
    Và thư mục _site nên tồn tại
    Và the "_site/puppies/rover.html" nên tồn tại
    Và the "_site/2009/03/27/draft-at-root.html" không nên tồn tại

  Kịch bản: A complex site with collections posts and drafts at various locations
    Giả sử I have a gathering/_puppies directory
    Và I have a gathering/thư mục _posts
    Và I have a gathering/_drafts directory
    Và I have a _puppies directory
    Và I have a thư mục _posts
    Và I have a _drafts directory
    Và I have the following document under the "puppies" collection within the "gathering" directory:
      | title               | date       | content            |
      | Rover in Gathering  | 2007-12-31 | content for Rover. |
    Và I have the following document under the puppies collection:
      | title               | date       | content            |
      | Rover At Root       | 2007-12-31 | content for Rover. |
    Và I have the following post within the "gathering" directory:
      | title               | date       | content            |
      | Post in Gathering   | 2009-03-27 | Totally nothing.   |
    Và I have the following post:
      | title               | date       | content            |
      | Post At Root        | 2009-03-27 | Totally nothing.   |
    Và I have the following draft within the "gathering" directory:
      | title               | date       | content            |
      | Draft In Gathering  | 2009-03-27 | This is a draft.   |
    Và I have the following draft:
      | title               | date       | content            |
      | Draft At Root       | 2009-03-27 | This is a draft.   |
    Và I have a "_config.yml" với nội dung:
    """
    collections:
      puppies:
        output: true

    collections_dir: gathering
    """
    Và I have a "gathering/_puppies/static_file.txt" chứa nội dung "Static content."
    Và I have a gathering/_puppies/nested directory
    Và I have a "gathering/_puppies/nested/static_file.txt" chứa nội dung "Nested Static content."
    Khi I run jekyll build --drafts
    Thì I should get a zero exit status
    Và thư mục _site nên tồn tại
    Và the "_site/puppies/rover-in-gathering.html" nên tồn tại
    Và the "_site/2009/03/27/post-in-gathering.html" nên tồn tại
    Và the "_site/2009/03/27/draft-in-gathering.html" nên tồn tại
    Và the "_site/2009/03/27/draft-at-root.html" không nên tồn tại
    Và the "_site/puppies/rover-at-root.html" không nên tồn tại
    Và I should see exactly "Static content." in "_site/puppies/static_file.txt"
    Và I should see exactly "Nested Static content." in "_site/puppies/nested/static_file.txt"
    Và the _site/gathering không nên tồn tại
    Và the _site/_posts không nên tồn tại

  Kịch bản: Rendered collection with a document that includes a relative document
    Giả sử I have a _puppies directory
    Và I have the following documents under the puppies collection:
      | title  | date       | content                         |
      | INTRO  | 2007-12-31 | excerpt for all docs.           |
      | Rover  | 2007-12-31 | {% include_relative intro.md %} |
    Và I have a thư mục _posts
    Và I have the following post:
      | title         | date       | content         |
      | Gathered Post | 2009-03-27 | Random Content. |
    Và I have a "_config.yml" với nội dung:
    """
    collections:
      puppies:
        output: true
    """
    Khi I run jekyll build
    Thì I should get a zero exit status
    Và thư mục _site nên tồn tại
    Và the "_site/puppies/rover.html" nên tồn tại
    Và I should see "excerpt for all docs." in "_site/puppies/rover.html"
    Và I should see "Random Content." in "_site/2009/03/27/gathered-post.html"

  Kịch bản: Rendered collection in custom collections_dir with a document that includes a relative document
    Giả sử I have a collections/_puppies directory
    Và I have the following documents under the "puppies" collection within the "collections" directory:
      | title  | date       | content                         |
      | INTRO  | 2007-12-31 | excerpt for all docs.           |
      | Rover  | 2007-12-31 | {% include_relative intro.md %} |
    Và I have a collections/thư mục _posts
    Và I have the following post within the "collections" directory:
      | title         | date       | content         |
      | Gathered Post | 2009-03-27 | Random Content. |
    Và I have a "_config.yml" với nội dung:
    """
    collections:
      puppies:
        output: true

    collections_dir: collections
    """
    Khi I run jekyll build
    Thì I should get a zero exit status
    Và thư mục _site nên tồn tại
    Và the "_site/puppies/rover.html" nên tồn tại
    Và I should see "excerpt for all docs." in "_site/puppies/rover.html"
    Và I should see "Random Content." in "_site/2009/03/27/gathered-post.html"

  Kịch bản: Front matter defaults and custom collections directory
    Giả sử I have a gathering/_players/managers directory
    Và I have a gathering/_players/recruits directory
    Và I have a gathering/_players/standby directory
    Và I have the following documents nested inside "managers" directory under the "players" collection within the "gathering" directory:
      | title          | content             |
      | Tony Stark     | content for Tony.   |
      | Steve Rogers   | content for Steve.  |
    Và I have the following documents nested inside "recruits" directory under the "players" collection within the "gathering" directory:
      | title          | content             |
      | Peter Parker   | content for Peter.  |
      | Wanda Maximoff | content for Wanda.  |
    Và I have the following documents nested inside "standby" directory under the "players" collection within the "gathering" directory:
      | title          | content             |
      | Thanos         | content for Thanos. |
      | Loki           | content for Loki.   |
    Và I have a "_config.yml" với nội dung:
    """
    collections_dir: gathering
    collections: ["players"]
    defaults:
    - scope:
        path: ""
        type: players
      values:
        recruit: false
        manager: false
        villain: false
    - scope:
        path: gathering/_players/standby/thanos.md
        type: players
      values:
        villain: true
    - scope:
        path: gathering/_players/managers/*
        type: players
      values:
        manager: true
    - scope:
        path: gathering/_players/recruits/*
        type: players
      values:
        recruit: true
    """
    Và I have a "index.md" với nội dung:
    """
    ---
    ---
    {% for player in site.players %}
      <p>{{ player.title }}: Manager: {{ player.manager }}</p>
      <p>{{ player.title }}: Recruit: {{ player.recruit }}</p>
      <p>{{ player.title }}: Villain: {{ player.villain }}</p>
    {% endfor %}
    """
    Khi I run jekyll build
    Thì I should get a zero exit status
    Và thư mục _site nên tồn tại
    Và I should see "<p>Tony Stark: Manager: true</p>" in "_site/index.html"
    Và I should see "<p>Tony Stark: Recruit: false</p>" in "_site/index.html"
    Và I should see "<p>Tony Stark: Villain: false</p>" in "_site/index.html"
    Và I should see "<p>Peter Parker: Manager: false</p>" in "_site/index.html"
    Và I should see "<p>Peter Parker: Recruit: true</p>" in "_site/index.html"
    Và I should see "<p>Peter Parker: Villain: false</p>" in "_site/index.html"
    Và I should see "<p>Steve Rogers: Manager: true</p>" in "_site/index.html"
    Và I should see "<p>Steve Rogers: Recruit: false</p>" in "_site/index.html"
    Và I should see "<p>Steve Rogers: Villain: false</p>" in "_site/index.html"
    Và I should see "<p>Wanda Maximoff: Manager: false</p>" in "_site/index.html"
    Và I should see "<p>Wanda Maximoff: Recruit: true</p>" in "_site/index.html"
    Và I should see "<p>Wanda Maximoff: Villain: false</p>" in "_site/index.html"
    Và I should see "<p>Thanos: Manager: false</p>" in "_site/index.html"
    Và I should see "<p>Thanos: Recruit: false</p>" in "_site/index.html"
    Và I should see "<p>Thanos: Villain: true</p>" in "_site/index.html"
    Và I should see "<p>Loki: Manager: false</p>" in "_site/index.html"
    Và I should see "<p>Loki: Recruit: false</p>" in "_site/index.html"
    Và I should see "<p>Loki: Villain: false</p>" in "_site/index.html"

  Kịch bản: Sort all entries by a Front Matter key defined in all entries
    Giả sử I have an "index.html" page that contains "Collections: {{ site.tutorials | map: 'title' | join: ', ' }}"
    Và I have fixture collections in "gathering" directory
    Và I have a thư mục _layouts
    Và I have a "_layouts/tutorial.html" với nội dung:
    """
    {% if page.previous %}Previous: {{ page.previous.title }}{% endif %}

    {% if page.next %}Next: {{ page.next.title }}{% endif %}
    """
    Và I have a "_config.yml" với nội dung:
    """
    collections_dir: gathering
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
    Và I have fixture collections in "gathering" directory
    Và I have a thư mục _layouts
    Và I have a "_layouts/tutorial.html" với nội dung:
    """
    {% if page.previous %}Previous: {{ page.previous.title }}{% endif %}

    {% if page.next %}Next: {{ page.next.title }}{% endif %}
    """
    Và I have a "_config.yml" với nội dung:
    """
    collections_dir: gathering
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
    Và I have fixture collections in "gathering" directory
    Và I have a thư mục _layouts
    Và I have a "_layouts/tutorial.html" với nội dung:
    """
    {% if page.previous %}Previous: {{ page.previous.title }}{% endif %}

    {% if page.next %}Next: {{ page.next.title }}{% endif %}
    """
    Và I have a "_config.yml" với nội dung:
    """
    collections_dir: gathering
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
    Và I have fixture collections in "gathering" directory
    Và I have a thư mục _layouts
    Và I have a "_layouts/tutorial.html" với nội dung:
    """
    {% if page.previous %}Previous: {{ page.previous.title }}{% endif %}

    {% if page.next %}Next: {{ page.next.title }}{% endif %}
    """
    Và I have a "_config.yml" với nội dung:
    """
    collections_dir: gathering
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
