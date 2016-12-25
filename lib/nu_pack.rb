require 'nu_pack/material_markup_calculator'
require 'nu_pack/people_markup_calculator'

module NuPack
  class Calculator
    def initialize(price:, material:, people: 1, flat_markup: 0.05,
                   material_markup_calculator: MaterialMarkupCalculator.new,
                   people_markup_calculator: PeopleMarkupCalculator.new)
      @price  = price.abs   # Price should be positive
      @flat_markup = flat_markup

      @people = people.abs # People should be positive
      @people_markup_calculator = people_markup_calculator

      @material = material
      @material_markup_calculator = material_markup_calculator
    end

    def estimate
      (flat_marked * (1 + people_markup + material_markup)).round(2)
    end

    private

    def people_markup
      @people_markup_calculator.markup_for(@people)
    end

    def flat_marked
      @price * (1 + @flat_markup)
    end

    def material_markup
      @material_markup_calculator.markup_for(@material)
    end
  end
end
