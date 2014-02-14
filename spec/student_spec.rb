require_relative 'spec_helper'

describe "Movie" do
  before(:each) do
    DB.execute("CREATE TABLE students (id INTEGER PRIMARY KEY AUTOINCREMENT, name TEXT)")
  end
  after(:each) do
    DB.execute("DROP TABLE students")
  end

  it 'has a name' do
    s = Student.new
    s.name = "Awesome Dude"

    expect(s.name).to eq("Awesome Dude")
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

  it 'converts attributes to a hash' do
    s = Student.new
    s.name = "Awesome Dude"

    expect(m.to_h).to eq({:name => "Awesome Dude"})
  end
  
  it 'should save itself or persist to a database' do
    s = Student.new
    s.name = "Awesome Dude"

    s.save

 

    results = DB.execute("SELECT name FROM students WHERE name = 'Awesome Dude'")
    
    expect(results[0][0]).to eq("Awesome Dude")    
  end
end

