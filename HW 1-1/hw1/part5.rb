class Class
  def attr_accessor_with_history(attr_name)
    attr_name = attr_name.to_s   # make sure it's a string
    attr_reader attr_name        # create the attribute's getter
    attr_reader attr_name+"_history" # create bar_history getter
    class_eval %Q"
    	def #{attr_name}=(attr_value)

    		puts 'New value: ' + attr_value.to_s

    		if !defined? @#{attr_name}_history 
    			puts 'Created....'
    			@#{attr_name}_history = [@#{attr_name}]
    		end

    		@#{attr_name}_history.push attr_value
    		@#{attr_name} = attr_value
    	end
    	"
  end
end

class Foo
    attr_accessor_with_history :bar
end

f = Foo.new
f.bar = 1
puts "Value: " + f.bar.to_s
f.bar = 2
puts "Value: " + f.bar.to_s
puts f.bar_history.to_s # => if your code works, should be [nil, 1, 2]

f = Foo.new
f.bar = 1
f.bar = 2
f = Foo.new
f.bar = 4
puts f.bar_history.to_s