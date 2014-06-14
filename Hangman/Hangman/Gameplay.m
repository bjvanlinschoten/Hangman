//
//  Gameplay.m
//  Hangman
//
//  Created by Boris van Linschoten on 10-06-14.
//  Copyright (c) 2014 bjvanlinschoten. All rights reserved.
//

#import "Gameplay.h"

@implementation Gameplay

@synthesize correctWord;
@synthesize hangmanWord;
@synthesize guessedLetters;
@synthesize lives;
@synthesize lengthOfWord;
@synthesize mistakes;

// checks if letter is in correct word and updates the hangman word
-(BOOL)checkLetter:(NSString *)letter {
    
    BOOL match = false;
    
    // check if letter is already guessed
    if ([self.guessedLetters rangeOfString:letter].location == NSNotFound) {
        self.guessedLetters = [self.guessedLetters stringByAppendingString:letter];
    }
    
    NSRange letterRange;
    char charToCheck = [letter characterAtIndex:0];
    
    // iterate over all letters in correct word
    for (int i=0; i < self.correctWord.length; i++) {
        char tempString = [self.correctWord characterAtIndex:i];
        
        // if letter is in correct word, replace the '-' with that letter in hangmanword
        if (charToCheck == tempString) {
            match = true;
            letterRange = NSMakeRange(i, 1);
            self.hangmanWord = [self.hangmanWord stringByReplacingCharactersInRange:letterRange withString:letter];
        };
    };
    
    // if no match is found, subtract a life and add mistake
    if (match == false) {
        self.mistakes++;
        self.lives--;
        return false;
    }
    else {
        return true;
    }
};

// checks if the game is won
-(BOOL)isGameWon {
    for (int i = 0; i < [self.hangmanWord length]; i++) {
        char c = [self.hangmanWord characterAtIndex:i];
        if (c == '-') {
            return false;
        }
    }
    return true;
};

// checks if the game has ended, either if it is won or lost
-(BOOL)isGameEnd {
    if (self.lives == 0 || [self isGameWon]) {
        return true;
    }
    else {
        return false;
    }
}

// sets up a new game
-(void)setUpGame:(NSString *) word {
    self.correctWord = word;
    self.guessedLetters = @"-";
    self.hangmanWord = @"";
    self.mistakes = 0;
    for (int i = 0; i < self.correctWord.length ; i++) {
        self.hangmanWord = [self.hangmanWord stringByAppendingString:@"-"];
        };
   
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    self.lives = [defaults integerForKey:@"lives"];
    self.lengthOfWord = [defaults integerForKey:@"lengthOfWord"];
    [defaults setObject:self.correctWord forKey:@"correctWord"];
    [defaults synchronize];
};











@end
