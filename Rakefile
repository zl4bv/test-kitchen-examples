require 'erb'
require 'kitchen/rake_tasks'

ssh_key_data = ERB.new(File.read('test-kitchen.pem.erb')).result
File.open('test-kitchen.pem', 'w') { |file| file.write(ssh_key_data) }

kitchen_tasks = []
namespace :examples do
  Dir.glob('examples/*/*/').each do |dir|
    split = dir.gsub(/-/, '_').split('/')
    namespace split[1].to_sym  do
      namespace split[2].to_sym do
        Dir.chdir(dir) { Kitchen::RakeTasks.new }
        kitchen_tasks << "examples:#{split[1]}:#{split[2]}:kitchen:all".to_sym
        File.open(File.join(dir, 'test-kitchen.pem'), 'w') { |file| file.write(ssh_key_data) }
      end
    end
  end
end

desc 'Runs all kitchen tests in all the example directories'
task :kitchen_all => kitchen_tasks

task default: :kitchen_all

