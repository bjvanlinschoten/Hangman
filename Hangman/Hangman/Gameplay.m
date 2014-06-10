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

-(BOOL)checkLetter:(NSString *) letter {
    BOOL match = false;
    
    if ([self.guessedLetters rangeOfString:letter].location == NSNotFound) {
        self.lives--;
        [guessedLetters stringByAppendingString:letter];
        NSRange letterRange;
        char charToCheck = [letter characterAtIndex:0];
    
        for (int i=0; i < self.correctWord.length; i++) {
            char tempString = [self.correctWord characterAtIndex:i];
            if (charToCheck == tempString) {
                match = true;
                letterRange = NSMakeRange(i, 1);
                self.hangmanWord = [self.hangmanWord stringByReplacingCharactersInRange:letterRange withString:letter];
            };
        };
    };
    
    if (match == false) {
        return false;
    }
    else {
        return true;
    }
};


-(void)gameWon:(NSString *) hangmanWord {
    
};

-(void)gameLost:(NSString *) hangmanWord {
    
};

-(void)setUpWord:(NSString *) word {
    self.correctWord = word;
    self.guessedLetters = @"";
    self.hangmanWord = @"";
    for (int i = 0; i < self.correctWord.length ; i++) {
        self.hangmanWord = [self.hangmanWord stringByAppendingString:@"-"];
        };
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    self.lives = [defaults integerForKey:@"lives"];
    self.lengthOfWord = [defaults integerForKey:@"lengthOfWord"];
};



@end
