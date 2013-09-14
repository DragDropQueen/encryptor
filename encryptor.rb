class Encryptor
  def cipher(rotation)
    characters = (' '..'z').to_a
    rotated_characters = characters.rotate(rotation)
    Hash[characters.zip(rotated_characters)]
  end

  def encrypt_letter(letter,rotation)
    cipher_for_rotation = cipher(rotation)
    cipher_for_rotation[letter]
  end

  def encrypt(string, rotation)
    letters = string.split("")
    encrypted = letters.collect do |letter|
      encrypt_letter(letter,rotation)
    end
    encrypted.join
  end

  def decrypt_letter(letter, rotation)
    cipher_for_rotation = cipher(rotation).invert
    cipher_for_rotation[letter]
  end

  def decrypt(string, rotation)
    letters = string.split("")
    decrypted = letters.collect do |letter|
      decrypt_letter(letter,rotation)
    end
    decrypted.join
  end

  def encrypt_file(filename, rotation)
    source_file = File.open("sample.txt", "rw")
    puts source_file.read
  end
end
encrypt_file(secret.txt, 13)

# Create the file handle to the encrypted file
# Read the encrypted text
# Decrypt the text by passing in the text and rotation
# Create a name for the decrypted file
# Create an output file handle
# Write out the text
# Close the file

