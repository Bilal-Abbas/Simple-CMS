class CreateSubjects < ActiveRecord::Migration[5.2]
  def up
    create_table :subjects do |t|

    	t.string "name", :null => false;

    	t.integer "position", :null => false;

    	t.boolean "visible", :default => false;
     
      t.timestamps

      puts "*** SUBJECTS TABLE HAS BEEN CREATED ***"
    end
  end

  def down
    drop_table :subjects

    puts "*** SUBJECT TABLE HAS BEEN DELETED ***"

  end
end
