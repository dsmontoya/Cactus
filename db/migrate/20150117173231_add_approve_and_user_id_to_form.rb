class AddApproveAndUserIdToForm < ActiveRecord::Migration
  def change
  	add_column :forms, :status, :integer, default: 0
  	add_column :forms, :user_id, :integer
  end
end
