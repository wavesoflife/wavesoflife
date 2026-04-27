---
layout: default
title: Blog
permalink: /blog/
---

<div class="page-wrapper">
  <div class="content-card">
    <header class="page-header">
      <h1 class="page-title">Blog</h1>
      <div class="page-title-underline"></div>
    </header>
    <h2 class="section-heading">Latest Posts</h2>
    {% if site.posts.size > 0 %}
    <ul class="blog-post-list">
      {% for post in site.posts %}
      <li class="blog-post-item">
        <h3 class="blog-post-title">
          <a href="{{ post.url | relative_url }}">{{ post.title }}</a>
        </h3>
        <p class="post-meta">
          <time datetime="{{ post.date | date_to_xmlschema }}">{{ post.date | date: "%B %-d, %Y" }}</time>
          &nbsp;&bull;&nbsp; by {{ post.author | default: site.author }}
        </p>
        {% if post.tags and post.tags.size > 0 %}
        <div class="blog-post-tags">
          {% for tag in post.tags %}
          <a href="{{ '/tags' | relative_url }}#{{ tag | slugify }}" class="tag">{{ tag }}</a>
          {% endfor %}
        </div>
        {% endif %}
        {% if post.excerpt %}
        <p class="post-excerpt">{{ post.excerpt | strip_html | truncate: 220 }}</p>
        {% endif %}
        <a href="{{ post.url | relative_url }}" class="continue-reading">Continue reading &rarr;</a>
      </li>
      {% endfor %}
    </ul>
    {% else %}
    <p>No posts yet &mdash; check back soon!</p>
    {% endif %}
  </div>
</div>
