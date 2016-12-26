module NuPack
  class PeopleMarkupCalculator
    MARKUP = 0.012

    def initialize(people)
      @people = people.abs
    end

    def markup
      MARKUP * @people
    end
  end
end
