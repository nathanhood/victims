feature "pick a victim" do
  scenario "we pressed the button" do
    visit '/'
    click_on "Pick a Victim"
    expect(page).to have_content("- No students to victimize")
  end

  scenario "we press the button with a student" do
    Fabricate(:student)
    visit '/'
    click_on "Pick a Victim"
    expect(page).to have_content("student0 has been victimized")
  end
end
