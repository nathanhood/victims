Fabricator(:student) do
  name { sequence(:name) { |i| "student#{i}" } }
  last_call 2.days.ago
end
