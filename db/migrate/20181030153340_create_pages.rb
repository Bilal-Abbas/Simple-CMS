class CreatePages < ActiveRecord::Migration[5.2]
  def up
    create_table :pages do |t|
      
      t.integer "subject_id"

    	t.string "name", :null => false

    	t.string "permalink", :null => false

    	t.integer "position"

    	t.boolean "visible"

      t.timestamps

      puts "*** PAGES TABLE HAS BEEN CREATED ***"

    	end
      add_index("pages","subject_id")

      add_index("pages","permalink")
  	end

  def down
    drop_table :pages

    puts "*** PAGES TABLE HAS BEEN DELETED ***"
  end
end
