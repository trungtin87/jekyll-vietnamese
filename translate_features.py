#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Script tự động dịch các file .feature từ tiếng Anh sang tiếng Việt
Giữ nguyên cấu trúc Gherkin và chỉ dịch nội dung mô tả
"""

import re
import os

# Mapping từ khóa Gherkin
GHERKIN_KEYWORDS = {
    'Feature:': 'Tính năng:',
    'Scenario:': 'Kịch bản:',
    'Scenario Outline:': 'Khung kịch bản:',
    'Given ': 'Giả sử ',
    'When ': 'Khi ',
    'Then ': 'Thì ',
    'And ': 'Và ',
    'But ': 'Nhưng ',
    'Examples:': 'Ví dụ:',
}

# Mapping các cụm từ thường gặp
COMMON_PHRASES = {
    'I have a': 'tôi có',
    'I have an': 'tôi có',
    'I have the following': 'tôi có',
    'I run jekyll build': 'tôi chạy jekyll build',
    'I run jekyll': 'tôi chạy jekyll',
    'I should get a zero exit status': 'tôi nên nhận được trạng thái thoát bằng không',
    'I should get a non-zero exit status': 'tôi nên nhận được trạng thái thoát khác không',
    'I should see': 'tôi nên thấy',
    'I should not see': 'tôi không nên thấy',
    'the _site directory should exist': 'thư mục _site nên tồn tại',
    'the _site directory should not exist': 'thư mục _site không nên tồn tại',
    'directory should exist': 'nên tồn tại',
    'directory should not exist': 'không nên tồn tại',
    'file should exist': 'nên tồn tại',
    'file should not exist': 'không nên tồn tại',
    'page that contains': 'chứa nội dung',
    'page with': 'với',
    'file that contains': 'chứa nội dung',
    'file with content:': 'với nội dung:',
    'file with': 'với',
    'layout that contains': 'chứa nội dung',
    'in the build output': 'trong kết quả build',
    '_posts directory': 'thư mục _posts',
    '_layouts directory': 'thư mục _layouts',
    '_includes directory': 'thư mục _includes',
    '_plugins directory': 'thư mục _plugins',
    '_data directory': 'thư mục _data',
    'configuration file with': 'file cấu hình với',
    'a configuration file': 'file cấu hình',
    'I do not have': 'tôi không có',
    'I delete': 'tôi xóa',
}

def translate_line(line):
    """Dịch một dòng từ tiếng Anh sang tiếng Việt"""
    # Giữ nguyên các dòng trống, comment, hoặc chỉ chứa khoảng trắng
    if not line.strip() or line.strip().startswith('#'):
        return line
    
    # Giữ nguyên các dòng trong data table (bắt đầu bằng |)
    if line.strip().startswith('|'):
        return line
    
    # Giữ nguyên các dòng trong docstring (""")
    if '"""' in line:
        return line
    
    original_line = line
    translated = line
    
    # Dịch từ khóa Gherkin
    for eng, vie in GHERKIN_KEYWORDS.items():
        if eng in translated:
            translated = translated.replace(eng, vie)
    
    # Dịch các cụm từ thường gặp (chỉ khi không phải là code)
    if not any(x in line for x in ['{{', '}}', '{%', '%}', '```', 'def ', 'class ', 'require']):
        for eng, vie in COMMON_PHRASES.items():
            if eng in translated.lower():
                # Case-insensitive replace
                pattern = re.compile(re.escape(eng), re.IGNORECASE)
                translated = pattern.sub(vie, translated)
    
    return translated

def translate_file(input_path, output_path):
    """Dịch toàn bộ file"""
    print(f"Translating: {input_path}")
    
    with open(input_path, 'r', encoding='utf-8') as f:
        lines = f.readlines()
    
    translated_lines = []
    in_docstring = False
    
    for line in lines:
        # Kiểm tra docstring
        if '"""' in line:
            in_docstring = not in_docstring
            translated_lines.append(line)
            continue
        
        # Nếu đang trong docstring, giữ nguyên
        if in_docstring:
            translated_lines.append(line)
            continue
        
        # Dịch dòng
        translated_line = translate_line(line)
        translated_lines.append(translated_line)
    
    # Ghi file
    with open(output_path, 'w', encoding='utf-8') as f:
        f.writelines(translated_lines)
    
    print(f"Completed: {output_path}")

def main():
    """Main function"""
    import sys
    # Set UTF-8 encoding for Windows console
    if sys.platform == 'win32':
        import codecs
        sys.stdout = codecs.getwriter('utf-8')(sys.stdout.buffer, 'strict')
    
    features_dir = 'e:\\ubuntu\\Docker\\jekyll-vietnamese\\features'
    
    # Danh sách các file cần dịch
    files_to_translate = [
        'collections_dir.feature',
        'post_data.feature',
        'hooks.feature',
        'collections.feature',
    ]
    
    print("=" * 60)
    print("Starting translation...")
    print("=" * 60)
    
    for filename in files_to_translate:
        input_path = os.path.join(features_dir, filename)
        output_path = input_path  # Ghi đè file gốc
        
        if os.path.exists(input_path):
            translate_file(input_path, output_path)
        else:
            print(f"File not found: {input_path}")
    
    print("=" * 60)
    print("Translation completed!")
    print("=" * 60)

if __name__ == '__main__':
    main()
