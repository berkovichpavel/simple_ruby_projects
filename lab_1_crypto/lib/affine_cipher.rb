# frozen_string_literal: true

module AffineCipher
  def affine_encrypt(message, alphabet, key)
    inspection_affine(message, alphabet, key)
    k = key(key, alphabet)
    message.split('').map { |letter| alphabet[(alphabet.index(letter) * k[0] + k[1]) % alphabet.size] }.join
  rescue ArgumentError => e
    puts "ERROR: #{e.message}."
  end

  def affine_decrypt(message, alphabet, key)
    inspection_affine(message, alphabet, key)
    k = key(key, alphabet)
    a_ = extended_euclid(k[0].to_i, alphabet.size)[1]
    message.split('').map { |letter| alphabet[((alphabet.index(letter) - k[1]) * a_) % alphabet.size] }.join
  rescue ArgumentError => e
    puts "ERROR: #{e.message}."
  end

  private

  def inspection_affine(message, alphabet, key)
    raise ArgumentError, 'Invalid alphabet' if alphabet.split('').uniq != alphabet.split('')
    temp = key.split('')
    k = temp.map { |k| alphabet.index(k) }
    if alphabet.index(temp[0]).nil? || alphabet.index(temp[1]).nil?
      raise ArgumentError, 'Key symbols are not presented in the alphabet!'
    end
    raise ArgumentError, 'Invalid key length!' if key.size != 2
    raise ArgumentError, 'Invalid message!' if (message.split('') - alphabet.split('')) != []
    raise ArgumentError, 'a and m are not mutually simple!' if extended_euclid(k[0].to_i, alphabet.size)[0] != 1
  end

  def extended_euclid(a, b)
    return [a, 1, 0] if b.zero?

    d1, x1, y1 = extended_euclid(b, a % b)
    d = d1
    x = y1
    y = x1 - (a / b).floor * y1
    [d, x, y]
  end

  def key(key, alphabet)
    key.split('').map { |k| alphabet.index(k) }
  end
end
