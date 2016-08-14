require "bundler/gem_tasks"
require "rake/extensiontask"

task :build => :compile

Rake::ExtensionTask.new("hescape") do |ext|
  ext.lib_dir = "lib/hescape"
end

task :default => [:clobber, :compile, :spec]
