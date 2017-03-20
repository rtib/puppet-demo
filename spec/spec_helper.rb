# First line of spec/spec_helper.rb
require 'simplecov'

SimpleCov.start do
  add_filter '/spec/'
  # Exclude bundled Gems in `/.vendor/`
  add_filter '/.vendor/'
end

require 'puppetlabs_spec_helper/module_spec_helper'
# Further content
