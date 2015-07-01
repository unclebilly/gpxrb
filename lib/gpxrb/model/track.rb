module Gpxrb
  module Model
    class Track
      attr_accessor :name, :time, :track_segments

      ##
      # trk_ele is a Nokogiri element
      def initialize(trk_ele)
        self.name = trk_ele.at_xpath('//xmlns:name').content
        self.time = trk_ele.at_xpath('//xmlns:time').content
        add_track_segments(trk_ele)
      end

      def add_track_segments(element)
        element.xpath("//xmlns:trkseg").each do |trkseg|
          self.track_segments << Gpxrb::Model::TrackSegment.new(trkseg)
        end
      end

      def track_segments
        @track_segments ||= []
      end

      def distance_meters
        track_segments.map(&:distance_meters).reduce(&:+)
      end
    end
  end
end
