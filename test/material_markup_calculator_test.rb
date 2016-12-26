require File.expand_path(File.join(File.dirname(__FILE__), 'support'))
require 'nu_pack/material_markup_calculator'
require 'test/unit'

class MaterialMarkupCalculatorTest < Test::Unit::TestCase

  def test_food
    mmc = NuPack::MaterialMarkupCalculator.new('food')
    assert_equal 0.13, mmc.markup
  end

  def test_drugs
    mmc = NuPack::MaterialMarkupCalculator.new('drugs')
    assert_equal 0.075, mmc.markup
  end

  def test_electronics
    mmc = NuPack::MaterialMarkupCalculator.new('electronics')
    assert_equal 0.02, mmc.markup
  end

  def test_non_existing
    mmc = NuPack::MaterialMarkupCalculator.new('non_existing')
    assert_equal 0, mmc.markup
  end
end
