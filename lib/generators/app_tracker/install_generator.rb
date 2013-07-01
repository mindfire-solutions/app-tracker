
require 'rails/generators'
require 'rails/generators/migration'

module AppTracker

	class InstallGenerator < Rails::Generators::Base
    include Rails::Generators::Migration

    source_root File.expand_path('../templates', __FILE__)

    def self.next_migration_number(path)
      @prev_migration_nr = Time.now.utc.strftime("%Y%m%d%H%M%S").to_i
    end

    def copy_migrations
      migration_template "migrations/create_app_tracker_logs.rb", "db/migrate/create_app_tracker_logs.rb"
    end

    def add_routes
      engine_mount  = "mount AppTracker::Engine, :at => '/logs'"
      route engine_mount
    end

  end



end
