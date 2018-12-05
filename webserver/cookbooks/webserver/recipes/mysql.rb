

#include_recipe "mysql"
#https://github.com/sous-chefs/mysql 

mysql_service 'foo' do
  port '3306'
  version '5.5'
  initial_root_password 'change me'
  action [:create, :start]
end