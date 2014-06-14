//
//  XYZEndViewController.m
//  Hangman
//
//  Created by Boris van Linschoten on 11-06-14.
//  Copyright (c) 2014 bjvanlinschoten. All rights reserved.
//

#import "XYZEndViewController.h"

@interface XYZEndViewController ()

@end

@implementation XYZEndViewController

@synthesize highscores;
@synthesize correctWordLabel;
@synthesize hs;
@synthesize colorBlock;
@synthesize resultLabel;
@synthesize highscoreScoreLabels;
@synthesize highscoreWordLabels;

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.hs = [XYZHighscores alloc];
    
    // get correct word and result from last game
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSString *result = [defaults objectForKey:@"result"];
    NSString *correctWord = [defaults objectForKey:@"correctWord"];
    self.correctWordLabel.text = correctWord;
    
    // configure view according to the achieved result
    if ([result isEqualToString:@"lost"]) {
        self.colorBlock.backgroundColor = [UIColor colorWithRed:206/255.0f green:2/255.0f blue:1/255.0f alpha:0.8f];
        self.resultLabel.text = @"YOU LOST :(";
    }
    else {
        self.colorBlock.backgroundColor = [UIColor colorWithRed:27/255.0f green:142/255.0f blue:24/255.0f alpha:0.8f];
        self.resultLabel.text = @"YOU WON!";
    }
    
    // order the score labels outlet collection by y-coordinate
    self.highscoreScoreLabels = [self.highscoreScoreLabels sortedArrayUsingComparator:^NSComparisonResult(id label1, id label2) {
        if ([label1 frame].origin.y < [label2 frame].origin.y) return NSOrderedAscending;
        else if ([label1 frame].origin.y > [label2 frame].origin.y) return NSOrderedDescending;
        else return NSOrderedSame;
    }];
    
    // order the word labels outlet collection by y-coordinate
    self.highscoreWordLabels = [self.highscoreWordLabels sortedArrayUsingComparator:^NSComparisonResult(id label1, id label2) {
        if ([label1 frame].origin.y < [label2 frame].origin.y) return NSOrderedAscending;
        else if ([label1 frame].origin.y > [label2 frame].origin.y) return NSOrderedDescending;
        else return NSOrderedSame;
    }];
    
    [self updateHighscoreLabels];

    
}

- (void)flipsideViewControllerDidFinish:(XYZFlipsideViewController *)controller
{
    [self dismissViewControllerAnimated:YES completion:nil];
};

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue identifier] isEqualToString:@"showOptions"]) {
        [[segue destinationViewController] setDelegate:self];
    }
};

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

// go to main view controller and thus start a new game
- (IBAction)newGame:(id)sender {
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    UIViewController *vc = [storyboard instantiateViewControllerWithIdentifier:@"XYZMainViewController"];
    [vc setModalPresentationStyle:UIModalPresentationFullScreen];
    [self presentViewController:vc animated:YES completion:nil];
}

// update the highscore labels with new highscores
- (void) updateHighscoreLabels {
    
    self.highscores = [self.hs getHighscores];
    
    // iterate over all labels
    for (int i = 0; i < 10; i++) {
        UILabel *tempLabelWord = self.highscoreWordLabels[i];
        UILabel *tempLabelScore = self.highscoreScoreLabels[i];
        
        // set label text to highscores
        if (highscores == NULL) {
            tempLabelWord.text = @"";
            tempLabelScore.text = @"";
        }
        else if (i < [highscores count]) {
            NSString *tempStringLabelText = [NSString stringWithFormat:@"%d. %@", i + 1, self.highscores[i][1]];
            NSString *tempStringLabelScore = [NSString stringWithFormat:@"%@", self.highscores[i][0]];
            tempLabelWord.text = tempStringLabelText;
            tempLabelScore.text = tempStringLabelScore;
        }
        else {
            tempLabelWord.text = @"";
            tempLabelScore.text = @"";
        }
    }
}

// ibaction for resetting highscores
- (IBAction)resetHighscores:(id)sender {
    [self.hs resetHighscores];
    [self updateHighscoreLabels];
}



@end
