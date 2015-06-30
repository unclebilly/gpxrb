module Gpxrb
  module Model
    class Waypoint
      attr_accessor :latitude, :longitude, 
                    :elevation, :time

      def initialize(trkpt_ele)
        self.latitude = trkpt_ele["lat"].to_f
        self.longitude = trkpt_ele["lon"].to_f
        self.elevation = trkpt_ele.at_xpath("//xmlns:ele").content.to_i
        self.time = trkpt_ele.at_xpath("//xmlns:time").content
      end
    end
  end
end
