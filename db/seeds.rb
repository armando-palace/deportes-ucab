puts "Roles"
roles = Role::ROLES
  roles.each do |r|
    Role.find_or_create_by!(name: r)
  end
end

