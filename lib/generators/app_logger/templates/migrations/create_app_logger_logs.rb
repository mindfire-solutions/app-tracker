class CreateAppLoggerLogs < ActiveRecord::Migration
  def change
    create_table :app_logger_logs do |t|
      t.string :ip
      t.string :controller
      t.string :action
      t.string :browser
      t.string :os, :default => 'unknown'
      t.string :previous_url
      t.string :current_url
      t.string :format
      t.string :country
      t.integer :current_user_id

      t.timestamps
    end
  end
end
