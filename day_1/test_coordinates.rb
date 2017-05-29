#!/usr/bin/env ruby
gem 'minitest', '>= 5.0.0'
require 'minitest/autorun'
require_relative 'day_1.rb'

class TaxiMetricTest < MiniTest::Test
  def test_distance_between_identical_base_points_is_zero
    location = Coordinates.new(0, 0)
    assert_equal 0, location.taxi(location)
  end

  def test_distance_between_points_moved_on_y_axis_is_one
    location = Coordinates.new(0, 0)

    assert_equal 1, location.taxi(Coordinates.new(0, 1))
  end

  def test_distance_between_points_moved_on_x_axis_is_one
    location = Coordinates.new(1, 0)
    assert_equal 1, location.taxi(Coordinates.new(0, 0))
  end

  def test_distance_between_1_1_and_0_0_is_two
    location = Coordinates.new(1, 1)
    assert_equal 2, location.taxi(Coordinates.new(0, 0))
  end
  def test_equality_between_same_location
    location1 = Coordinates.new(0, 0)
    location2 = Coordinates.new(0, 0)
    assert_equal true,  location1 == location2
  end
  def test_not_equal_for_different_coordinates
    location1 = Coordinates.new(0, 1)
    location2 = Coordinates.new(1, 0)
    assert_equal false,  location1 == location2
  end
end
