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

-(BOOL)checkLetter:(NSString *) letter;
-(void)gameWon:(NSString *) hangmanWord;
-(void)gameLost:(NSString *) hangmanWord;
-(void)setUpWord:(NSString *) correctWord;


@end
