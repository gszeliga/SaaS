#For those just starting out, one suggested way to work on your code is to have a command window open and a text editor with this
#file loaded.  Make changes to this file and then run 'ruby part1.rb' at the command line, this will run your program.  Once you're
#satisfied with your work, save your file and upload it to the checker.


def palindrome?(str)
  treated_str = str.gsub(/[^\w]/,'')
  return treated_str.downcase == treated_str.downcase.reverse
end

def count_words(str)
  map = Hash.new(0)

  str.downcase.gsub(/\b[\w]+/) {|str| map[str] = map[str] + 1}

  return map
end