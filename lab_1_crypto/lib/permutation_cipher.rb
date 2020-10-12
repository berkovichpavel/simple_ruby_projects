# frozen_string_literal: true

module PermutationCipher
  def permutation_encrypt(message, alphabet, key)
    permutation(message, alphabet, key)
  rescue ArgumentError => e
    puts "ERROR: #{e.message}."
  end

  def permutation_decrypt(message, alphabet, key)
    permutation(message, alphabet, key, :decrypt)
  rescue ArgumentError => e
    puts "ERROR: #{e.message}."
  end

  private

  def inspection_permutation(message, alphabet, key)
    raise ArgumentError, 'Invalid alphabet' if alphabet.split('').uniq != alphabet.split('')
    if key.split('').uniq != key.split('')
      raise ArgumentError, 'Each symbol of the key should be presented in the alphabet only once!'
    end
    raise ArgumentError, 'Invalid key length!' if key.size > alphabet.size
    raise ArgumentError, 'Key symbols are not presented in the alphabet!' if (key.split('') - alphabet.split('')) != []
    raise ArgumentError, 'Invalid message!' if (message.split('') - alphabet.split('')) != []
    raise ArgumentError, 'Invalid message length!' unless (message.size % key.size).zero?
  end

  def permutation(message, alphabet, key, flag = :encrypt)
    inspection_permutation(message, alphabet, key)
    k = new_key(key, alphabet)
    message = message.split('').each_slice(k.size).map { |s| s }
    answer = []
    message.map do |part|
      temp = Array.new(k.size - 1)
      k.each_with_index do |item, index|
        temp[index] = part[item] if flag == :decrypt
        temp[item] = part[index] if flag == :encrypt
      end
      answer << temp
    end
    answer.join
  end

  def new_key(key, alphabet)
    k = key.split('').map { |k| alphabet.index(k) }
    k_temp = Array.new(k)
    k.size.times do |i|
      k[k.index(k_temp.min)] = i
      k_temp[k_temp.index(k_temp.min)] = 10**9
    end
    k
  end
end
