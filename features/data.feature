Tính năng: Dữ liệu
  Để sử dụng dữ liệu được định dạng tốt trong blog của tôi
  Là người dùng blog
  Tôi muốn sử dụng thư mục _data trong site của mình

  Kịch bản: tự động tải các file *.yaml trong thư mục _data
    Giả sử tôi có thư mục _data
    Và tôi có file "_data/products.yaml" với nội dung:
      """
      - name: sugar
        price: 5.3
      - name: salt
        price: 2.5
      """
    Và tôi có trang "index.html" chứa nội dung "{% for product in site.data.products %}{{product.name}}{% endfor %}"
    Khi tôi chạy jekyll build
    Thì file "_site/index.html" nên tồn tại
    Và tôi nên thấy "sugar" trong "_site/index.html"
    Và tôi nên thấy "salt" trong "_site/index.html"

  Kịch bản: tự động tải các file *.yml trong thư mục _data
    Giả sử tôi có thư mục _data
    Và tôi có file "_data/members.yml" với nội dung:
      """
      - name: Jack
        age: 28
      - name: Leon
        age: 34
      """
    Và tôi có trang "index.html" chứa nội dung "{% for member in site.data.members %}{{member.name}}{% endfor %}"
    Khi tôi chạy jekyll build
    Thì file "_site/index.html" nên tồn tại
    Và tôi nên thấy "Jack" trong "_site/index.html"
    Và tôi nên thấy "Leon" trong "_site/index.html"

  Kịch bản: tự động tải các file *.json trong thư mục _data
    Giả sử tôi có thư mục _data
    Và tôi có file "_data/members.json" với nội dung:
      """
      [{"name": "Jack", "age": 28},{"name": "Leon", "age": 34}]
      """
    Và tôi có trang "index.html" chứa nội dung "{% for member in site.data.members %}{{member.name}}{% endfor %}"
    Khi tôi chạy jekyll build
    Thì file "_site/index.html" nên tồn tại
    Và tôi nên thấy "Jack" trong "_site/index.html"
    Và tôi nên thấy "Leon" trong "_site/index.html"

  Kịch bản: tự động tải các file *.csv trong thư mục _data
    Giả sử tôi có thư mục _data
    Và tôi có file "_data/members.csv" với nội dung:
      """
      name,age
      Jack,28
      Leon,34
      """
    Và tôi có trang "index.html" chứa nội dung "{% for member in site.data.members %}{{member.name}}{% endfor %}"
    Khi tôi chạy jekyll build
    Thì file "_site/index.html" nên tồn tại
    Và tôi nên thấy "Jack" trong "_site/index.html"
    Và tôi nên thấy "Leon" trong "_site/index.html"

  Kịch bản: tự động tải các file *.tsv trong thư mục _data
    Giả sử tôi có thư mục _data
    Và tôi có file "_data/members.tsv" với nội dung:
      """
      name	age
      Jack	28
      Leon	34
      """
    Và tôi có trang "index.html" chứa nội dung "{% for member in site.data.members %}{{member.name}}{% endfor %}"
    Khi tôi chạy jekyll build
    Thì file "_site/index.html" nên tồn tại
    Và tôi nên thấy "Jack" trong "_site/index.html"
    Và tôi nên thấy "Leon" trong "_site/index.html"

  Kịch bản: tự động tải các file *.yml trong thư mục _data với khoảng trắng trong tên file
    Giả sử tôi có thư mục _data
    Và tôi có file "_data/team members.yml" với nội dung:
      """
      - name: Jack
        age: 28
      - name: Leon
        age: 34
      """
    Và tôi có trang "index.html" chứa nội dung "{% for member in site.data.team_members %}{{member.name}}{% endfor %}"
    Khi tôi chạy jekyll build
    Thì file "_site/index.html" nên tồn tại
    Và tôi nên thấy "Jack" trong "_site/index.html"
    Và tôi nên thấy "Leon" trong "_site/index.html"

  Kịch bản: tự động tải các file *.yaml trong thư mục con của thư mục _data
    Giả sử tôi có thư mục _data
    Và tôi có thư mục _data/categories
    Và tôi có file "_data/categories/dairy.yaml" với nội dung:
      """
      name: Dairy Products
      """
    Và tôi có trang "index.html" chứa nội dung "{{ site.data.categories.dairy.name }}"
    Khi tôi chạy jekyll build
    Thì file "_site/index.html" nên tồn tại
    Và tôi nên thấy "Dairy Products" trong "_site/index.html"

  Kịch bản: thư mục nên được ưu tiên hơn các file có cùng tên
    Giả sử tôi có thư mục _data
    Và tôi có thư mục _data/categories
    Và tôi có file "_data/categories/dairy.yaml" với nội dung:
      """
      name: Dairy Products
      """
    Và tôi có file "_data/categories.yaml" với nội dung:
      """
      dairy:
        name: Should not display this
      """
    Và tôi có trang "index.html" chứa nội dung "{{ site.data.categories.dairy.name }}"
    Khi tôi chạy jekyll build
    Thì file "_site/index.html" nên tồn tại
    Và tôi nên thấy "Dairy Products" trong "_site/index.html"

  Kịch bản: nên tương thích ngược với site.data trong _config.yml
    Giả sử tôi có file "_config.yml" với nội dung:
      """
      data:
        - name: Jack
          age: 28
        - name: Leon
          age: 34
      """
    Và tôi có trang "index.html" chứa nội dung "{% for member in site.data %}{{member.name}}{% endfor %}"
    Khi tôi chạy jekyll build
    Thì file "_site/index.html" nên tồn tại
    Và tôi nên thấy "Jack" trong "_site/index.html"
    Và tôi nên thấy "Leon" trong "_site/index.html"
