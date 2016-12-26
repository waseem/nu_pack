require 'nu_pack/material_markup_calculator'
require 'nu_pack/people_markup_calculator'

module NuPack
  class Calculator
    def initialize(price:, material:, people: 1, flat_markup: 0.05,
                   material_markup_calculator: nil,
                   people_markup_calculator: nil)
      @price  = price.abs   # Price should be positive
      @flat_markup = flat_markup

      @pmc = people_markup_calculator   || PeopleMarkupCalculator.new(people.abs)

      @mmc = material_markup_calculator || MaterialMarkupCalculator.new(material)
    end

    def estimate
      (flat_marked * (1 + people_markup + material_markup)).round(2)
    end

    private

    def people_markup
      @pmc.markup
    end

    def flat_marked
      @price * (1 + @flat_markup)
    end

    def material_markup
      @mmc.markup
    end
  end
end
