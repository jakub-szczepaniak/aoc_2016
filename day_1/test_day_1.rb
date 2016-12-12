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

  def test_going_r1_changes_facing_to_east_and_distance_to_1
    landing = Position.new
    landing.go('R1')

    assert_equal 'East', landing.face
    assert_equal 1, Location.new(0, 0).taxi(landing.location)
  end

  def test_going_r2_changes_facing_to_east_and_distance_to_2
    landing = Position.new
    landing.go('R2')

    assert_equal 'East', landing.face
    assert_equal 2, Location.new(0, 0).taxi(landing.location)
  end
end
