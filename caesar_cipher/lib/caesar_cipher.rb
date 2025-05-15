def caesar_cipher(string, shift_factor)
  cipher = string.chars.map do |char|
    if char.ord.between?(65, 90)
      shifted_char = ((char.ord - 65 + shift_factor) % 26) + 65
      shifted_char.chr
    elsif char.ord.between?(97, 122)
      shifted_char = ((char.ord - 97 + shift_factor) % 26) + 97
      shifted_char.chr
    else
      char
    end
  end
  cipher = cipher.join
end