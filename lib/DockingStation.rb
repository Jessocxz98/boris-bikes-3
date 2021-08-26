require_relative "Bike"

class DockingStation
  attr_reader :bike

  def initialize
    @available = []
  end

  def release_bike
    if @available.length >= 1
      return @available[-1]
      @available.pop[-1]
    else
      raise "No bikes available"
    end
  end

  def dock(bike)
    @bike = bike
    if @available.length >= 1
      raise "This docking station is full"
    else
      @available.push(@bike)
      @bike
    end
  end
end
