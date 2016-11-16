require 'puppetlabs_spec_helper/rake_tasks'
require 'puppet-lint/tasks/puppet-lint'
require 'metadata-json-lint/rake_task'
require 'puppet_blacksmith/rake_tasks'

Rake::Task[:lint].clear
PuppetLint.configuration.send('disable_variable_is_lowercase')
PuppetLint::RakeTask.new :lint do |config|
    config.log_format = "%{path}:%{linenumber}:%{check}:%{KIND}:%{message}"
    config.fail_on_warnings = true
    config.ignore_paths = [
      "test/**/*.pp",
      "vendor/**/*.pp",
      "examples/**/*.pp",
      "spec/**/*.pp",
      "pkg/**/*.pp"
    ]
    config.disable_checks = ['class_inherits_from_params_class']
end

desc 'Validate manifests, templates, and ruby files'
task :validate do
  Dir['manifests/**/*.pp'].each do |manifest|
    sh "puppet parser validate --noop #{manifest}"
  end
  Dir['spec/**/*.rb', 'lib/**/*.rb'].each do |ruby_file|
    sh "ruby -c #{ruby_file}" unless ruby_file =~ %r{spec/fixtures}
  end
  Dir['templates/**/*.erb'].each do |template|
    sh "erb -P -x -T '-' #{template} | ruby -c"
  end
end

desc 'Run metadata_lint, lint, validate, and spec tests.'
task :test do
  [:metadata_lint, :lint, :validate, :spec].each do |test|
    Rake::Task[test].invoke
  end
end
