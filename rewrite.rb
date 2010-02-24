"2007-1-23-welcome-to-seo-on-rails.textile
2007-1-24-even-better-looking-urls-with-permalink_fu.textile
2007-1-24-to_param-for-better-looking-urls.textile
2007-1-24-urls-ending-in-html.textile
2007-2-1-mephisto-google-sitemap.textile
2007-2-1-screen-scraping-ruby.textile
2007-2-3-getting-your-meta-tags-on-track.textile
2007-2-3-rails-image-tag.textile
2007-2-5-301-redirects-in-rails.textile
2007-2-8-scrubyt-screen-scraping.textile
2008-6-15-title_tag_helper.textile
2008-9-1-seo-friendly-ajax.textile
2008-9-4-rails-seo-around-the-web.textile
2009-6-7-rails-seo-starter-guide.textile
2010-2-24-seo-impact-of-rails-3.html
".each_line do |post|
url = post.split('.')[0].split('-')
url = url[3,url.size].join('-')
puts "RewriteRule 	" + url  + "$ 		http://www.seoonrails.com/#{url}.html"+'  [L,R=301]'


end
