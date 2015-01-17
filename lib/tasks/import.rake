#lib/tasks/import.rake
require 'csv'
desc "Imports a CSV file into an ActiveRecord table"
task :import, [:filename] => :environment do    
    CSV.foreach('universities.csv', :headers => true) do |row|
      University.create!(row.to_hash)
    end
end