def caesar_cipher(string, num)
  cipher = string.split("").map do |char|
    char_value = char.ord
    shifted_char_value = char_value + num
    # Checks if current char is a letter
    if char_value >= 97 && char_value <= 122 || char_value >= 65 && char_value <= 90
  
      char_value >= 65 && char_value <= 90 ? capital = true : capital = false
      # converting the capital's ordinate number to the matching lower case
      if capital
        char_value = char.downcase.ord
        shifted_char_value = char_value + num
      end

      # wrap from a
      if shifted_char_value > 122
        letter = (shifted_char_value - 122 + 96).chr
        capital ? letter.upcase : letter
      # wrap from z
      elsif shifted_char_value < 97
        letter = (123 - (97 - shifted_char_value)).chr
        capital ? letter.upcase : letter
      # within normal range
      else
        shifted_char_value.chr
      end
    # don't shift on special characters
    else
      char_value.chr
    end
  end
  p cipher.join
end

puts "Please enter your message to be ciphered"
input_string = gets.chomp
puts "Please enter a shift factor"
input_shift = gets.chomp.to_i

caesar_cipher(input_string, input_shift)