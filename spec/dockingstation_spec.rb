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
end

