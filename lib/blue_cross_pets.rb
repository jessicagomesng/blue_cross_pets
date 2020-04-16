require 'open-uri'
require 'nokogiri'
require 'pry'

module BlueCrossPets
  class Error < StandardError; end
  # Your code goes here...
end

require_relative "./blue_cross_pets/version"
require_relative "./blue_cross_pets/cli"
require_relative "./blue_cross_pets/scraper"
require_relative "./blue_cross_pets/pet"
require_relative "./blue_cross_pets/dog"
require_relative "./blue_cross_pets/cat"
