Fabricator(:student) do
  name { sequence(:name){ |i| "student#{i}"} }
  last_call Date.yesterday
end
