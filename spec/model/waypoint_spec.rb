require 'spec_helper'

describe Gpxrb::Model::Waypoint do
  let(:fragment) {
    document.xpath("//xmlns:trkpt")[0]
  }

  let(:model) {
    Gpxrb::Model::Waypoint.new(fragment)
  }

  it 'parses a trkpt fragment' do
    # <trkpt lat="44.778534000" lon="-93.165466000">
    #   <ele>291.0</ele>
    #   <time>2015-06-07T19:27:31Z</time>
    # </trkpt>

    expect(model.latitude).to eq(44.778534000)
    expect(model.longitude).to eq(-93.165466000)
    expect(model.elevation).to eq(291.0)
    expect(model.time).to eq(1433705251)
  end
end

