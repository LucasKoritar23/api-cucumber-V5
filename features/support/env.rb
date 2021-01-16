require 'rspec'
require 'cucumber'
require 'pry'
require 'httparty'
require 'allure-cucumber'


AllureCucumber.configure do |config|
  config.results_directory = "reports/allure-results"
  config.clean_results_directory = true
  config.logging_level = Logger::INFO
end
