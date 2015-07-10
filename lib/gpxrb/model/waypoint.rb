module Gpxrb
  module Model
    class Waypoint
      include Distance
      
      attr_accessor :latitude, :longitude, 
                    :elevation, :time

      def initialize(trkpt_ele)
        self.latitude  = trkpt_ele["lat"].to_f
        self.longitude = trkpt_ele["lon"].to_f
        self.elevation = trkpt_ele.at_xpath("xmlns:ele").content.to_i
        self.time      = DateTime.parse(trkpt_ele.at_xpath("xmlns:time").content).to_time.to_i
      end

      def to_a
        [latitude, longitude, elevation]
      end
    end
  end
end
