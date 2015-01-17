class AddAttributesToForm < ActiveRecord::Migration
	change_table(:users) do |u|
		u.column :age, :integer
		u.column :gender, :string
		u.column :first_name, :string
		u.column :last_name, :string
		u.column :school, :string
		u.column :facebook, :string
		u.column :linkedin, :string
		u.column :twitter, :string
		u.column :github, :string
		u.column :resume, :string
		u.column :website, :string
	end
end
