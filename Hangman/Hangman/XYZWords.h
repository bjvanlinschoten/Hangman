//
//  XYZWords.h
//  Hangman
//
//  Created by Boris van Linschoten on 12-06-14.
//  Copyright (c) 2014 bjvanlinschoten. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface XYZWords : NSObject

@property (strong, nonatomic) NSMutableArray *words;

-(NSString *)getWord;

@end
