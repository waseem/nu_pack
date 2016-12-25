require File.expand_path(File.join(File.dirname(__FILE__), 'support'))
require 'nu_pack/material_markup_calculator'
require 'test/unit'

class MaterialMarkupCalculatorTest < Test::Unit::TestCase
  def setup
    @mmc = NuPack::MaterialMarkupCalculator.new
  end

  def test_food
    assert_equal 0.13, @mmc.markup_for('food')
  end

  def test_drugs
    assert_equal 0.075, @mmc.markup_for('drugs')
  end

  def test_electronics
    assert_equal 0.02, @mmc.markup_for('electronics')
  end

  def test_non_existing
    assert_equal 0, @mmc.markup_for('non_existing')
  end
end
