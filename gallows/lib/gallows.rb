class Gallows

	def get_letters(word)
		if word == nil || word == ""
			abort "You have not entered a word for the game!"
		end

		word.split("")
	end

	def initialize(word)
		@letters = get_letters(word.downcase)
		@errors = 0

		@bad_letters = []
		@good_letters = []

		@status = 0
	end

	def ask_next_letter
		puts "\nEnter the next letter"
		letter = ""

		while letter == "" do
			letter = STDIN.gets.encode('UTF-8').chomp
		end
		next_step(letter)
	end

	def next_step(letter)
		if @status == -1 || @status == 1
			return
		end

		if @good_letters.include?(letter) || @bad_letters.include?(letter)
			return 
		end

		if @letters.include?(letter)

			@good_letters << letter

			if (@letters - @good_letters).empty?
				@status = 1
			end

		else
			@bad_letters << letter
			@errors += 1

			if @errors >= 7
				@status = -1
			end
		end
	end

	def letters
		@letters
	end

	def good_letters
		@good_letters
	end

	def bad_letters
		@bad_letters
	end

	def errors
		@errors
	end

	def status
		@status
	end

end
