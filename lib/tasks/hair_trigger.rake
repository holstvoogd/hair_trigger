namespace :db do
  desc "Creates a database migration for any newly created/modified/deleted triggers in the models"
  task :generate_trigger_migration => :environment do
    if file_name = HairTrigger.generate_migration
      puts "Generated #{file_name}"
    else
      puts "Nothing to do"
    end
  end

  namespace :schema do
    task dump: :set_previous_schema
    task set_previous_schema: :environment do
      require 'active_record/schema_dumper'
      filename = ENV['SCHEMA'] || "#{Rails.root}/db/schema.rb"
      puts "fkjahljksadfhlasjdfhjsadhfgas"*100
      ActiveRecord::SchemaDumper.previous_schema = File.exist?(filename) ? File.read(filename) : nil
    end
  end
end
