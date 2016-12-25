require File.expand_path(File.join(File.dirname(__FILE__), 'support'))
require 'nu_pack'
require 'test/unit'

class NuPackTest < Test::Unit::TestCase
  def test_food_three_people
    assert_equal 1591.58, NuPack::Calculator.new(1299.99, 3, 'food').estimate
  end

  def test_negative_price
    assert_equal 1591.58, NuPack::Calculator.new(-1299.99, 3, 'food').estimate
  end

  def test_negative_people
    assert_equal 1591.58, NuPack::Calculator.new(1299.99, -3, 'food').estimate
  end

  def test_drugs_one_person
    assert_equal 6199.81, NuPack::Calculator.new(5432, 1, 'drugs').estimate
  end

  def test_electronics_two_person
    assert_equal 735.28, NuPack::Calculator.new(670.75, 2, 'electronics').estimate
  end

  def test_books_four_people
    assert_equal 13707.63, NuPack::Calculator.new(12456.95, 4, 'books').estimate
  end

  class CustomMaterialMarkupCalculator
    def initialize(material)
      @material = material
    end

    def markup
      {
        'books' => 0.15
      }[@material] || 0
    end
  end
  def test_custom_material_markup_calculator
    assert_equal 5772.04, NuPack::Calculator.new(5432, 1, 'food', CustomMaterialMarkupCalculator.new('food')).estimate
    assert_equal 240.01, NuPack::Calculator.new(220, 2, 'books', CustomMaterialMarkupCalculator.new('books')).estimate
  end
end
