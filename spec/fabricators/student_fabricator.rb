Fabricator(:student) do
  name { sequence(:name) { |i| "student#{i}" } }
  last_call "2014-09-02 14:24:06"
end
