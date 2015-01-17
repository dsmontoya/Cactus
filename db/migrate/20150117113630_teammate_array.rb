class TeammateArray < ActiveRecord::Migration
  def change
  	remove_column :teams, :teammate_1_id
  	remove_column :teams, :teammate_2_id
  	remove_column :teams, :teammate_3_id
  	add_column :teams, :teammates, :integer, array: true
  end
end
