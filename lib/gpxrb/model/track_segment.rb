module Gpxrb
  module Model
    class TrackSegment
      attr_accessor :waypoints

      def initialize(trkseg_ele)
        trkseg_ele.xpath("//xmlns:trkpt").each do |e|
          self.waypoints << Gpxrb::Model::Waypoint.new(e)
        end
      end

      def waypoints
        @waypoints ||= []
      end

      def distance_meters
        @d = 0.0
        waypoints.each_with_index.map do |w, i|
          if waypoints[i+1]
            @d += w.distance_meters(waypoints[i+1])
          else
            @d
          end
        end.reduce(&:+)
      end
    end
  end
end
