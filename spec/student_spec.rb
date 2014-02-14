require_relative 'spec_helper'

describe "Student" do
  before(:each) do
    DB.execute("CREATE TABLE students (id INTEGER PRIMARY KEY AUTOINCREMENT, name TEXT, image_url TEXT, subtitle TEXT, summary TEXT)")
  end
  after(:each) do
    DB.execute("DROP TABLE students")
  end

  it 'has a name' do
    s = Student.new
    s.name = "Some Dude"

    expect(s.name).to eq("Some Dude")
  end

  it 'has a image_url' do
    s = Student.new
    s.image_url = "/awesomedude.jpg/"

    expect(s.image_url).to eq("/awesomedude.jpg/")
  end

  it 'has a subtitle' do
    s = Student.new
    s.subtitle = "something somthing"

    expect(s.subtitle).to eq("something somthing")
  end

  it 'has a summary' do
    s = Student.new
    s.summary = "summary summary"

    expect(s.summary).to eq("summary summary")
  end

  
  it 'should save itself or persist to a database' do
    s = Student.new
    s.name = "Some Dude"

    s.save

 

    results = DB.execute("SELECT name FROM students WHERE name = 'Some Dude'")
    
    expect(results[0][0]).to eq("Some Dude")    
  end
end

