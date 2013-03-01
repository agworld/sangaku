# encoding: utf-8

require 'rubygems'
require 'bundler'
begin
  Bundler.setup(:default, :development)
rescue Bundler::BundlerError => e
  $stderr.puts e.message
  $stderr.puts "Run `bundle install` to install missing gems"
  exit e.status_code
end
require 'rake'

require 'jeweler'
Jeweler::Tasks.new do |gem|
  # gem is a Gem::Specification... see http://docs.rubygems.org/read/chapter/20 for more options
  gem.name = "sangaku"
  gem.homepage = "https://github.com/agworld/sangaku"
  gem.license = "MIT"
  gem.summary = "Sangaku is a geometry gem for Ruby."
  gem.description = "Sangaku contains classes for Point, Line, Polygon, AABB and so on in 2D. It can find the 'pole of inaccessibility' for a polygon. And it can simply the boundary of a polygon to minimise points while retaining detail. It works well with Gosu."
  gem.email = "jason.hutchens@agworld.com.au"
  gem.authors = ["Jason Hutchens"]
  # dependencies defined in Gemfile
end
Jeweler::RubygemsDotOrgTasks.new

require 'rspec/core'
require 'rspec/core/rake_task'
RSpec::Core::RakeTask.new(:spec) do |spec|
  spec.pattern = FileList['spec/**/*_spec.rb']
end

RSpec::Core::RakeTask.new(:rcov) do |spec|
  spec.pattern = 'spec/**/*_spec.rb'
  spec.rcov = false
end

task :default => :spec

require 'yard'
YARD::Rake::YardocTask.new
