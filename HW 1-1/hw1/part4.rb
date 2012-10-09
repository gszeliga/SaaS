class Dessert

  attr_accessor :calories, :name

  def initialize(name, calories)
    @calories = calories
    @name = name
  end
  
  def healthy?
    return @calories < 200    
  end
  
  def delicious?
    return true
  end
end

class JellyBean < Dessert

  attr_accessor :flavor

  def initialize(name, calories, flavor)
    super(name,calories)
    @flavor = flavor
  end
  
  def delicious?
    return true unless @flavor == 'black licorice'
  end
end
