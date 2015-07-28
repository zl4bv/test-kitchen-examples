require 'erb'
require 'kitchen'

Kitchen.logger = Kitchen.default_file_logger(nil, false)

file 'test-kitchen.pem' => 'test-kitchen.pem.erb' do |task|
  ssh_key_data = ERB.new(File.read(task.source)).result
  File.open(task.name, 'w') { |file| file.write(ssh_key_data) }
  chmod(0700, task.name)
end

EXAMPLES = FileList['examples/*/*']
EXAMPLES.each do |example|
  project_config = File.join(example, '.kitchen.yml')
  config = Kitchen::Config.new(
    loader: Kitchen::Loader::YAML.new(project_config: project_config),
    kitchen_root: example,
    log_level: :debug
  )
  config.instances.each do |instance|
    example_instance = "#{example}/#{instance.name}"
    task example_instance => 'test-kitchen.pem' do
      instance.test(:always)
    end
    task :examples => example_instance
  end
end

task default: :examples

