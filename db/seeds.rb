puts "Roles"
roles = Role::ROLES
roles.each do |r|
  Role.find_or_create_by!(name: r)
end

puts "Period Types"
PeriodType.create!(semester: true)
PeriodType.create!(semester: false)

puts "Periods"
periods = Period::PERIOD_NUMBERS
periods.each do |p|
  Period.find_or_initialize_by(period_number: p).save!(validate: false)
end

puts "Schools"
schools = School::SCHOOLS
schools.each do |s|
  School.find_or_initialize_by(name: s).save!(validate: false)
end