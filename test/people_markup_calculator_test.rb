require File.expand_path(File.join(File.dirname(__FILE__), 'support'))
require 'nu_pack/people_markup_calculator'
require 'test/unit'

class PeopleMarkupCalculatorTest < Test::Unit::TestCase
  def setup
    @people_markup_calculator = NuPack::PeopleMarkupCalculator.new
  end

  def test_n_persons
    3.times do |people|
      assert_equal 0.012 * people, @people_markup_calculator.markup_for(people)
    end
  end
end
