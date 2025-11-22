---
title: Tùy chọn Cấu hình (Configuration Options)
permalink: "/docs/configuration/options/"
---

Các bảng dưới đây liệt kê các cài đặt có sẵn cho Jekyll, và các <code
class="option">tùy chọn</code> khác nhau (được chỉ định trong tệp cấu hình) và <code
class="flag">cờ</code> (được chỉ định trên dòng lệnh) kiểm soát chúng.

### Cấu hình Toàn cục

<div class="mobile-side-scroller">
<table>
  <thead>
    <tr>
      <th>Cài đặt</th>
      <th>
        <span class="option">Tùy chọn</span> và <span class="flag">Cờ</span>
      </th>
    </tr>
  </thead>
  <tbody>
    {% for setting in site.data.config_options.global %}
      <tr class="setting">
        <td>
          <p class="name">
            <strong>{{ setting.name }}</strong>
            {% if setting.version-badge %}
              <span class="version-badge" title="Được giới thiệu trong v{{ setting.version-badge }}">{{ setting.version-badge }}</span>
            {% endif %}
          </p>
          <p class="description">{{ setting.description }}</p>
        </td>
        <td class="align-center">
          <p><code class="option">{{ setting.option }}</code></p>
          {% if setting.flag %}
            <p><code class="flag">{{ setting.flag }}</code></p>
          {% endif %}
        </td>
      </tr>
    {% endfor %}
    <tr>
      <td>
        <p class='name'><strong>Mặc định (Defaults)</strong></p>
        <p class='description'>
            Đặt mặc định cho các biến <a href="{{ '/docs/front-matter/' | relative_url }}" title="front matter">front matter</a>.
        </p>
      </td>
      <td class='align-center'>
        <p>xem <a href="{{ '/docs/configuration/front-matter-defaults/' | relative_url }}" title="chi tiết">bên dưới</a></p>
      </td>
    </tr>
  </tbody>
</table>
</div>

<div class="note warning">
  <h5>Thư mục đích được làm sạch khi xây dựng trang web</h5>
  <p>
    Nội dung của <code>&lt;destination&gt;</code> được tự động
    làm sạch, theo mặc định, khi trang web được xây dựng. Các tệp hoặc thư mục không được
    tạo bởi trang web của bạn sẽ bị xóa. Một số tệp có thể được giữ lại
    bằng cách chỉ định chúng trong chỉ thị cấu hình <code>&lt;keep_files&gt;</code>.
  </p>
  <p>
    Không sử dụng một vị trí quan trọng cho <code>&lt;destination&gt;</code>; thay vào đó, hãy sử dụng nó như
    một khu vực tổ chức (staging area) và sao chép các tệp từ đó sang máy chủ web của bạn.
  </p>
</div>

### Tùy chọn Lệnh Build

<div class="mobile-side-scroller">
<table>
  <thead>
    <tr>
      <th>Cài đặt</th>
      <th><span class="option">Tùy chọn</span> và <span class="flag">Cờ</span></th>
    </tr>
  </thead>
  <tbody>
    {% for setting in site.data.config_options.build %}
      <tr class="setting">
        <td>
          <p class="name">
            <strong>{{ setting.name }}</strong>
            {% if setting.version-badge %}
              <span class="version-badge" title="Được giới thiệu trong v{{ setting.version-badge }}">{{ setting.version-badge }}</span>
            {% endif %}
          </p>
          <p class="description">{{ setting.description }}</p>
        </td>
        <td class="align-center">
          {% if setting.option %}<p><code class="option">{{ setting.option }}</code></p>{% endif %}
          {% if setting.flag %}<p><code class="flag">{{ setting.flag }}</code></p>{% endif %}
        </td>
      </tr>
    {% endfor %}
  </tbody>
</table>
</div>

### Tùy chọn Lệnh Serve

Ngoài các tùy chọn bên dưới, lệnh phụ `serve` có thể chấp nhận bất kỳ tùy chọn nào
của lệnh phụ `build`, sau đó được áp dụng cho bản dựng trang web diễn ra ngay
trước khi trang web của bạn được phục vụ.

<div class="mobile-side-scroller">
<table>
  <thead>
    <tr>
      <th>Cài đặt</th>
      <th><span class="option">Tùy chọn</span> và <span class="flag">Cờ</span></th>
    </tr>
  </thead>
  <tbody>
    {% for setting in site.data.config_options.serve %}
      <tr class="setting">
        <td>
          <p class="name">
            <strong>{{ setting.name }}</strong>
            {% if setting.version-badge %}
              <span class="version-badge" title="Được giới thiệu trong v{{ setting.version-badge }}">{{ setting.version-badge }}</span>
            {% endif %}
          </p>
          <p class="description">{{ setting.description }}</p>
        </td>
        <td class="align-center">
          {% if setting.option %}
            <p><code class="option">{{ setting.option }}</code></p>
          {% elsif setting.options %}
            <p>
              {% for option in setting.options %}
                <code class="option">{{ option }}</code><br>
              {% endfor %}
            </p>
          {% endif %}
          {% if setting.flag %}
            <p><code class="flag">{{ setting.flag }}</code></p>
          {% elsif setting.flags %}
            <p>
            {% for flag in setting.flags %}
              <code class="flag">{{ flag }}</code><br>
            {% endfor %}
            </p>
          {% endif %}
        </td>
      </tr>
    {% endfor %}
  </tbody>
</table>
</div>

<div class="note warning">
  <h5>Không sử dụng tab trong các tệp cấu hình</h5>
  <p>
    Điều này sẽ dẫn đến lỗi phân tích cú pháp, hoặc Jekyll sẽ quay lại
    cài đặt mặc định. Sử dụng dấu cách thay thế.
  </p>
</div>
