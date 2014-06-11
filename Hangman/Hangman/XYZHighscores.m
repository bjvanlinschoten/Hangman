//
//  XYZHighscores.m
//  Hangman
//
//  Created by Boris van Linschoten on 11-06-14.
//  Copyright (c) 2014 bjvanlinschoten. All rights reserved.
//

#import "XYZHighscores.h"

@implementation XYZHighscores


-(void)updateHighscoresWithWord:(NSString *)word score:(int)mistakes {
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSNumber *score = [NSNumber numberWithInt:mistakes];
    NSArray *newscore = [NSArray arrayWithObjects:score, word, nil];
    NSMutableArray *highscores = [NSMutableArray alloc];
    highscores = [highscores initWithArray:[defaults objectForKey:@"highscores"]];
    int index = -1;
    
    if (highscores == NULL) {
        index = 0;
        highscores = [NSMutableArray arrayWithObject:newscore];
    }
    else {
        for (int i = 0; i < [highscores count]; i++) {
            NSNumber *score_i = highscores[i][0];
            NSLog(@"nieuw: %@, score-i: %@", score, score_i);
            if ([score intValue] < [score_i intValue]) {
                index = i;
                NSLog(@"index: %d", index);
                break;
            }
            NSLog(@"loop");
        }
        if (index == -1 && [highscores count] < 10) {
            index = [highscores count];
        }
        else if (index == -1){
            return;
        }
        [highscores insertObject:newscore atIndex:index];
    }
    
    [defaults setObject:highscores forKey:@"highscores"];
    [defaults synchronize];
    
}

-(NSMutableArray *)getHighscores {
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSMutableArray *highscores = [[NSMutableArray alloc] init];
    highscores = [defaults objectForKey:@"highscores"];
    return highscores;
}

-(NSString *) getCorrectWord {
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    return [defaults objectForKey:@"correctWord"];
}


@end
