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
    verbose = false
end

RSpec::Core::RakeTask.new do |task|
    test_dir = "gestion_commandes/spec"
    task.pattern = "#{test_dir}/*_spec.rb"
    verbose = false
end




Rake::TestTask.new do |t|
	t.pattern = "gestion_commandes/services/units_tests/tests_*.rb"
end

