#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Script to translate Jekyll blog posts from English to Vietnamese
"""

import os
import re
from pathlib import Path

# Translation dictionary for common terms
TRANSLATIONS = {
    # Release-related terms
    "Released": "Đã phát hành",
    "released": "đã phát hành",
    "Release": "Phát hành",
    "release": "phát hành",
    "Bug Fixes": "Sửa lỗi",
    "bug fixes": "sửa lỗi",
    "Bug Fix": "Sửa lỗi",
    "bug fix": "sửa lỗi",
    "Enhancements": "Cải tiến",
    "enhancements": "cải tiến",
    "Enhancement": "Cải tiến",
    "enhancement": "cải tiến",
    "Features": "Tính năng",
    "features": "tính năng",
    "Feature": "Tính năng",
    "feature": "tính năng",
    "Improvements": "Cải thiện",
    "improvements": "cải thiện",
    "Site Enhancements": "Cải tiến Trang web",
    "site enhancements": "cải tiến trang web",
    "Development Fixes": "Sửa lỗi Phát triển",
    "development fixes": "sửa lỗi phát triển",
    "Documentation": "Tài liệu",
    "documentation": "tài liệu",
    "Minor Enhancements": "Cải tiến Nhỏ",
    "minor enhancements": "cải tiến nhỏ",
    "Major Enhancements": "Cải tiến Lớn",
    "major enhancements": "cải tiến lớn",
    
    # Common phrases
    "See the": "Xem",
    "see the": "xem",
    "page for more information": "để biết thêm thông tin",
    "for more information": "để biết thêm thông tin",
    "on this release": "về bản phát hành này",
    "Happy Jekylling": "Chúc bạn Jekyll vui vẻ",
    "Happy jekylling": "Chúc bạn Jekyll vui vẻ",
    "contains": "chứa",
    "includes": "bao gồm",
    "fixes": "sửa",
    "adds": "thêm",
    "updates": "cập nhật",
    "removes": "xóa",
    "improves": "cải thiện",
    
    # Action words
    "Add": "Thêm",
    "add": "thêm",
    "Fix": "Sửa",
    "fix": "sửa",
    "Update": "Cập nhật",
    "update": "cập nhật",
    "Remove": "Xóa",
    "remove": "xóa",
    "Improve": "Cải thiện",
    "improve": "cải thiện",
    "Allow": "Cho phép",
    "allow": "cho phép",
    "Enable": "Kích hoạt",
    "enable": "kích hoạt",
    "Disable": "Vô hiệu hóa",
    "disable": "vô hiệu hóa",
    "Support": "Hỗ trợ",
    "support": "hỗ trợ",
    
    # Other common terms
    "History": "Lịch sử",
    "history": "lịch sử",
    "version": "phiên bản",
    "Version": "Phiên bản",
}

def translate_text(text):
    """Translate common English phrases to Vietnamese"""
    result = text
    for en, vi in TRANSLATIONS.items():
        # Use word boundaries to avoid partial replacements
        result = re.sub(r'\b' + re.escape(en) + r'\b', vi, result)
    return result

def process_post_file(filepath):
    """Process a single post file"""
    print(f"Processing: {filepath.name}")
    
    with open(filepath, 'r', encoding='utf-8') as f:
        content = f.read()
    
    # Split front matter and body
    parts = content.split('---', 2)
    if len(parts) < 3:
        print(f"  Skipping (no front matter): {filepath.name}")
        return False
    
    front_matter = parts[1]
    body = parts[2]
    
    # Translate title in front matter
    front_matter_lines = front_matter.split('\n')
    for i, line in enumerate(front_matter_lines):
        if line.strip().startswith('title:'):
            # Extract title
            match = re.match(r'(\s*title:\s*["\']?)(.+?)(["\']?\s*)$', line)
            if match:
                prefix, title, suffix = match.groups()
                translated_title = translate_text(title)
                front_matter_lines[i] = f"{prefix}{translated_title}{suffix}"
    
    front_matter = '\n'.join(front_matter_lines)
    
    # Translate body content
    translated_body = translate_text(body)
    
    # Reconstruct file
    new_content = f"---{front_matter}---{translated_body}"
    
    # Write back
    with open(filepath, 'w', encoding='utf-8') as f:
        f.write(new_content)
    
    print(f"  ✓ Translated: {filepath.name}")
    return True

def main():
    posts_dir = Path('docs/_posts')
    
    if not posts_dir.exists():
        print(f"Error: {posts_dir} not found")
        return
    
    post_files = sorted(posts_dir.glob('*.markdown')) + sorted(posts_dir.glob('*.md'))
    
    print(f"Found {len(post_files)} post files")
    print("=" * 60)
    
    translated_count = 0
    for post_file in post_files:
        if process_post_file(post_file):
            translated_count += 1
    
    print("=" * 60)
    print(f"Translation complete: {translated_count}/{len(post_files)} files translated")

if __name__ == '__main__':
    main()
