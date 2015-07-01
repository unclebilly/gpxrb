require 'spec_helper'

describe Gpxrb::Model::TrackSegment do
  let(:fragment) {
    document.at_xpath("//xmlns:trkseg")
  }

  let(:model) {
    Gpxrb::Model::TrackSegment.new(fragment)
  }

  it 'loads waypoints' do
    expect(model.waypoints).to be_a(Array)
    expect(model.waypoints.count).to eq(1119)
    expect(model.waypoints[0]).to be_a(Gpxrb::Model::Waypoint)
  end
end

