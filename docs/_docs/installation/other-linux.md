---
title: Jekyll trên Linux (Jekyll on Linux)
permalink: /docs/installation/other-linux/
---

Cài đặt trên các bản phân phối Linux khác hoạt động tương tự như cài đặt trên [Ubuntu](../ubuntu/).

## Cài đặt các điều kiện tiên quyết

### Fedora

```sh
sudo dnf install ruby ruby-devel openssl-devel redhat-rpm-config gcc-c++ @development-tools
```

### RHEL8/CentOS8

```sh
sudo dnf install ruby ruby-devel
sudo dnf group install "Development Tools"
```

### Debian

```sh
sudo apt-get install ruby-full build-essential
```

### Gentoo

```sh
sudo emerge -av jekyll
```

hoặc

```sh
sudo emerge --ask --verbose jekyll
```

### ArchLinux

```sh
sudo pacman -S ruby base-devel ruby-erb
```

### OpenSUSE

```sh
sudo zypper install -t pattern devel_ruby devel_C_C++
sudo zypper install ruby-devel
```

### Clear Linux

```sh
sudo swupd bundle-add ruby-basic
```

## Cài đặt Jekyll

Làm theo hướng dẫn cho [Ubuntu](../ubuntu/).
