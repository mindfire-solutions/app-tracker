
require 'rails/generators'
require 'rails/generators/migration'

module AppLogger

	class InstallGenerator < Rails::Generators::Base
    include Rails::Generators::Migration

    source_root File.expand_path('../templates', __FILE__)

    def self.next_migration_number(path)
      @prev_migration_nr = Time.now.utc.strftime("%Y%m%d%H%M%S").to_i
    end

    def copy_migrations
      migration_template "migrations/create_app_logger_logs.rb", "db/migrate/create_app_logger_logs.rb"
    end

   # def add_intializer
      #template "initializer.rb", "config/initializers/survey_initializer.rb"
      #create_file "config/initializers/app_logs.rb",

     # "# replace User with your member resource.
     #  USER_RESOURCE = '" + file_name.camelize + "'"
   # end

    def add_routes
      engine_mount  = "mount AppLogger::Engine, :at => '/logs'"
      route engine_mount
    end

  end



end
