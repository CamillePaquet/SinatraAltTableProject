require 'rubygems'
require 'rspec'
require 'rake'
require "rubygems/package_task"
require 'rspec/core/rake_task'
require 'rake/testtask'

#RSpec::Core::RakeTask.new('spec')


RSpec::Core::RakeTask.new do |task|
    test_dir = "organisation_carte/spec"
    task.pattern = "#{test_dir}/*_spec.rb"
end


Rake::TestTask.new do |t|
    test_dir = "organisation_carte/spec"
	t.pattern = "organisation_carte/services/units_tests/tests_*.rb"
end

