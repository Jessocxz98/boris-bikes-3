require "DockingStation"

describe DockingStation do
  it { is_expected.to respond_to :release_bike }

  it 'releases working bikes' do
    bike1 = Bike.new
    subject.dock(bike1)
    bike = subject.release_bike
    expect(bike).to be_working
  end

  it 'docks something' do
    bike = Bike.new
    expect(subject.dock(bike)).to eq bike
  end

  it { is_expected.to respond_to(:bike) }

  it 'returns docked bikes' do
    bike = Bike.new
    subject.dock(bike)
    expect(subject.bike).to eq bike
  end
  
  it 'doesnt release a bike when there are none available' do
    expect { subject.release_bike }.to raise_error "No bikes available"
  end

  it 'doesnt accept more bikes than capacity' do
    bike = Bike.new
    20.times do |n|
      subject.dock(n)
    end
    expect { subject.dock(bike) }.to raise_error "This docking station is full"
  end

  it 'accepts more than 1 bike at a time' do
    bike = Bike.new
    bike2 = Bike.new
    subject.dock(bike)
    expect subject.dock(bike2) == bike2
  end

end

