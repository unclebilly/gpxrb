require 'spec_helper'

SpeedPoint = Struct.new(:time) do
  include Gpxrb::Distance
  include Gpxrb::Speed

  def distance_meters(other)
    1000
  end
end

describe Gpxrb::Distance do

  let(:one) {
    SpeedPoint.new(DateTime.parse("2015-06-07T19:27:31Z").to_time.to_i)
  }

  let(:two) {
    SpeedPoint.new(DateTime.parse("2015-06-07T20:27:31Z").to_time.to_i)
  }

  it 'calculates kmh correctly' do
    expect(one.kmh(two)).to eq(1)
  end
end
