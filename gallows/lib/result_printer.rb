class ResultPrinter

  def initialize
    @status_image = []

    current_path = File.dirname(__FILE__)
    counter = 0

    while counter <= 7 do
      file_name = current_path[0..-4] + "image/#{counter}.txt"
      if File.exist?(file_name)
        f = File.new(file_name, "r:UTF-8")
        @status_image << f.read
        f.close
      else
        @status_image << "\n[ Image not found! ]\n"
      end

      counter += 1
    end
  end

  def clear_screen
    Gem.win_platform? ? (system "cls") : (system "clear")
  end

  def plural_or_singular_determinant (number, single, plural)
    if number == nil || !number.is_a?(Numeric)
      number = 0
    end

    if number == 1 || number == 0
      return single
    end
    plural
  end


  def print_status(game)
    clear_screen
    puts "Game version 3.0"
    puts "\nWord: " + get_word_for_print(game.letters, game.good_letters)

    puts "#{plural_or_singular_determinant(game.errors,'Mistake', 'Mistakes' )} (#{game.errors}): #{game.bad_letters.join(", ")}"

    print_gallows(game.errors)

    if game.errors >= 7
      puts "You lost :("
      puts 'The hidden word was: ' + game.letters.join('')
      puts
    else
      if game.status == 1
        puts "Congratulations! You won!\n\n "
      else
        puts "You have left " + (7 - game.errors).to_s + " " + plural_or_singular_determinant((7 - game.errors), "attempt", "attempts") + "!"
      end
    end
  end

  def get_word_for_print(letters, good_letters)
    result = ""

    letters.each do |letter|
      if good_letters.include? letter
        result += letter + " "
      else
        result += "__ "
      end
    end
    result
  end

  def print_gallows(errors)
    puts @status_image[errors]
  end
end