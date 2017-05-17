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

class TestFollowingDirections < MiniTest::Test
  def test_initial_position_is_0_0
    landing = Position.new

    verify_coordinates(landing.location, 0, 0)
  end

  def test_initial_position_is_facing_north
    landing = Position.new
    assert_equal 'North', landing.face
  end

  def test_going_r_changes_facing_to_east
    landing = Position.new
    landing.go('R1')

    assert_equal 'East', landing.face
  end

  def test_going_r18_changes_distance_to_18
    landing = Position.new
    landing.go('R18')

    verify_coordinates(landing.location, 18, 0)
  end

  def test_going_l_changes_facing_to_west
    landing = Position.new
    landing.go('L1')

    assert_equal 'West', landing.face
  end

  def test_going_l1_changes_location_to_minus_1
    landing = Position.new
    landing.go('L1')

    verify_coordinates(landing.location, -1, 0)
  end

  def test_going_r1_when_facing_south_changes_facing_to_west
    landing = Position.new('South')
    landing.go('R1')

    assert_equal 'West', landing.face
  end

  def verify_coordinates(location, x, y)
    assert_equal 0, Coordinates.new(x, y).taxi(location)
  end
end

class TestKeepingRoute < MiniTest::Test
  def xtest_keeps_list_of_first_default_locations
    landing = Position.new
    assert_equal true, landing.locations.include?(Coordinate.new(0, 0))
  end
end

class Test_SampleInput < MiniTest::Test
  def load_instructions
    input = 'R4, R3, R5, L3, L5, R2, L2, R5, L2, R5, R5, R5, R1, R3, L2, L2, L1, R5, L3, R1, L2, R1, L3, L5, L1, R3, L4, R2, R4, L3, L1, R4, L4, R3, L5, L3, R188, R4, L1, R48, L5, R4, R71, R3, L2, R188, L3, R2, L3, R3, L5, L1, R1, L2, L4, L2, R5, L3, R3, R3, R4, L3, L4, R5, L4, L4, R3, R4, L4, R1, L3, L1, L1, R4, R1, L4, R1, L1, L3, R2, L2, R2, L1, R5, R3, R4, L5, R2, R5, L5, R1, R2, L1, L3, R3, R1, R3, L4, R4, L4, L1, R1, L2, L2, L4, R1, L3, R4, L2, R3, L1, L5, R4, R5, R2, R5, R1, R5, R1, R3, L3, L2, L2, L5, R2, L2, R5, R5, L2, R3, L5, R5, L2, R4, R2, L1, R3, L5, R3, R2, R5, L1, R3, L2, R2, R1'
    input.split(', ')
  end
  def test_sample_input
    landing = Position.new

    instructions = load_instructions
    instructions.each { |command| landing.go(command) }
    assert_equal 271, landing.location.taxi(Coordinates.new(0, 0))
  end
end
