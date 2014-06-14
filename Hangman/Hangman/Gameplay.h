//
//  Gameplay.h
//  Hangman
//
//  Created by Boris van Linschoten on 10-06-14.
//  Copyright (c) 2014 bjvanlinschoten. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Gameplay : NSObject

@property (copy, nonatomic, readwrite) NSString *hangmanWord;
@property (copy, nonatomic, readwrite) NSString *correctWord;
@property (copy, nonatomic, readwrite) NSString *guessedLetters;
@property (assign, nonatomic, readwrite) int lives;
@property (assign, nonatomic, readwrite) int lengthOfWord;
@property (assign, nonatomic, readwrite) int mistakes;

-(BOOL)checkLetter:(NSString *) letter;
-(BOOL)isGameWon;
-(void)setUpGame:(NSString *) correctWord;
-(BOOL)isGameEnd;


@end
