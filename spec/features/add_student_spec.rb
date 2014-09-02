
describe "add a student" do

  subject { page }
  
  before { visit root_path }

  describe "with invalid information" do
    before { click_button "Add Student" }

    it { should have_content("Student could not be added") }
  end

end
