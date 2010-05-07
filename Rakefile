require 'rubygems'
require 'rake'

require "lib/aus_post/drc"

begin
  require 'jeweler'
  Jeweler::Tasks.new do |gem|
    gem.name        = "auspost-drc"
    gem.summary     = %Q{AusPost Delivery Rate Calculator Gem}
    gem.description = %Q{Gem for AusPost Delivery Rate Calculator - Making it easy to calculate shipping}
    gem.email       = "sutto@sutto.net"
    gem.homepage    = "http://github.com/Sutto/auspost-drc"
    gem.authors     = ["Darcy Laycock"]
    gem.version     = AusPost::DRC::VERSION
    gem.add_development_dependency "shoulda", ">= 0"
  end
  Jeweler::GemcutterTasks.new
rescue LoadError
  puts "Jeweler (or a dependency) not available. Install it with: gem install jeweler"
end

require 'rake/testtask'
Rake::TestTask.new(:test) do |test|
  test.libs << 'lib' << 'test'
  test.pattern = 'test/**/test_*.rb'
  test.verbose = true
end

task :test => :check_dependencies

task :default => :test

require 'rake/rdoctask'
Rake::RDocTask.new do |rdoc|
  version       = AusPost::DRC::VERSION
  rdoc.rdoc_dir = 'rdoc'
  rdoc.title    = "austpost-drc #{version}"
  rdoc.rdoc_files.include('README*')
  rdoc.rdoc_files.include('lib/**/*.rb')
end
