require 'rubygems'
require 'sequel'
DB = Sequel.connect('mysql://root@localhost/eadz_old')
DB.fetch('select * from bB_posts order by postid desc ') do |post|
  date = Time.at(post[:posttime]).strftime('%Y-%m-%d')
  slug = post[:pagename].gsub(/\.html/,'')
  if slug.empty?
    slug = post[:title].downcase.gsub(/ /,'-').gsub(/[^-a-z0-9]/,'')
  end
  if slug.empty?
    slug = post[:postid]
  end
  meta = Time.at(post[:posttime]).strftime('%e %B, %Y')
  body = post[:body]
  modifier = post[:modifier]
  if ['simple','nl2br'].include?(modifier)
    modifier = 'html'
    body = body.gsub(/\n/,'<br/>')
  end
  modifier = 'html' if modifier == 'none'
  title = post[:title].gsub(/:/,'-')
  filename = "#{date}-#{slug}.#{modifier}"
  puts filename
  tags = []
  sections = post[:sections]
  tagline = ""
  unless sections.empty?
    sections.split(':').each do |s|
      unless s.empty?
        tag = DB.fetch("select name from bB_sections where sectionid=#{s}")
        tags << tag[:name][:name]
      end
    end
    tagline = "
tags: #{tags.join(',')}"
  end
  puts tags.join(',')
  
  File.open('_posts/'+filename,'w') do |f|
    f.write "---
layout: post
title: #{title}
meta: #{meta}
tag: #{tags.join(',')}
---

#{body}
"
    
  
end
  #File.open('eadz-posts/'+)
end
