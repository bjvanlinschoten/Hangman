Hangman
=======
Making an iOS App for the Hangman Game

###Features
*   Upon launch, gameplay starts (unless the app was simply backgrounded, in which case gameplay, if in progress prior to backgrounding, resumes).

*   Placeholders for yet-unguessed letters that make clear the word’s length are shown.

*   Counter which displays how many incorrect guesses the player can still make before losing.

*    Alphabet with red letters for incorrectly guessed letters, green letters for correctly guessed letters and black letters for not-yet-guessed letters.

*    Input guesses via on-screen keyboard which only allows single alphabetical chars

*    Invalid input (e.g., multiple characters, no characters, characters already inputted, punctuation, etc.) are ignored and not penalized

*    New Game button

*   Give Up button

*    If the user guesses every letter in some word before running out of chances, he or she is congratulated, and gameplay ends (i.e., the game should ignore any subsequent keyboard input). If the user fails to guess every letter in some word before running out of chances, he or she is consoled, and gameplay ends. 

*    Two settings: the length of the word to be guessed and the maximum number of incorrect guesses allowed (1 to 26). These settings are controlled by sliders.

*    A history of at most 10 high scores that’s displayed anytime a game is won or lost. displaying for each the word guessed and the number of mistakes made. 


###Implementation
*   The given file words.plist is used for the universe of possible words

###Mockup
For mockups, see the doc directory in this repo



