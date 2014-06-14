//
//  XYZWords.m
//  Hangman
//
//  Created by Boris van Linschoten on 12-06-14.
//  Copyright (c) 2014 bjvanlinschoten. All rights reserved.
//

#import "XYZWords.h"

@implementation XYZWords


// get a random word from dictionary with length given by user
-(NSString *)getWord {
    
    // read in dictionary from plist file
    NSString *path = [[NSBundle mainBundle] pathForResource:@"wordsSortedOnLength"
                                                     ofType:@"plist"];
    self.words = [[NSMutableArray alloc] initWithContentsOfFile:path];
    NSMutableArray *possibleWords = [[NSMutableArray alloc] init];
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    
    int lengthOfWord = [[defaults objectForKey:@"lengthOfWord"] intValue];
    
    // get all words with the correct length
    for (int i = 0; i < [self.words count]; i++) {
        if ([self.words[i] length] == lengthOfWord) {
            [possibleWords addObject:self.words[i]];
        }
        else if ([self.words[i] length] > lengthOfWord) {
            break;
        }
    }
    
    // get random word from possible words array
    int index = arc4random() % [possibleWords count];
    return [possibleWords[index] lowercaseString];
}

@end
