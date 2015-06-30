require 'spec_helper'

describe Gpxrb::Distance do
  let(:gpx) {
    Gpxrb::Model::Gpx.new(data)
  }
  let(:waypoints) { 
    gpx.tracks[0].track_segments[0].waypoints
  }
  it 'calculates distance correctly' do
    pt1 = waypoints[0]
    pt2 = waypoints[1]
    assert_equal(83.2, Gpxrb::Distance.km(pt1, pt2))
  end
end
