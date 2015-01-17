class CreateUniversity < ActiveRecord::Migration
  def change
    change_table :universities do |t|
    	t.column :country_code, :string
    	t.column :name, :string
    	t.column :domain, :string
    end
  end
end
