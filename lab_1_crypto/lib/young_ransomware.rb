# frozen_string_literal: true

require_relative 'cesar_cipher'
require_relative 'affine_cipher'
require_relative 'simple_substitution_cipher'
require_relative 'hill_cipher'
require_relative 'permutation_cipher'
require_relative 'vigenere_cipher'

class YoungRansomware
  include AffineCipher
  include CesarCipher
  include SimpleSubstitutionCipher
  include HillCipher
  include PermutationCipher
  include VigenereCipher

  CURRENT_PATH = File.dirname(__FILE__)
  CIPHERS = %i[affine cesar hill permutation simple_substitution vigenere].freeze
  ACTS = %i[encrypt decrypt].freeze

  attr_reader :my_alphabet, :my_key, :my_message
  #
  def initialize
    @my_alphabet, @my_key, @my_message = read_from_file
  end
  #
  def work
    ransomware_choice = choice
    answer = send(ransomware_choice[0], my_message, my_alphabet, my_key)
    unless answer.nil?
      puts 'Encryption was successful!' if ransomware_choice[1] == 'encrypt'
      puts 'Decryption was successful!' if ransomware_choice[1] == 'decrypt'
      write_to_file(answer, ransomware_choice[1])
    end
  end

  private

  attr_writer :my_alphabet, :my_key, :my_message

  def choice
    new_params
    cipher = choice_method
    act = choice_act
    [(CIPHERS[cipher - 1].to_s + '_' + ACTS[act - 1].to_s).to_sym, ACTS[act - 1].to_s]
  end

  def choice_method
    cipher = 0
    loop do
      puts 'Choose method:'
      CIPHERS.each.with_index(1) { |item, index| puts "#{index}. #{item} "}
      cipher = STDIN.gets.chomp.to_i
      break unless cipher > CIPHERS.size
    end
    cipher
  end

  def choice_act
    act = 0
    loop do
      puts 'Choose act:'
      ACTS.each.with_index(1) { |item, index| puts "#{index}. #{item} "}
      act = STDIN.gets.chomp.to_i
      break unless act > ACTS.size
    end
    act
  end

  def new_params
    print 'Do you want to enter your alphabet(0/1)? '
    STDIN.gets.chomp.to_i.zero? ? my_alphabet : new_my_alphabet
    print 'Do you want to enter your message(0/1)? '
    STDIN.gets.chomp.to_i.zero? ? my_message : new_my_message
    print 'Do you want to enter your key(0/1)? '
    STDIN.gets.chomp.to_i.zero? ? my_key : new_my_key
    puts "Alphabet: #{my_alphabet}."
    puts "Message: #{my_message}."
    puts "Key: #{my_key}."
  end

  def new_my_alphabet
    print 'Enter your alphabet: '
    self.my_alphabet = STDIN.gets.chomp
  end

  def new_my_key
    print 'Enter your key: '
    self.my_key = STDIN.gets.chomp
  end

  def new_my_message
    print 'Enter your message: '
    self.my_message = STDIN.gets.chomp
  end

  def write_to_file(answer, ransomware_choice)
    File.open(CURRENT_PATH[0..-4] + "data/#{ransomware_choice}.txt", 'w') do |file|
      file.puts answer
    end
  end

  def read_from_file
    alphabet = File.open(CURRENT_PATH[0..-4] + '/data/alphabet.txt', &:read).chomp
    key = File.open(CURRENT_PATH[0..-4] + '/data/key.txt', &:read).chomp
    message = File.open(CURRENT_PATH[0..-4] + '/data/in.txt', &:read).chomp
    [alphabet, key, message]
  end
end
