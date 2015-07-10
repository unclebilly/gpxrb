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

      def distance_meters
        tracks.map(&:distance_meters).reduce(:+)
      end

      def duration_seconds
        tracks[-1].last_time - tracks[0].first_time
      end
      
      def meters_per_second
        if duration_seconds == 0
          0
        else
          distance_meters.to_f / duration_seconds
        end
      end
    end
  end
end
