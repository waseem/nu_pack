require File.expand_path(File.join(File.dirname(__FILE__), 'support'))
require 'nu_pack/material_markup_calculator'
require 'test/unit'

class MaterialMarkupCalculatorTest < Test::Unit::TestCase
  def test_food
    assert_equal 0.13, NuPack::MaterialMarkupCalculator.new('food').markup
  end

  def test_drugs
    assert_equal 0.075, NuPack::MaterialMarkupCalculator.new('drugs').markup
  end

  def test_electronics
    assert_equal 0.02, NuPack::MaterialMarkupCalculator.new('electronics').markup
  end

  def test_non_existing
    assert_equal 0, NuPack::MaterialMarkupCalculator.new('non_existing').markup
  end
end
