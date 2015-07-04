module Gpxrb
	module Speed
		def kmh(other_waypoint)
			m       = distance_meters(other_waypoint) # meters
			km      = m / 1000.0
			seconds = other_waypoint.time - time      # seconds
			hours   = seconds / 60.0 / 60.0
			(km / hours)
		end
	end
end