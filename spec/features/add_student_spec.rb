
describe "add a student" do

  subject { page }

  before { visit root_path }

  describe "with valid information" do
    before { fill_in "Name", with: "Jerry" }
    before { click_on "Add Student" }
    it { should have_content("Jerry has been added as a student") }
  end

end
