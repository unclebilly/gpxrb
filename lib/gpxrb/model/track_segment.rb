module Gpxrb
  module Model
    class TrackSegment
      attr_accessor :waypoints

      def initialize(trkseg_ele)
        trkseg_ele.xpath("xmlns:trkpt").each do |e|
          self.waypoints << Gpxrb::Model::Waypoint.new(e)
        end
      end

      def waypoints
        @waypoints ||= []
      end

      def distance_meters
        waypoints.each_cons(2).inject(0) do |accum, pts|
          accum += pts[0].distance_meters(pts[1])
        end
      end

      def first_time
        waypoints.first.time
      end

      def last_time
        waypoints.last.time
      end
    end
  end
end
