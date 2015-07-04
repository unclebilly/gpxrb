require 'spec_helper'

SillyPoint = Struct.new(:latitude, :longitude, :elevation) do
  include Gpxrb::Distance
end

describe Gpxrb::Distance do
  let(:one) {
    SillyPoint.new(44.778534000, -93.165466000, 10)
  }

  let(:two) {
    SillyPoint.new(44.788534000, -93.165466000, 10)
  }

  it 'calculates meters correctly' do
    expect(one.distance_meters(two).round).to eq(1_112)
  end
end
