module SubstitutionCipher
  module Caeser
    # Encrypts document using key
    # Arguments:
    #   document: String
    #   key: Fixnum (integer)
    # Returns: String
    def self.encrypt(document, key)
      # TODO: encrypt string using caeser cipher
      cipher_text = document.to_s.chars.map do |char|
        char.ord + key < 95 ? (char.ord + key).chr : (char.ord + key - 95).chr
      end.join

      cipher_text
    end

    # Decrypts String document using integer key
    # Arguments:
    #   document: String
    #   key: Fixnum (integer)
    # Returns: String
    def self.decrypt(document, key)
      # TODO: decrypt string using caeser cipher
      plaint_text = document.to_s.chars.map do |char|
        char.ord - key >= 32 ? (char.ord - key).chr : (95 + char.ord - key).chr
      end.join

      plaint_text
    end
  end

  module Permutation
    # Encrypts document using key
    # Arguments:
    #   document: String
    #   key: Fixnum (integer)
    # Returns: String
    def self.encrypt(document, key)
      # TODO: encrypt string using caeser cipher
      origin = (0..127).to_a
      cipher = (0..127).to_a.shuffle(random: Random.new(key))
      result_en = document.to_s.chars.map do |char|
        cipher[char.ord].chr
      end.join

      result_en
    end

    # Decrypts String document using integer key
    # Arguments:
    #   document: String
    #   key: Fixnum (integer)
    # Returns: String
    def self.decrypt(document, key)
      # TODO: decrypt string using caeser cipher
      origin = (0..127).to_a
      cipher = (0..127).to_a.shuffle(random: Random.new(key))
      result_de = document.to_s.chars.map do |char|
        origin[cipher.index(char.ord)].chr
      end.join

      result_de
    end
  end
end
