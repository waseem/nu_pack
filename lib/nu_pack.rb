require 'nu_pack/material_markup_calculator'

module NuPack
  class Calculator
    def initialize(price, people, material, markup_calculator = MaterialMarkupCalculator.new('food'))
      @price = price.abs   # Price should be positive
      @people = people.abs # People should be positive
      @material = material
    end

    def estimate
      flat_marked = @price * (1 + 0.05)
      (flat_marked * (1 + @people * 0.012 + MaterialMarkupCalculator.new(@material).markup)).round(2)
    end
  end
end
