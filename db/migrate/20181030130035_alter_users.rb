class AlterUsers < ActiveRecord::Migration[5.2]
  
  def up
  	rename_table("users", "admin_users")

  	add_column("admin_users","username", :string, :limit => 25, :after => "email")

  	change_column("admin_users","email", :string, :limit => 40)
  	
    change_column("admin_users","first_name", :string, :limit => 40, :null => false)
  	
    change_column("admin_users","last_name", :string, :limit => 40, :null => false)

  	rename_column("admin_users", "password" ,"hashed_password")

  	add_index("admin_users", "username")


  	puts "*** Table name changed to admin_users ***"
  end

  def down
  	
  	remove_index("admin_users", "username")

  	rename_column("admin_users", "hashed_password" ,"password")

    change_column("admin_users","email", :string, :limit => 40)

    remove_column("admin_users","username")

  	rename_table("admin_users", "users")

	puts "*** Table name changed back to users ***"
  	
  end
end
