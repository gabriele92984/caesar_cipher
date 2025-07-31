# frozen_string_literal: true

def user_text
  puts 'Please write your text:'
  input = gets.chomp

  # Keep asking until a non-empty string is provided
  while input.empty?
    puts 'Error: Text cannot be empty. Please try again:'
    input = gets.chomp
  end

  input
end

def user_shift
  puts 'Now enter the shift value:'
  input = gets.chomp

  # Keep asking until a valid integer is provided
  until valid_integer?(input)
    puts 'Error: Shift must be an integer. Please try again:'
    input = gets.chomp
  end

  input.to_i
end

def valid_integer?(input)
  # Check if input is a valid integer (positive or negative)
  input.match?(/^-?\d+$/)
end

def encode_character(character, shift)
  unicode_value = character.ord + shift

  if unicode_value < 32
    unicode_value = 126 - (32 - unicode_value - 1)
  elsif unicode_value > 126
    unicode_value = 32 + (unicode_value - 127)
  end

  unicode_value.chr
end

def caesar_cipher(text, shift)
  text.chars.map { |c| encode_character(c, shift) }.join
end

def main
  text_value = user_text
  shift_value = user_shift
  puts "Encoded text: #{caesar_cipher(text_value, shift_value)}"
end

# Only run main if executed directly (not when required by RSpec)
main if __FILE__ == $0
