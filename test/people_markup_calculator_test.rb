require File.expand_path(File.join(File.dirname(__FILE__), 'support'))
require 'nu_pack/people_markup_calculator'
require 'test/unit'

class PeopleMarkupCalculatorTest < Test::Unit::TestCase
  def test_n_persons
    3.times do |people|
      markup = NuPack::PeopleMarkupCalculator.new(people).markup
      assert_equal 0.012 * people, markup
    end
  end

  def test_negative_markup
    people = -3
    assert_equal (0.012 * people).abs, NuPack::PeopleMarkupCalculator.new(people).markup
  end
end
