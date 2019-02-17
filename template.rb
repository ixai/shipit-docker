# Template for rails new app
# Run this like `rails new shipit -m template.rb`
if Gem::Version.new(RUBY_VERSION) < Gem::Version.new('2.3')
  raise Thor::Error, "You need at least Ruby 2.3 to install shipit"
end
if Gem::Version.new(Rails::VERSION::STRING) < Gem::Version.new('5.2')
  raise Thor::Error, "You need Rails 5.2 to install shipit"
end

route %(mount Shipit::Engine, at: '/')

gem 'sidekiq'
gem 'shipit-engine'
gem 'redis-rails'

environment 'config.cache_store = :redis_store, Shipit.redis_url.to_s, { expires_in: 90.minutes }', env: :production

inject_into_file 'config/application.rb', after: "load_defaults 5.2\n" do
  "\n    config.active_job.queue_adapter = :sidekiq\n"
end

inject_into_file "Gemfile", "ruby '#{RUBY_VERSION}'", after: "source 'https://rubygems.org'\n"

gsub_file 'Gemfile', "# Use sqlite3 as the database for Active Record", ''
gsub_file 'Gemfile', "gem 'sqlite3'", ''
gem_group :production do
  gem 'pg'
end
gem_group :development, :test do
  gem 'sqlite3'
end