//
//  Gameplay.h
//  Hangman
//
//  Created by Boris van Linschoten on 10-06-14.
//  Copyright (c) 2014 bjvanlinschoten. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <sqlite3.h>

@interface Gameplay : NSObject {
    sqlite3 *word_db;
}


@property (copy, nonatomic, readwrite) NSString *hangmanWord;
@property (copy, nonatomic, readwrite) NSString *correctWord;
@property (copy, nonatomic, readwrite) NSString *guessedLetters;
@property (assign, nonatomic, readwrite) int lives;
@property (assign, nonatomic, readwrite) int lengthOfWord;
@property (assign, nonatomic, readwrite) int mistakes;

-(BOOL)checkLetter:(NSString *) letter;
-(BOOL)isGameWon:(NSString *) currentWord;
-(void)setUpWord:(NSString *) correctWord;


@end
