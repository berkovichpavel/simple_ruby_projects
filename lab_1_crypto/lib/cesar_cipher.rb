# frozen_string_literal: true

module CesarCipher
  def cesar_encrypt(message, alphabet, key)
    inspection_cesar(message, alphabet, key)
    cesar(message, alphabet, step(alphabet, key))
  rescue ArgumentError => e
    puts "ERROR: #{e.message}."
  end

  def cesar_decrypt(message, alphabet, key)
    inspection_cesar(message, alphabet, key)
    cesar(message, alphabet, -step(alphabet, key))
  rescue ArgumentError => e
    puts "ERROR: #{e.message}"
  end

  private

  def cesar(message, alphabet, step)
    message.split('').map { |letter| alphabet[(alphabet.index(letter) + step) % alphabet.size] }.join
  end

  def inspection_cesar(message, alphabet, key)
    raise ArgumentError, 'Invalid alphabet' if alphabet.split('').uniq != alphabet.split('')
    raise ArgumentError, 'Key symbol is not presented in the alphabet!' if alphabet.index(key).nil?
    raise ArgumentError, 'Invalid key length!' if key.size != 1
    raise ArgumentError, 'Invalid message!' if (message.split('') - alphabet.split('')) != []
  end

  def step(alphabet, key)
    alphabet.index(key)
  end
end
