def get_user_text
  puts 'Please write your text:'
  gets.chomp
end

def get_user_shift
  puts 'Now enter the shift value:'
  gets.chomp.to_i
end

user_text = get_user_text
shift_value = get_user_shift

def caesar_cipher(text, shift)

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

caesar_cipher(user_text, shift_value)

