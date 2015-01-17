class AddTeamMembersToTeam < ActiveRecord::Migration
  def change
  	change_table :teams do |t|
  		t.column :teammate_1_id, :integer
  		t.column :teammate_2_id, :integer
  		t.column :teammate_3_id, :integer
  	end
  end
end
