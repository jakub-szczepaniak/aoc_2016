#!/usr/bin/env ruby
gem 'minitest', '>= 5.0.0'
require 'minitest/autorun'
require_relative 'day_1.rb'

class TaxiMetricTest < MiniTest::Test
  def test_distance_between_identical_base_points_is_zero
    location = Location.new(0, 0)
    assert_equal 0, location.taxi(location)
  end

  def test_distance_between_points_moved_on_y_axis_is_one
    location = Location.new(0, 0)

    assert_equal 1, location.taxi(Location.new(0, 1))
  end

  def test_distance_between_points_moved_on_x_axis_is_one
    location = Location.new(1, 0)
    assert_equal 1, location.taxi(Location.new(0, 0))
  end

  def test_distance_between_1_1_and_0_0_is_two
    location = Location.new(1, 1)
    assert_equal 2, location.taxi(Location.new(0, 0))
  end
end

class TestFollowingDirections < MiniTest::Test
  def test_initial_position_is_0_0
    landing = Position.new
    assert_equal 0, Location.new(0, 0).taxi(landing.location)
  end

  def test_initial_position_is_facing_north
    landing = Position.new
    assert_equal 'North', landing.face
  end

  def test_going_r_changes_initial_facing_to_east
    landing = Position.new
    landing.go('R1')

    assert_equal 'East', landing.face
  end

  def test_going_r18_changes_distance_to_18
    landing = Position.new
    landing.go('R18')

    assert_equal 18, Location.new(0, 0).taxi(landing.location)
  end

  def test_going_l_changes_initial_facing_to_west
    landing = Position.new
    landing.go('L1')

    assert_equal 'West', landing.face
  end
end
