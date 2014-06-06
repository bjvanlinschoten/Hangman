####Database:

Words array read in from words.plist, sorted on the length of the words

####Classes and their Methods:

* Gameplay
	- newGame:
	 		Starts a new game
	- getNewWord:
			Gets a random word from the Words array with length (int) lengthOfWord
	- initAlphabet:
			Initializes a new alphabet
	- initLives:
			Initializes the label that keeps track of amount of lives left, with starting value (int) 					numberOfLives
	- checkLetter:
			First checks if letter is already guessed or not. If not, checks if guessed letter is in the word. 
		- If it is:
					Updates the alphabet and
					updates the hangman word to show the guessed letter
		- If it is not:
					Subtracts one life,
					updates the alphabet and
					updates string with wrong letters
	- gameWon:
			Checks if the game is won, when all letters are guessed
	- gameLost:
			Checks if the game is lost, when no more lives remain
	- endGame:
			Ends the game and goes to the Highscores view
					
* Settings
	- setLengthOfWord:
		sets the length of the word to be guessed
	- setNumberOfLives:
		sets the amount of lives

* High scores
	- updateHighscores:
		updates the highscores with current game result
