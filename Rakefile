#require "bundler/gem_tasks"
require "rake/testtask"

Rake.add_rakelib 'lib/tasks'

Rake::TestTask.new(:test) do |t|
  t.test_files = FileList['test/**/*.test.rb']
end
desc "Run tests"

task default: :test
