# Hướng dẫn Deploy lên GitHub Pages

## Cấu hình đã thiết lập

1. **GitHub Actions Workflow**: File `.github/workflows/jekyll-vietnamese.yml` đã được cấu hình để tự động build và deploy khi push lên branch `master`.

2. **Baseurl**: Đã được thiết lập trong `docs/_config.yml` là `/jekyll-vietnamese`

## Các bước để deploy

### 1. Chuẩn bị Repository

Đảm bảo repository của bạn đã được push lên GitHub:

```bash
git add .
git commit -m "Setup GitHub Pages deployment"
git push origin master
```

### 2. Kích hoạt GitHub Pages

1. Truy cập repository trên GitHub
2. Vào **Settings** > **Pages**
3. Trong phần **Source**, chọn:
   - Source: **GitHub Actions**
4. Workflow sẽ tự động chạy khi bạn push code

### 3. Kiểm tra Deployment

1. Vào tab **Actions** trên repository
2. Xem workflow "Deploy Jekyll with GitHub Pages dependencies preinstalled" đang chạy
3. Sau khi hoàn thành, website sẽ có tại: `https://<username>.github.io/jekyll-vietnamese`

## Cấu trúc Workflow

Workflow sẽ:

- Trigger khi push lên branch `master`
- Build Jekyll site từ thư mục `./docs`
- Deploy lên GitHub Pages

## Chạy Local

Để chạy local development server:

```bash
jekyll serve --source docs --host 0.0.0.0
```

Website sẽ chạy tại: `http://localhost:4000`

## Lưu ý

- Đã xóa tất cả các workflow khác, chỉ giữ lại workflow deploy GitHub Pages
- Các plugin Jekyll đã được tạm thời disable để tránh lỗi khi chạy local
- Nếu cần enable lại plugins, uncomment trong `docs/_config.yml` và cài đặt gems cần thiết
