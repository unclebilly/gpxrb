module Gpxrb
  class Distance
    EARTH_RADIUS=6371
    
    def radians(degrees)
      degrees * Math::PI / 180 
    end

    def km(lat1, lon1, alt1, lat2, lon2, alt2)
      # /*
      #  * Calculate distance between two points in latitude and longitude taking
      #  * into account height difference. If you are not interested in height
      #  * difference pass 0.0. Uses Haversine method as its base.
      #  * 
      #  * lat1, lon1 Start point lat2, lon2 End point el1 Start altitude in meters
      #  * el2 End altitude in meters
      #  * @returns Distance in Meters
      #  */
      # public static double distance(double lat1, double lat2, double lon1,
      #         double lon2, double el1, double el2) {

      #     final int R = 6371; // Radius of the earth

      #     Double latDistance = Math.toRadians(lat2 - lat1);
      #     Double lonDistance = Math.toRadians(lon2 - lon1);
      #     Double a = Math.sin(latDistance / 2) * Math.sin(latDistance / 2)
      #             + Math.cos(Math.toRadians(lat1)) * Math.cos(Math.toRadians(lat2))
      #             * Math.sin(lonDistance / 2) * Math.sin(lonDistance / 2);
      #     Double c = 2 * Math.atan2(Math.sqrt(a), Math.sqrt(1 - a));
      #     double distance = R * c * 1000; // convert to meters

      #     double height = el1 - el2;

      #     distance = Math.pow(distance, 2) + Math.pow(height, 2);

      #     return Math.sqrt(distance);
      # }
      #
      #
      #
      # var R = 6371000; // metres
      # var φ1 = lat1.toRadians();
      # var φ2 = lat2.toRadians();
      # var Δφ = (lat2-lat1).toRadians();
      # var Δλ = (lon2-lon1).toRadians();

      # var a = Math.sin(Δφ/2) * Math.sin(Δφ/2) +
      #         Math.cos(φ1) * Math.cos(φ2) *
      #         Math.sin(Δλ/2) * Math.sin(Δλ/2);
      # var c = 2 * Math.atan2(Math.sqrt(a), Math.sqrt(1-a));

      # var d = R * c;
      lat_distance = radians(lat2 - lat1)
      lon_distance = radians(lon2 - lon1)
      a = (Math.sin(lat_distance / 2) ** 2) + 

    end
  end
end
