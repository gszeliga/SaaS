class CartesianProduct
  include Enumerable

  def initialize(sequence_a, sequence_b)
    @sequence_a = sequence_a
    @sequence_b = sequence_b
  end

  def each

    @sequence_a.each {|item_a|
      @sequence_b.each{ |item_b|
        yield [item_a,item_b]
      }
    }

  end

end

c = CartesianProduct.new([:a,:b], [4,5])
c.each { |elt| puts elt.inspect }

c = CartesianProduct.new([:a,:b], [])
c.each { |elt| puts elt.inspect }