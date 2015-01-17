class ChangeFormAttributes < ActiveRecord::Migration
  def change
  	remove_column :forms, :interests
  	add_column :forms, :interests, :string, array: true
  end
end
