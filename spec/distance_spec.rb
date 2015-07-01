require 'spec_helper'

describe Gpxrb::Distance do
  let(:gpx) {
    Gpxrb::Model::Gpx.new(data)
  }

  let(:waypoints) { 
    gpx.tracks[0].track_segments[0].waypoints
  }

  it 'calculates meters correctly' do
    expect(waypoints[0].distance_meters(waypoints[41])).to eq(225.9080574843058)
  end
end
