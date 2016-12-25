class NuPack
  def initialize(price, people, material)
    @price = price.abs   # Price should be positive
    @people = people.abs # People should be positive
    @material = material
  end

  def estimate
    flat_marked = @price * (1 + 0.05)
    (flat_marked * (1 + @people * 0.012 + markup_by_material)).round(2)
  end

  private

  def markup_by_material
    case @material
    when 'food'        then 0.13
    when 'electronics' then 0.02
    when 'drugs'       then 0.075
    else
      0
    end
  end
end
