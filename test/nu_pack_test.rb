require File.expand_path(File.join(File.dirname(__FILE__), 'support'))
require 'nu_pack'
require 'test/unit'

class NuPackTest < Test::Unit::TestCase
  def test_food_three_people
    assert_equal 1591.58, NuPack::Calculator.new(price: 1299.99, people: 3, material: 'food').estimate
  end

  def test_negative_price
    assert_equal 1591.58, NuPack::Calculator.new(price: -1299.99, people: 3, material: 'food').estimate
  end

  def test_negative_people
    assert_equal 1591.58, NuPack::Calculator.new(price: 1299.99, people: -3, material: 'food').estimate
  end

  def test_default_people_count_one
    assert_equal 6199.81, NuPack::Calculator.new(price: 5432, material: 'drugs').estimate
  end

  def test_default_custom_flat_markup
    assert_equal 6495.04, NuPack::Calculator.new(price: 5432, flat_markup: 0.10, material: 'drugs').estimate
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
    assert_equal 5772.04, NuPack::Calculator.new(price: 5432, people: 1, material: 'food',
                                                 material_markup_calculator:  CustomMaterialMarkupCalculator.new('food')).estimate
    assert_equal 271.19, NuPack::Calculator.new(price: 220, people: 2, material: 'books',
                                                material_markup_calculator:  CustomMaterialMarkupCalculator.new('books')).estimate
  end

  class CustomPeopleMarkupCalculator
    def markup_for(people)
      people * 0.14
    end
  end
  def test_custom_people_markup_calculator
    assert_equal 2115.73, NuPack::Calculator.new(price: 1299.99, people: 3, material: 'food',
                                                 people_markup_calculator: CustomPeopleMarkupCalculator.new).estimate
  end
end
