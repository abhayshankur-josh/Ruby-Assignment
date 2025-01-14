require 'io/console'

# get_hangman_words function is used to create a collection of words with associated hint.
def get_hangman_words
  {
    animal: ["Dog", "Cat", "Lion", "Ant", "Bear"],
    fruit: ["Apple", "Kiwi", "Lime", "Plum", "Pear"],
    color: ["Red", "Blue", "Green", "Pink", "Gray"],
    flower: ["Rose", "Lily", "Iris", "Pansy"],
    vehicle: ["Car", "Bike", "Taxi", "Tram"],
    planet: ["Mars", "Earth", "Venus"],
    bird: ["Owl", "Swan", "Finch", "Robin"],
    sport: ["Golf", "Polo", "Ski"],
    tree: ["Oak", "Pine", "Birch"],
    city: ["Rome", "Pune", "Oslo"],
    food: ["Cake", "Taco", "Soup", "Rice"],
    drink: ["Milk", "Soda", "Tea"],
    body_part: ["Arm", "Leg", "Hand", "Foot"],
    country: ["Peru", "India", "China", "Italy"],
    ocean: ["Arctic", "Indian"]
  }
end

# get_input_char function is created to accept only single-character letter (non-digit, non-special character)
# It by default uses word with empty blank char
def get_input_char(word=" ")
  loop do 
    begin
      print "Guess the word #{word}:"
      char = STDIN.getch
      puts char.downcase
      raise if not char.downcase.match?(/^[a-z]$/)
      return char.downcase
    rescue
      puts 
      retry
    end
  end
end

# start_game is the entry point for the game and has the Game Logic and operations and calculation.
def start_game
  chance = 5

  #getting hangman words from function.
  hangman_words = get_hangman_words

  # Getting a Random hint(key) & word(value).
  sample_hint = hangman_words.keys.sample
  sample_word = hangman_words[sample_hint].sample
  sample_word = sample_word.downcase.split('')
  actual_word = sample_word.clone

  guess_word = Array.new(sample_word.length,"_")
  track_letters = Array.new()

  while chance>0
    puts "\n 
    (-------------------------------)
    (  Chance left :#{chance}       
    (  Your Hint is #{sample_hint}  
    (-------------------------------)
    "    
    char = get_input_char(guess_word)
    
    if track_letters.include?(char)
      puts "You have already entered letter : #{char}"
    elsif sample_word.include?(char)
      # Replacing character at each occurence.
      loop do
        index = sample_word.find_index(char)
        guess_word[index] = sample_word[index]
        sample_word[index] = "_"
        break if not sample_word.include?(char)
      end
      puts "You guessed correct letter :#{char}"
    else
      chance-=1 
    end

    # Keeping a track of letters entered.
    track_letters<<char if not track_letters.include?(char)
    
    #Checking whether Guessed word is equal to Actucal word.
    if guess_word == actual_word
      puts "\n
      ---------------------------------------------------------------------
      *    Hurrah !!!! You guessed it : #{guess_word.join.capitalize}     
      ---------------------------------------------------------------------
      "
      return
    end
  end
  puts "\n
      ---------------------------------------------------
      *         You are out of your chance :( !!!       
      *         Word is #{actual_word.join.capitalize}  
      ---------------------------------------------------
  "
end

def main

  puts "
      -----------------------------------
      *                                 *
      *     Welcome to Hangman Game!    *
      *                                 *
      -----------------------------------
  "
  start_game

end

main()
