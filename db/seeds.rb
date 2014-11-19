##################################
# Roles
##################################
[
  "Admin",
  "Staff",
  "Owner",
  "Manager"
].each do |role|
  role = Role.find_or_create_by_name(:name => role)
end