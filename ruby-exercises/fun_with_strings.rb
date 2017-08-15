def palindrome?(string)
  modified_string = string.gsub(/\W/, "").downcase
  modified_string == modified_string.reverse
end

def count_words(string)
  repeated_words = string.downcase.gsub(/\W/, " ").split
  unique_words = repeated_words.uniq
  Hash[unique_words.map { |word| [word, repeated_words.count(word)] }]
end
