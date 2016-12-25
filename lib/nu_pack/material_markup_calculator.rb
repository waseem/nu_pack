module NuPack
  class MaterialMarkupCalculator
    def initialize(material)
      @material = material
    end

    def markup
      case @material
      when 'food'        then 0.13
      when 'electronics' then 0.02
      when 'drugs'       then 0.075
      else
        0
      end
    end
  end
end
