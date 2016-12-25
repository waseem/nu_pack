require 'nu_pack/material_markup_calculator'

module NuPack
  class Calculator
    def initialize(price, people, material, material_markup_calculator = MaterialMarkupCalculator.new)
      @price  = price.abs   # Price should be positive
      @people = people.abs # People should be positive

      @material = material
      @material_markup_calculator = material_markup_calculator
    end

    def estimate
      flat_marked = @price * (1 + 0.05)
      (flat_marked * (1 + @people * 0.012 + @material_markup_calculator.markup_for(@material))).round(2)
    end
  end
end
