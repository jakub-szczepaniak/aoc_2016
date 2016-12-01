#!/usr/bin/env ruby
gem 'minitest', '>= 5.0.0'
require 'minitest/autorun'
require_relative 'day_1.rb'

class TaxiMetricTest < MiniTest::Test
  def test_distance_between_identical_base_points_is_zero
    location_0 = Location.new(0, 0)
    assert_equal 0, d(0, 0, 0, 0)
  end

  def test_distance_between_points_moved_on_y_axis_is_one
    assert_equal 1, d(0, 0, 0, 1)
  end

  def test_distance_between_points_moved_on_x_axis_is_one
    assert_equal 1, d(1, 0, 0, 0)
  end

  def test_distance_between_1_1_and_0_0_is_two
    assert_equal 2, d(1, 1, 0, 0)
  end
end
