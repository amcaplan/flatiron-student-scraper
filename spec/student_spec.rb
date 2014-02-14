require_relative 'spec_helper'


describe "Student" do

  let(:our_student) {{
        :name => "Justin Belmont",
     :img_url => "http://students.flatironschool.com/img/students/justinbelmont_profile.jpg",
    :subtitle => "Woooohooo! Code.",
     :summary => "Native New Yorker. Code Warrior",
    :blog_url => "http://students.flatironschool.com/students/justinbelmont.html"
  }}

  let(:s) {Student.new(our_student)}

  before(:each) do
    DB.execute("CREATE TABLE students (id INTEGER PRIMARY KEY AUTOINCREMENT, name TEXT, img_url TEXT, subtitle TEXT, summary TEXT)")
  end
  after(:each) do
    DB.execute("DROP TABLE students")
  end

  it 'has a name' do
    expect(s.name).to eq("Justin Belmont")
  end

  it 'has a img_url' do
    expect(s.img_url).to eq("http://students.flatironschool.com/img/students/justinbelmont_profile.jpg")
  end

  it 'has a subtitle' do
    expect(s.subtitle).to eq("Woooohooo! Code.")
  end

  it 'has a summary' do
    expect(s.summary).to eq("Native New Yorker. Code Warrior")
  end
  
  it 'should save itself or persist to a database' do
    s.save

    results = DB.execute("SELECT name FROM students WHERE name = 'Justin Belmont'")
    
    expect(results[0][0]).to eq("Justin Belmont")    
  end
end

