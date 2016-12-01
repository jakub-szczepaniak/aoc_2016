#!/usr/bin/env ruby
gem 'minitest', '>= 5.0.0'
require 'minitest/autorun'
require_relative 'day_1.rb'

class TaxiMetricTest < MiniTest::Test
  def test_distance_between_identical_base_points_is_zero
    assert_equal 0, d(0, 0, 0, 0)
  end

  def test_distance_between_points_moved_on_y_axis_is_one
    assert_equal 1, d(0, 0, 0, 1)
  end
end
