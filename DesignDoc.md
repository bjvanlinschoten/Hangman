{\rtf1\ansi\ansicpg1252\cocoartf1265\cocoasubrtf190
{\fonttbl\f0\fswiss\fcharset0 Helvetica;}
{\colortbl;\red255\green255\blue255;}
\paperw11900\paperh16840\margl1440\margr1440\vieww26580\viewh9600\viewkind0
\pard\tx566\tx1133\tx1700\tx2267\tx2834\tx3401\tx3968\tx4535\tx5102\tx5669\tx6236\tx6803\pardirnatural

\f0\fs24 \cf0 Database:\
\
Words array read in from words.plist, sorted on the length of the words\
\
Classes and their Methods:\
\
	Gameplay\
		- newGame\
			Starts a new game\
		- getNewWord\
			Gets a random word from the Words array with length (int) lengthOfWord\
		- initAlphabet\
			Initializes a new alphabet\
		- initLives\
			Initializes the label that keeps track of amount of lives left, with starting value (int) numberOfLives\
		- checkLetter\
				First checks if letter is already guessed or not. If not, checks if guessed letter is in the word. \
				If it is:\
					Updates the alphabet\
					Updates the hangman word to show the guessed letter\
				If it is not:\
					Subtracts one life\
					Updates the alphabet\
					Updates string with wrong letters\
		- gameWon\
			Checks if the game is won, when all letters are guessed\
		- gameLost\
			Checks if the game is lost, when no more lives remain\
		- endGame\
			Ends the game and goes to the Highscores view\
					\
	Settings\
		- setLengthOfWord\
			sets the length of the word to be guessed\
		- setNumberOfLives\
			sets the amount of lives\
\
	High scores\
		- updateHighscores\
			updates the highscores with current game result\
}