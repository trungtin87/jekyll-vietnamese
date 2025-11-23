import sys
import os
import re
import requests
from bs4 import BeautifulSoup
import html2text

def sanitize_filename(filename):
    """Sanitize the filename to remove invalid characters."""
    # Remove invalid characters for Windows filenames
    filename = re.sub(r'[<>:"/\\|?*]', '', filename)
    # Replace multiple spaces with single space
    filename = re.sub(r'\s+', ' ', filename).strip()
    return filename

def scrape_url(url):
    try:
        response = requests.get(url, headers={'User-Agent': 'Mozilla/5.0'})
        response.raise_for_status()
        
        soup = BeautifulSoup(response.content, 'html.parser')
        
        # Try to find the title
        title = None
        if soup.h1:
            title = soup.h1.get_text().strip()
        elif soup.title:
            title = soup.title.get_text().strip()
        else:
            title = "Untitled"
            
        # Try to find the main content
        # Common classes/ids for main content
        content_selectors = ['article', 'main', '.post-content', '.entry-content', '#content', '.content']
        content_html = None
        
        for selector in content_selectors:
            element = soup.select_one(selector)
            if element:
                content_html = str(element)
                break
        
        # Fallback to body if no specific content area found
        if not content_html:
            content_html = str(soup.body)
            
        # Convert to Markdown
        h = html2text.HTML2Text()
        h.ignore_links = False
        h.ignore_images = False
        h.body_width = 0 # No wrapping
        markdown_content = h.handle(content_html)
        
        # Save to file
        filename = sanitize_filename(title) + ".md"
        with open(filename, 'w', encoding='utf-8') as f:
            f.write(markdown_content)
            
        print(f"Successfully saved '{title}' to '{filename}'")
        
    except Exception as e:
        print(f"Error scraping {url}: {e}")

if __name__ == "__main__":
    if len(sys.argv) < 2:
        print("Usage: python scrape_to_md.py <url1> <url2> ...")
        sys.exit(1)
        
    for url in sys.argv[1:]:
        scrape_url(url)
