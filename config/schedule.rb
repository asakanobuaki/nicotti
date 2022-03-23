require File.expand_path(File.dirname(__FILE__) + "/environment")
require 'active_support'

rails_env = ENV['RAILS_ENV'] || :development

set :environment, rails_env

set :output, "#{Rails.root}/log/cron.log"

job_type :rake, "export PATH=\"$HOME/.rbenv/bin:$PATH\"; eval \"$(rbenv init -)\"; cd :path && RAILS_ENV=:environment bundle exec rake :task :output"

every 1.day, at: Date.today.end_of_day do
  rake 'registration_smokings:save_number_of_smokings'
end
