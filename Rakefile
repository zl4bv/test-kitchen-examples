require 'kitchen/rake_tasks'

kitchen_tasks = []
namespace :examples do
  Dir.glob('examples/*/*/').each do |dir|
    split = dir.gsub(/-/, '_').split('/')
    namespace split[1].to_sym  do
      namespace split[2].to_sym do
        kitchen_tasks << "examples:#{split[1]}:#{split[2]}:kitchen:all".to_sym
        Dir.chdir(dir) { Kitchen::RakeTasks.new }
      end
    end
  end
end

desc 'Runs all kitchen tests in all the example directories'
task :kitchen_all => kitchen_tasks

task default: :kitchen_all

