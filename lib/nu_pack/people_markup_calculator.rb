module NuPack
  class PeopleMarkupCalculator
    MARKUP = 0.012

    def initialize(people)
      @people = people
    end

    def markup
      MARKUP * @people
    end
  end
end
