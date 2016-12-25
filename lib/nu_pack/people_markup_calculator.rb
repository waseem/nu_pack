module NuPack
  class PeopleMarkupCalculator
    MARKUP = 0.012

    def markup_for(people)
      MARKUP * people
    end
  end
end
