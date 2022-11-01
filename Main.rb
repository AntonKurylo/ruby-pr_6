string = "In a village of La Mancha, the name of which I have no desire to call to
mind, there lived not long since one of those gentlemen that keep a lance
in the lance-rack, an old buckler, a lean hack, and a greyhound for
coursing. An olla of rather more beef than mutton, a salad on most
nights, scraps on Saturdays, lentils on Fridays, and a pigeon or so extra
on Sundays, made away with three-quarters of his income."
regexp = /[.,!?@#$%^&*:;|\\\/]/

new_string = string.downcase.delete("'").gsub(regexp, "\s").split(/\s+/)

words_hash = Hash.new

new_string.each do |s|
  if words_hash.key?(s)
    tmp_value = words_hash.dig(s)
    words_hash.store(s, tmp_value + 1)
  else
    words_hash.store(s, 1) #  words_hash.store(s, 1)
  end
end

words_array = words_hash.sort { |a, b| b[1] <=> a[1] }.first(3)

words_array.each do |el|
  puts "\"#{el[0]}\" = #{el[1]}"
end
