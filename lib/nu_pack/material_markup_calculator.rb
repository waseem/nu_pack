module NuPack
  class MaterialMarkupCalculator

    MARKUPS = {
      'food'        => 0.13,
      'electronics' => 0.02,
      'drugs'       => 0.075
    }

    def initialize(material)
      @material = material
    end

    def markup
      MARKUPS[@material] || 0
    end
  end
end
