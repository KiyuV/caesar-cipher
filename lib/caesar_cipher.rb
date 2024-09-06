# frozen_string_literal: true

module CaesarCipher
  module_function

  def caesar_cipher(string, num)
    cipher = string.split('').map do |char|
      # solves the case where the shift is larger than 26
      shift = num % 26
      char_value = char.ord
      shifted_char_value = char_value + shift
      # Checks if current char is a letter
      if char_value >= 97 && char_value <= 122 || char_value >= 65 && char_value <= 90

        capital = char_value >= 65 && char_value <= 90 ? true : false
        # converting the capital's ordinate number to the matching lower case
        if capital
          char_value = char.downcase.ord
          shifted_char_value = char_value + num
        end

                 # wrap from a
        letter = if shifted_char_value > 122
                   (shifted_char_value - 122 + 96).chr
                 # wrap from z
                 elsif shifted_char_value < 97
                   (123 - (97 - shifted_char_value)).chr
                 # within normal range
                 else
                   shifted_char_value.chr
                 end
        capital ? letter.upcase : letter
      # don't shift on special characters
      else
        char_value.chr
      end
    end
    p cipher.join
  end
end

puts 'Please enter your message to be ciphered'
input_string = gets.chomp
puts 'Please enter a shift factor'
input_shift = gets.chomp.to_i

CaesarCipher.caesar_cipher(input_string, input_shift)
