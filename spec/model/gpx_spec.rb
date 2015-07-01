require 'spec_helper'

describe Gpxrb::Model::Gpx do
  let(:model) {
    Gpxrb::Model::Gpx.new(data)
  }

  it 'parses a gpx file' do
    expect(model.version).to eq("1.1")
    expect(model.creator).to eq("RunKeeper - http://www.runkeeper.com")
    expect(model.tracks).to be_a(Array)
    expect(model.tracks.count).to eq(1)
    expect(model.tracks[0]).to be_a(Gpxrb::Model::Track)
  end
  it 'calculates distance' do
    expect(model.distance_meters).to eq(11.9)
    # http://answers.google.com/answers/threadview/id/326655.html
  end
end

