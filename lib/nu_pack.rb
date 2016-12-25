require 'nu_pack/material_markup_calculator'

module NuPack
  class Calculator
    def initialize(price:, material:, people: 1,
                   material_markup_calculator: MaterialMarkupCalculator.new)
      @price  = price.abs   # Price should be positive
      @people = people.abs # People should be positive

      @material = material
      @material_markup_calculator = material_markup_calculator
    end

    def estimate
      flat_marked = @price * (1 + 0.05)
      (flat_marked * (1 + @people * 0.012 + material_markup)).round(2)
    end

    private

    def material_markup
      @material_markup_calculator.markup_for(@material)
    end
  end
end
