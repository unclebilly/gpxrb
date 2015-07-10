module Gpxrb
  module Distance
    EARTH_RADIUS=6371
    
    def radians(degrees)
      degrees * Math::PI / 180 
    end

    ##
    # Haversine distance with altitude
    #
    def distance_meters(other_waypoint)
      other_latitude, other_longitude, other_elevation = other_waypoint.to_a

      lat_distance = radians(other_latitude - latitude)
      lon_distance = radians(other_longitude - longitude)
      a            = (Math.sin(lat_distance / 2) ** 2) + 
                     (Math.cos(radians(latitude)) * Math.cos(radians(other_latitude)) * 
                       (Math.sin(lon_distance / 2.0) ** 2))
      c            = 2 * Math.atan2(Math.sqrt(a), Math.sqrt(1 - a))
      distance     = EARTH_RADIUS * c * 1000 # meters
      height       = elevation - other_elevation
      distance     = (distance ** 2) + (height ** 2)
      Math.sqrt(distance) 
    end
  end
end
