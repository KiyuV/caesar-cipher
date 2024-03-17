def caesar_cipher(string, num)
  split_string = string.split("")
  cipher = split_string.map do |char|
    char_value = char.ord
    shifted_char_value = char_value + num
    # Checks if current char is capitialized
    if char_value >= 65 && char_value <= 90
      # wrap from A
      if shifted_char_value > 90
        (shifted_char_value - 90 + 64).chr
      # wrap from Z
      elsif shifted_char_value < 65
        (91 - (65 - shifted_char_value)).chr
      # within normal range
      else
        shifted_char_value.chr
      end
    elsif char_value >= 97 && char_value <= 122
      # wrap from a
      if shifted_char_value > 122
        (shifted_char_value - 122 + 96).chr
      # wrap from z
      elsif shifted_char_value < 97
        (123 - (97 - shifted_char_value)).chr
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