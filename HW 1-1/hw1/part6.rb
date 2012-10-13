class Numeric
  @@currencies = {'yen' => 0.013, 'euro' => 1.292, 'rupee' => 0.019, 'dollar' => 1}
  def method_missing(method_id)
    singular_currency = method_id.to_s.gsub( /s$/, '')
    if @@currencies.has_key?(singular_currency)
      self * @@currencies[singular_currency]
    else
      super
    end
  end

  def in(currency)
    singular_currency = currency.to_s.gsub( /s$/, '')
    return self / @@currencies[singular_currency]
  end
end

class String
  
  def palindrome?
    treated_str = self.gsub(/[^\w]/,'')
    return treated_str.downcase == treated_str.downcase.reverse
  end  

end

module Enumerable
  def palindrome?
      # self.to_a.each_index { |index|
      #   return false unless self[index] == self[(self.length - 1) - index]
      # }
      # return true

      index = 0

      self.reverse_each { |item|
        return false unless self.to_a[index] == item
        index = index + 1
      }

      return true
  end
end


puts 5.dollars.in(:euros).to_s
puts 10.euros.in(:rupees).to_s
puts 2.rupee.in(:dollar).to_s
puts 5.rupees.in(:yen)

puts "A man, a plan, a canal -- Panama".palindrome?
puts [1,2,3,2,1].palindrome?
puts [1,2,3,2,2].palindrome?