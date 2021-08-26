require_relative "Bike"

class DockingStation
  attr_reader :bike
  DEFAULT_CAPACITY = 20

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
    if full?
      raise "This docking station is full"
    else
      @available.push(@bike)
      @bike
    end
  end

  private

  def full?
    @available.length >= DEFAULT_CAPACITY
  end

  def empty?
    @available.empty?
  end
end
