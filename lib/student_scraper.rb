require 'open-uri'
require 'nokogiri'

html = open("http://students.flatironschool.com/")
student_page = Nokogiri::HTML(html)

students = []
student_page.css("li.home-blog-post").each do |student|
  name = student.css("h3 a").text
  students << {
    :name => name,
    :image_url => student.css("div.blog-thumb a img").attribute("src").value,
    :subtitle => student.css("p.home-blog-post-meta").text.strip,
    :summary => student.css("div.excerpt").text.strip,
    :blog_url => student.css("h3 a").attribute("href").value
  }
end