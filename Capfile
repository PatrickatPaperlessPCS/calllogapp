# # Load DSL and set up stages
# require "capistrano/setup"

# # Include default deployment tasks
# require "capistrano/deploy"

# # Include tasks from other gems included in your Gemfile
# #
# # For documentation on these, see for example:
# #
# #   https://github.com/capistrano/rvm
# #   https://github.com/capistrano/rbenv
# #   https://github.com/capistrano/chruby
# #   https://github.com/capistrano/bundler
# #   https://github.com/capistrano/rails
# #   https://github.com/capistrano/passenger
# #
# # require 'capistrano/rvm'
# # require 'capistrano/rbenv'
# # require 'capistrano/chruby'
# # require 'capistrano/bundler'
# # require 'capistrano/rails/assets'
# # require 'capistrano/rails/migrations'
# # require 'capistrano/passenger'

# # Load custom tasks from `lib/capistrano/tasks` if you have any defined
# Dir.glob("lib/capistrano/tasks/*.rake").each { |r| import r }

# from digital ocean instructions https://www.digitalocean.com/community/tutorials/deploying-a-rails-app-on-ubuntu-14-04-with-capistrano-nginx-and-puma
# Load DSL and Setup Up Stages
require 'capistrano/setup'
require 'capistrano/deploy'

require 'capistrano/rails'
require 'capistrano/bundler'
require 'capistrano/rvm'
require 'capistrano/puma'

# Loads custom tasks from `lib/capistrano/tasks' if you have any defined.
Dir.glob('lib/capistrano/tasks/*.rake').each { |r| import r }