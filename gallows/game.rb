require_relative 'lib/gallows.rb'
require_relative 'lib/result_printer.rb'
require_relative 'lib/word_reader.rb'

current_path = File.dirname(__FILE__)

printer = ResultPrinter.new

reader = WordReader.new

word = reader.read_from_file(current_path + "/data/words.txt")

game = Gallows.new(word)


while game.status == 0 do
  printer.print_status(game)
  game.ask_next_letter
end

printer.print_status(game)