require "bundler/gem_tasks"
require "rake/extensiontask"
require "rspec/core/rake_task"

task :build => :compile

Rake::ExtensionTask.new("hescape") do |ext|
  ext.lib_dir = "lib/hescape"
end

task :default => [:clobber, :compile, :spec]

begin
  require "rspec/core/rake_task"

  RSpec::Core::RakeTask.new(:spec)

  task :spec => :build
rescue LoadError
  # no rspec available
end
