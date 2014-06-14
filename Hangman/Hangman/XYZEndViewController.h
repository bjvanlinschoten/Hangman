//
//  XYZEndViewController.h
//  Hangman
//
//  Created by Boris van Linschoten on 11-06-14.
//  Copyright (c) 2014 bjvanlinschoten. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "XYZMainViewController.h"
#import "XYZHighscores.h"

@interface XYZEndViewController : UIViewController <XYZFlipsideViewControllerDelegate>

@property (strong, nonatomic) IBOutlet UIView *colorBlock;
@property (strong, nonatomic) IBOutlet UILabel *resultLabel;
@property (strong, nonatomic) IBOutlet UILabel *correctWordLabel;
@property (strong, nonatomic) NSMutableArray *highscores;
@property (strong, nonatomic) XYZHighscores *hs;

@property (strong, nonatomic) IBOutletCollection(UILabel) NSArray *highscoreWordLabels;

@property (strong, nonatomic) IBOutletCollection(UILabel) NSArray *highscoreScoreLabels;

- (IBAction)newGame:(id)sender;
- (void) updateHighscoreLabels;
- (IBAction)resetHighscores:(id)sender;

@end
