# Add your own tasks in files placed in lib/tasks ending in .rake,
# for example lib/tasks/capistrano.rake, and they will automatically be available to Rake.

require File.expand_path('../config/application', __FILE__)

Rails.application.load_tasks

require "bundler/gem_tasks"
 require 'rspec/core/rake_task'
 
 desc "Run specs"
 RSpec::Core::RakeTask.new
 
 desc 'Default: run specs.'
 task :default => :spec