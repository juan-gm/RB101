munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" },
  "Marilyn" => { "age" => 23, "gender" => "female"}
}

munsters.each do |k, v|
  if v["age"] < 18
    group = "kid"
  elsif v["age"] < 65
    group = "adult"
  else
    group = "senior"
  end
  v["age_group"] = group
end

puts munsters
