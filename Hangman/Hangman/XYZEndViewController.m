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
@synthesize hangmanLabel;
@synthesize hs;
@synthesize colorBlock;
@synthesize resultLabel;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.hs = [XYZHighscores alloc];
    self.highscores = [self.hs getHighscores];
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSString *result = [defaults objectForKey:@"result"];
    
    if ([result isEqualToString:@"lost"]) {
        self.colorBlock.backgroundColor = [UIColor colorWithRed:206/255.0f green:2/255.0f blue:1/255.0f alpha:0.8f];
        self.resultLabel.text = @"YOU LOST :(";
    }
    else {
        self.colorBlock.backgroundColor = [UIColor colorWithRed:27/255.0f green:142/255.0f blue:24/255.0f alpha:0.8f];
        self.resultLabel.text = @"YOU WON!";
    }
    
    for (int i = 0; i < 10; i++) {
        NSString *tempStringWord = [NSString stringWithFormat:@"highscore%dLabel", i + 1];
        NSString *tempStringScore = [NSString stringWithFormat:@"highscore%dScoreLabel",i + 1];
        UILabel *tempLabelWord = [self valueForKey:tempStringWord];
        UILabel *tempLabelScore = [self valueForKeyPath:tempStringScore];
        
        if (i < [highscores count]) {
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


- (IBAction)newGame:(id)sender {
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    UIViewController *vc = [storyboard instantiateViewControllerWithIdentifier:@"XYZMainViewController"];
    [vc setModalPresentationStyle:UIModalPresentationFullScreen];
    [self presentViewController:vc animated:YES completion:nil];
}

@end
