//
//  XYZHighscores.m
//  Hangman
//
//  Created by Boris van Linschoten on 11-06-14.
//  Copyright (c) 2014 bjvanlinschoten. All rights reserved.
//

#import "XYZHighscores.h"

@implementation XYZHighscores

// updates the list of highscores with new score
-(void)updateHighscoresWithWord:(NSString *)word score:(int)mistakes {
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSNumber *score = [NSNumber numberWithInt:mistakes];
    
    // make array for new score
    NSArray *newscore = [NSArray arrayWithObjects:score, word, nil];
    NSMutableArray *highscores = [NSMutableArray alloc];
    highscores = [highscores initWithArray:[defaults objectForKey:@"highscores"]];
    
    int index = -1;
    
    // check if and where the new score must come in highscores
    if (highscores == NULL) {
        index = 0;
        highscores = [NSMutableArray arrayWithObject:newscore];
    }
    else {
        for (int i = 0; i < (int)[highscores count]; i++) {
            NSNumber *score_i = highscores[i][0];
            if ([score intValue] < [score_i intValue]) {
                index = i;
                break;
            }
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

// get the highscores from userdefaults
-(NSMutableArray *)getHighscores {
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSMutableArray *highscores = [[NSMutableArray alloc] init];
    highscores = [defaults objectForKey:@"highscores"];
    return highscores;
}

// get the correctword from userdefaults
-(NSString *) getCorrectWord {
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    return [defaults objectForKey:@"correctWord"];
}

// reset highscores
-(void) resetHighscores {
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setObject:NULL forKey:@"highscores"];
}


@end
