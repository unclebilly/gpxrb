module Gpxrb
  module Model
    class TrackSegment
      attr_accessor :track_points

      def initialize(trkseg_ele)
        trkseg_ele.xpath("//xmlns:trkpt").each do |e|
          self.track_points << Gpxrb::Model::Waypoint.new(e)
        end
      end

      def track_points
        @track_points ||= []
      end
    end
  end
end
