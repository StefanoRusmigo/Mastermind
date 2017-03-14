class Game

  @@colors=["blue","red","white","black"]
def initialize
	@board = []
	@correct_guesses=Array.new(4,"empty") 
	@check=[]
	choose
end
def choose
	puts "Do you want to be a codemaker(cm) or a codebreaker(cb)"
	@choice = gets.downcase.strip
	pattern
end

def pattern
	if @choice == "cm"
   	  4.times do |i|
       @board[i] = @@colors.sample
      end

	elsif @choice == "cb"		
	  puts "Enter the code"
	  @board= gets.downcase.strip 
	  @board = @board.split(" ")
	end

   puts "Code has been generated\n"
  move
end

def move
	12.times do
	  guess = Array.new(4)
	  puts "\nGuess the code(ex. red white blue black)\n"

	  if @choice == "cm"
       guess = gets.downcase.strip 
	   guess = guess.split(" ")

	  elsif @choice == "cb"

	  	 guess.each_with_index do |x,index|
  	    	guess[index]= @correct_guesses[index]
  	    end

	    guess.each_with_index do |x,index|
	    	
   		if @check.size>0 && x=="empty"
   			puts "asdas"
   			guess[index] = @check.sample
   			puts @check
   			@check = @check-guess
   			puts @check
   			

   		elsif  x=="empty"
   			guess[index] = @@colors.sample
   		

   		end
  	    end


  	    puts guess.join(",")
  	  end

	if finish(guess) 
		puts "you won"
		break
	end
	check_move (guess)
  	end
end

def check_move (guess_array)
	remove=[]
		@board.each_with_index do |x,index|
		if @board != nil && @board[index]== guess_array[index] 
			puts "\nColor #{@board[index]} at position #{index +1} is correct"
			remove << @board[index]
			if @choice == "cb"
				@correct_guesses[index] = @board[index]

			end
		end
	end

	@check = (@board-remove) & guess_array
	puts "The colors #{@check.join(",")} appear in the code" 


end

def finish guess_array
	if @board == guess_array
		return true

	else return false
	end
end



end

game1=Game.new