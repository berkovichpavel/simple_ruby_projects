# frozen_string_literal: true

module SimpleSubstitutionCipher
  def simple_substitution_encrypt(message, alphabet, key)
    inspection_simple_substitution(message, alphabet, key)
    simple_substitution(message, alphabet, key)
  rescue ArgumentError => e
    puts "ERROR: #{e.message}."
  end

  def simple_substitution_decrypt(message, alphabet, key)
    inspection_simple_substitution(message, alphabet, key)
    simple_substitution(message, key, alphabet)
  rescue ArgumentError => e
    puts "ERROR: #{e.message}."
  end

  private

  def simple_substitution(message, alphabet, key)
    message.split('').map { |letter| key[alphabet.index(letter)] }.join
  end

  def inspection_simple_substitution(message, alphabet, key)
    raise ArgumentError, 'Key symbols are not presented in the alphabet!' if (key.split('') - alphabet.split('')) != []
    if key.split('').uniq != key.split('')
      raise ArgumentError, 'Each symbol of the key should be presented in the alphabet only once!'
    end
    raise ArgumentError, 'Invalid key length!' if key.size != alphabet.size
    raise ArgumentError, 'Invalid message!' if (message.split('') - alphabet.split('')) != []
  end
end
