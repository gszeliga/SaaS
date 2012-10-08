def combine_anagrams(words)

  anagrams  = Hash.new

  words.each { |word|
    reference = word.downcase.split(//).sort.join

    if anagrams.key? reference
        anagrams[reference].push word
    else
        list = Array.new

        list.push word

        anagrams[reference] = list
    end

  }

  return anagrams.values

end

input =['Cars', 'for', 'potatoes', 'racs', 'four','scar', 'creams', 'scream']

puts combine_anagrams(input).to_s
