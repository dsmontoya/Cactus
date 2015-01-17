class AddAttributesToForms < ActiveRecord::Migration
      change_table(:forms) do |f|
    	f.column :proficiencies, :string, array: true
    	f.column :sponsor_you_want_to_see, :text
    	f.column :what_do_you_want_to_learn, :text
    	f.column :shirt_size, :string
    	f.column :dietary_restrictions, :text
    	f.column :code_of_conduct_read, :boolean
    	f.column :team_id, :integer
 	 end
end
