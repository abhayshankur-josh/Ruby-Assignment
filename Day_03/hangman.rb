require 'io/console' 
require_relative 'hangman_words'

class Hangman 
    
    def initialize
        @level = 1
        @chances = 5 
        @hangman_words = HangmanWords::HANGMAN_WORDS
        @sample_hint, @sample_word = pick_random_word_and_hint 
        @actual_word = @sample_word.clone 
        @guess_word = Array.new(@sample_word.length, "_") 
        @track_letters = []
    end
 
    def self.game_title
        print"
            ------------------------------------
            * * * Welcome to Hangman Game! * * * 
            ------------------------------------
        " 
    end

    def start_game
        while @level<6 and play do 
            system("clear")
            print "\n
                ---------------------------------------------------------------
                *               Get ready to level up yourself!!
                ---------------------------------------------------------------
            "
            @chances=5
            @sample_hint, @sample_word = pick_random_word_and_hint 
            @actual_word = @sample_word.clone 
            @guess_word = Array.new(@sample_word.length, "_") 
            @track_letters = []
            sleep(3)
            system("clear")

            self.class.game_title

        end
    end

    private
    
    def pick_random_word_and_hint 
        sample_hint = @hangman_words[@level].keys.sample 
        sample_word = @hangman_words[@level][sample_hint].downcase.split('') 
        [sample_hint, sample_word] 
    end

    def get_input_char(word) 
        loop do 
            begin 
                print "Guess the word #{word.join.to_s}:" 
                char = STDIN.getch 
                print char.downcase 
                raise if not char.downcase.match?(/^[a-z]$/) 
                return char.downcase 
            rescue 
                print 
                retry 
            end 
        end 
    end

    def play
        while @chances > 0 
            print "\n
            (-------------------------------) 
            ( Level : #{@level}
            ( Chance left :#{@chances} 
            ( Your Hint is #{@sample_hint} 
            (-------------------------------) 
            " 
            char = get_input_char(@guess_word) 
            if @track_letters.include?(char) 
                print "\nYou have already entered letter : #{char}" 
            elsif @sample_word.include?(char) 
                # Replacing character at each occurrence. 
                loop do 
                    index = @sample_word.find_index(char) 
                    @guess_word[index] = @sample_word[index] 
                    @sample_word[index] = "_" 
                    break if not @sample_word.include?(char) 
                end 
                print "\nYou guessed correct letter :#{char}" 
            else 
                @chances -= 1 
            end 
            
            # Keeping track of letters entered. 
            @track_letters << char if not @track_letters.include?(char) 
            
            # Checking whether guessed word is equal to actual word. 
            if @guess_word == @actual_word 
                print "\n
                    --------------------------------------------------------------------- 
                    * Hurrah !!!! You guessed it : #{@guess_word.join.capitalize} 
                    --------------------------------------------------------------------- 
                    \n
                " 
                @level +=1
                return true
            end 
        end 
        
        print "\n 
        --------------------------------------------------- 
        *   You are out of your chance :( !!! * 
        *   Word is #{@actual_word.join.capitalize} 
        --------------------------------------------------- 
        " 
        false
    end

end

