def caesar_cipher
  puts "Please write your text:"
  text = gets.chomp

  puts "Now enter the shift value:"
  shift = gets.chomp.to_i

  text_array = text.split("")

  encoded_array = text_array.map do |character|
    unicode_value = character.ord + shift

    if unicode_value < 32
      unicode_value = 126 - (32 - unicode_value - 1)
    elsif unicode_value > 126
      unicode_value = 32 + (unicode_value - 127)
    end
    unicode_value.chr
  end
  puts encoded_array.join
end

caesar_cipher()

