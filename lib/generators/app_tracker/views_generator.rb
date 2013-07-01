module AppTracker
  module Generators

    module ViewPathTemplates 
      extend ActiveSupport::Concern

      included do
        public_task :copy_views
      end

      def copy_views
        view_directory :dashboard
        view_directory :logs
      end

      protected

      def view_directory(name, _target_path = nil)
        directory name.to_s, "app/views/app_tracker/#{name}" do |content|
            content
        end
      end
    end

    class ViewsGenerator < Rails::Generators::Base
      include ViewPathTemplates
      desc "Copies AppTracker views to your application."
      source_root File.expand_path("../../../../app/views/app_tracker", __FILE__)
    end

  end
end
