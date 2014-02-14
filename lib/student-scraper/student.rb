class Student
  attr_reader :name, :img_url, :subtitle, :summary, :blog_url
  
  def initialize(student)
    @name = student[:name]
    @img_url = student[:img_url]
    @subtitle = student[:subtitle]
    @summary = student[:summary]
    @blog_url = student[:blog_url]
  end
  
  def self.create_table
    DB.execute(
      "CREATE TABLE students(
          id INTEGER PRIMARY KEY,
          name VARCHAR NOT NULL,
          img_url VARCHAR,
          subtitle VARCHAR,
          summary TEXT,
          blog_url VARCHAR
      )"
    )
  end
  
  def save
    DB.execute(
      "INSERT INTO students values(?,?,?,?,?,?)", 
      self.name, self.img_url, self.subtitle, self.summary, self.blog_url
    )
  end
end