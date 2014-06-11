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

@interface XYZEndViewController : UIViewController

@property (strong, nonatomic) IBOutlet UIView *colorBlock;
@property (strong, nonatomic) IBOutlet UILabel *resultLabel;
@property (strong, nonatomic) IBOutlet UILabel *hangmanLabel;
@property (strong, nonatomic) NSMutableArray *highscores;
@property (strong, nonatomic) XYZHighscores *hs;
@property (strong, nonatomic) IBOutlet UILabel *highscore1Label;
@property (strong, nonatomic) IBOutlet UILabel *highscore2Label;
@property (strong, nonatomic) IBOutlet UILabel *highscore3Label;
@property (strong, nonatomic) IBOutlet UILabel *highscore4Label;
@property (strong, nonatomic) IBOutlet UILabel *highscore5Label;
@property (strong, nonatomic) IBOutlet UILabel *highscore6Label;
@property (strong, nonatomic) IBOutlet UILabel *highscore7Label;
@property (strong, nonatomic) IBOutlet UILabel *highscore8Label;
@property (strong, nonatomic) IBOutlet UILabel *highscore9Label;
@property (strong, nonatomic) IBOutlet UILabel *highscore10Label;
@property (strong, nonatomic) IBOutlet UILabel *highscore1ScoreLabel;
@property (strong, nonatomic) IBOutlet UILabel *highscore2ScoreLabel;
@property (strong, nonatomic) IBOutlet UILabel *highscore3ScoreLabel;
@property (strong, nonatomic) IBOutlet UILabel *highscore4ScoreLabel;
@property (strong, nonatomic) IBOutlet UILabel *highscore5ScoreLabel;
@property (strong, nonatomic) IBOutlet UILabel *highscore6ScoreLabel;
@property (strong, nonatomic) IBOutlet UILabel *highscore7ScoreLabel;
@property (strong, nonatomic) IBOutlet UILabel *highscore8ScoreLabel;
@property (strong, nonatomic) IBOutlet UILabel *highscore9ScoreLabel;
@property (strong, nonatomic) IBOutlet UILabel *highscore10ScoreLabel;

- (IBAction)newGame:(id)sender;

@end
