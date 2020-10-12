# frozen_string_literal: true

module VigenereCipher
  def vigenere_encrypt(message, alphabet, key)
    vigenere(message, alphabet, key)
  rescue ArgumentError => e
    puts "ERROR: #{e.message}."
  end

  def vigenere_decrypt(message, alphabet, key)
    vigenere(message, alphabet, key, :decrypt)
  rescue ArgumentError => e
    puts "ERROR: #{e.message}."
  end

  private

  def inspection_vigenere(message, alphabet, key)
    raise ArgumentError, 'Invalid alphabet' if alphabet.split('').uniq != alphabet.split('')
    raise ArgumentError, 'Key symbols are not presented in the alphabet!' if (key.split('') - alphabet.split('')) != []
    raise ArgumentError, 'Invalid message!' if (message.split('') - alphabet.split('')) != []
  end

  def vigenere(message, alphabet, key, flag = :encrypt)
    inspection_vigenere(message, alphabet, key)
    k = key(key, alphabet)
    message = message.split('').map { |k| alphabet.index(k) }
    answer = []
    message.each_with_index do |item, index|
      answer << alphabet[(item + k[index % key.size]) % alphabet.size] if flag == :encrypt
      answer << alphabet[(item - k[index % key.size]) % alphabet.size] if flag == :decrypt
    end
    answer.join
  end

  def key(key, alphabet)
    key.split('').map { |k| alphabet.index(k) }
  end
end
