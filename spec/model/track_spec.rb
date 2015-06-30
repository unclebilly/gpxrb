require 'spec_helper'

describe Gpxrb::Model::Track do
  let(:fragment) {
    document.at_xpath("//xmlns:trk")
  }

  let(:model) {
    Gpxrb::Model::Track.new(fragment)
  }

  it 'parses a trk fragment' do
    expect(model.name).to eq("Running 6/7/15 2:27 pm")
    expect(model.time).to eq("2015-06-07T19:27:31Z")
  end

  it 'loads track segments' do
    expect(model.track_segments).to be_a(Array)
    expect(model.track_segments.count).to eq(1)
    expect(model.track_segments[0]).to be_a(Gpxrb::Model::TrackSegment)
  end

end

