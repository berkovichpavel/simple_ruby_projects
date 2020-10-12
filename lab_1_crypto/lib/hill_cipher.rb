# frozen_string_literal: true

module HillCipher
  def hill_encrypt(message, alphabet, key)
    message += alphabet[0] unless (message.size % 2).zero?
    hill(message, alphabet, key)
  rescue ArgumentError => e
    puts "ERROR: #{e.message}."
  end

  def hill_decrypt(message, alphabet, key)
    hill(message, alphabet, key, :decrypt)
  rescue ArgumentError => e
    puts "ERROR: #{e.message}."
  end

  private

  def hill(message, alphabet, key, flag = :encrypt)
    inspection_hill(message, alphabet, key)
    k = key.split('').each_slice(2).map { |s| s.map { |b| alphabet.index(b) } }
    if flag == :decrypt
      det = det_(k, alphabet.size)
      k = number_matrix(det, matrix_(k), alphabet.size)
    end
    message_vector = message.split('').each_slice(2).map { |s| s.map { |b| alphabet.index(b) } }
    answer_vector = message_vector.map { |vector| vector_matrix_calculate(vector, k, alphabet.size) }
    answer_vector.map { |vec| vec.map { |item| alphabet[item] } }.join
  end

  def inspection_hill(message, alphabet, key)
    k = key.split('').each_slice(2).map { |s| s.map { |b| alphabet.index(b) } }
    raise ArgumentError, 'Invalid alphabet' if alphabet.split('').uniq != alphabet.split('')
    raise ArgumentError, 'Invalid key length!' if key.size != 4
    raise ArgumentError, 'Key symbols are not presented in the alphabet!' if (key.split('') - alphabet.split('')) != []
    raise ArgumentError, 'Invalid message!' if (message.split('') - alphabet.split('')) != []
    if extended_euclid(det(k, alphabet.size), alphabet.size)[0] != 1
      raise ArgumentError, 'det(key) and m are not mutually simple!'
    end
    raise ArgumentError, 'Invalid message length!' unless (message.size % 2).zero?
  end

  def det(mas, m)
    (mas[0][0] * mas[1][1] - mas[0][1] * mas[1][0]) % m
  end

  def det_(mas, m)
    extended_euclid(det(mas, m), m)[1] % m
  end

  def vector_matrix_calculate(vec, matrix, m)
    new_vector = []
    new_vector << (vec[0] * matrix[0][0] + vec[1] * matrix[1][0]) % m
    new_vector << (vec[0] * matrix[0][1] + vec[1] * matrix[1][1]) % m
    new_vector
  end

  def matrix_(matrix)
    new_matrix = []
    str_1 = []
    str_2 = []
    str_1 <<  matrix[1][1] << -matrix[0][1]
    str_2 << -matrix[1][0] << matrix[0][0]
    new_matrix << str_1 << str_2
    new_matrix
  end

  def number_matrix(num, matrix, m)
    matrix.map do |row|
      row.map do |item|
        item = (item * num) % m
      end
    end
  end
end
