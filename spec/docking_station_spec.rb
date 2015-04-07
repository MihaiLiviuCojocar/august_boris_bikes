require 'docking_station'

describe DockingStation do
  let(:old_street)         { DockingStation.new                         }
  let(:station_with_bikes) { DockingStation.new(bikes: [:bike1, :bike2])}

  it 'has no bikes' do
    expect(old_street.bikes).to eq []
  end

  it 'can be created with some bikes' do
    expect(station_with_bikes.bikes).to eq [:bike1, :bike2]
  end

  it 'should be able to dock a bike' do
    expect(old_street).to respond_to(:dock)
  end

  it 'has a bike after docking one' do
    bike = double :bike
    old_street.dock(bike)
    expect(old_street.bikes).to eq [bike]
  end

  it 'can release a bike to a person' do
    expect(station_with_bikes.bikes.count).to eq 2
    station_with_bikes.release_a_bike
    expect(station_with_bikes.bikes.count).to eq 1
  end
end
