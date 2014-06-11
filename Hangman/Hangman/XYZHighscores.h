//
//  XYZHighscores.h
//  Hangman
//
//  Created by Boris van Linschoten on 11-06-14.
//  Copyright (c) 2014 bjvanlinschoten. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface XYZHighscores : NSObject

-(void)updateHighscoresWithWord:(NSString *)word score:(int)score;
-(NSMutableArray *)getHighscores;
-(NSString *) getCorrectWord;

@end
