---
layout: page
title: JekyllConf
permalink: /jekyllconf/
---

[JekyllConf](https://jekyllconf.com) là một hội nghị trực tuyến miễn phí về mọi thứ liên quan đến Jekyll, được tổ chức bởi [CloudCannon](https://cloudcannon.com). Mỗi năm, các thành viên của cộng đồng Jekyll chia sẻ về các trường hợp sử dụng thú vị, mẹo họ đã học được, hoặc các chủ đề meta về Jekyll.

## Nổi bật

{% assign random = site.time | date: "%s%N" | modulo: site.data.jekyllconf-talks.size %}
{% assign featured = site.data.jekyllconf-talks[random] %}

**{{ featured.topic }}** - [*{{ featured.speaker }}*](<https://twitter.com/{{> featured.twitter_handle }})
<div class="videoWrapper">
    <iframe width="420" height="315" src="https://www.youtube.com/embed/{{ featured.youtube_id }}" frameborder="0" allowfullscreen></iframe>
</div>

{% assign talks = site.data.jekyllconf-talks | group_by: 'year' %}
{% for year in talks reversed %}

## {{ year.name }}

{% for talk in year.items %}

* [**{{ talk.topic }}**](<https://youtu.be/{{> talk.youtube_id }}) - [*{{ talk.speaker }}*](<https://twitter.com/{{> talk.twitter_handle }})
{% endfor %}
{% endfor %}
