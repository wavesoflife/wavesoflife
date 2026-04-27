---
layout: default
title: Tags
permalink: /tags/
---

<div class="page-wrapper">
  <div class="content-card">
    <header class="page-header">
      <h1 class="page-title">Tags</h1>
      <div class="page-title-underline"></div>
    </header>

    <h2 class="section-heading">All Tags</h2>
    <div class="all-tags-cloud">
      {% assign sorted_tags = site.tags | sort %}
      {% for tag in sorted_tags %}
        {% assign tag_name = tag[0] %}
        {% assign tag_posts = tag[1] %}
        <a href="#{{ tag_name | slugify }}" class="tag">{{ tag_name }} ({{ tag_posts.size }})</a>
      {% endfor %}
    </div>

    {% for tag in sorted_tags %}
      {% assign tag_name = tag[0] %}
      {% assign tag_posts = tag[1] %}
      <div class="tag-section" id="{{ tag_name | slugify }}">
        <hr class="tag-section-rule">
        <h3 class="tag-section-heading">
          {{ tag_name }} <small>({{ tag_posts.size }} {% if tag_posts.size == 1 %}post{% else %}posts{% endif %})</small>
        </h3>
        <ul class="blog-post-list">
          {% for post in tag_posts %}
          <li class="blog-post-item">
            <h4 class="blog-post-title">
              <a href="{{ post.url | relative_url }}">{{ post.title }}</a>
            </h4>
            <p class="post-meta">
              <time datetime="{{ post.date | date_to_xmlschema }}">{{ post.date | date: "%B %-d, %Y" }}</time>
              &nbsp;&bull;&nbsp; by {{ post.author | default: site.author }}
            </p>
            {% if post.excerpt %}
            <p class="post-excerpt">{{ post.excerpt | strip_html | truncate: 180 }}</p>
            {% endif %}
            <a href="{{ post.url | relative_url }}" class="continue-reading">Continue reading &rarr;</a>
          </li>
          {% endfor %}
        </ul>
      </div>
    {% endfor %}
  </div>
</div>
