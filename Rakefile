require 'puppetlabs_spec_helper/rake_tasks'
require 'puppet-lint/tasks/puppet-lint'
require 'metadata-json-lint/rake_task'
require 'puppet_blacksmith/rake_tasks'

Rake::Task[:lint].clear
PuppetLint.configuration.send('disable_variable_is_lowercase')
PuppetLint::RakeTask.new :lint do |config|
  config.log_format = '%{path}:%{linenumber}:%{check}:%{KIND}:%{message}'
  config.fail_on_warnings = true
  config.ignore_paths = [
    'test/**/*.pp',
    'vendor/**/*.pp',
    'examples/**/*.pp',
    'spec/**/*.pp',
    'pkg/**/*.pp'
  ]
  config.disable_checks = ['class_inherits_from_params_class']
end
