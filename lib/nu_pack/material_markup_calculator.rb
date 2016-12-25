module NuPack
  class MaterialMarkupCalculator

    MARKUPS = {
      'food'        => 0.13,
      'electronics' => 0.02,
      'drugs'       => 0.075
    }

    def markup_for(material)
      MARKUPS[material] || 0
    end
  end
end
