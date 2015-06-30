$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
require 'gpxrb'
require 'pry'


RSpec.configure do |c|
  module Helpers
    def data_file
      File.expand_path("../data/2015-06-07-1427.gpx", __FILE__)
    end

    def data
      File.read(data_file)
    end

    def document
      Nokogiri::XML.parse(data)
    end
  end

  c.include Helpers
end
