require 'awesome_print'

class StudentScraper
  def self.get_students
    source_url = "http://students.flatironschool.com/"
    students_page = noko(source_url)

    students = []
    students_page.css("li.home-blog-post").each do |student|
      name = student.css("h3 a").text
      students << {
        :name => name,
        :img_url => source_url + student.css("div.blog-thumb a img").attribute("src").value,
        :subtitle => student.css("p.home-blog-post-meta").text.strip,
        :summary => student.css("div.excerpt").text.strip,
        :blog_url => source_url + student.css("h3 a").attribute("href").value
      }
    end
    students
  end

  def self.get_student_info(student)
    student_page = noko(student[:blog_url])
  end

  def self.noko(url)
    html = open(url)
    Nokogiri::HTML(html)
  end
    
end

#Student.create_table
#students = StudentScraper.get_students
#students.each{|student| Student.new(student).save}
#ap students[0]