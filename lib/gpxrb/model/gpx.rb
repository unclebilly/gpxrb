module Gpxrb
  module Model
    class Gpx
      attr_accessor :creator, :version, :tracks

      def initialize(xml_string)
        document = Nokogiri::XML.parse(xml_string)
        gpx = document.at_xpath("//xmlns:gpx")
        self.creator = gpx["creator"]
        self.version = gpx["version"]
        add_tracks(document)
      end

      def add_tracks(document)
        document.xpath("//xmlns:trk").each do |trk|
          self.tracks << Gpxrb::Model::Track.new(trk)
        end
      end

      def tracks
        @tracks ||= []
      end

      def distance(unit=:km)
        0
      end
    end
  end
end
