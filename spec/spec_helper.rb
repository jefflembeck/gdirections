$LOAD_PATH.unshift(File.dirname(__FILE__))
$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..', 'lib'))
require 'gdirections'
require 'spec'
require 'spec/autorun'
require 'httparty'
require 'hashie'

Spec::Runner.configure do |config|
  
end
