require 'spec_helper'

describe Gpxrb::Model::TrackSegment do
  let(:fragment) {
    document.at_xpath("//xmlns:trkseg")
  }

  let(:model) {
    Gpxrb::Model::TrackSegment.new(fragment)
  }

  it 'loads waypoints' do
    expect(model.track_points).to be_a(Array)
    expect(model.track_points.count).to eq(1119)
    expect(model.track_points[0]).to be_a(Gpxrb::Model::Waypoint)
  end
end

