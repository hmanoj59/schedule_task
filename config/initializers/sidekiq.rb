# disable sidekiq web until sinatra is compatible with rails 5
# require 'sidekiq/web'
# require 'sidekiq/cron/web'

Sidekiq.configure_server do |config|
  config.redis = { url: ENV['JOB_WORKER_URL'], namespace: ENV['APPCODE'] }
end

Sidekiq.configure_client do |config|
  config.redis = { url: ENV['JOB_WORKER_URL'], namespace: ENV['APPCODE'] }
end

# # cron jobs
# Sidekiq::Cron::Job.destroy_all!
# job = Sidekiq::Cron::Job.new(
#   class: 'CloudScheduler',
#   name: 'CloudScheduler',
#   cron: '*/1 * * * *'
# )
# unless job.save
#   puts job.errors
# end
