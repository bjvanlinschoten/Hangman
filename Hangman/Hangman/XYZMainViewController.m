//
//  XYZMainViewController.m
//  Hangman
//
//  Created by Boris van Linschoten on 09-06-14.
//  Copyright (c) 2014 bjvanlinschoten. All rights reserved.
//

#import "XYZMainViewController.h"

@interface XYZMainViewController ()

@end

@implementation XYZMainViewController

@synthesize hangmanWordLabel;
@synthesize letterInput;
@synthesize livesLabel;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    self.gp = [Gameplay alloc];
    self.hs = [XYZHighscores alloc];
    self.playing = true;
    [self.gp setUpWord:@"hangman"];
    hangmanWordLabel.text = self.gp.hangmanWord;
    self.livesLabel.text = [NSString stringWithFormat:@"Lives: %d", self.gp.lives];
    [self.letterInput becomeFirstResponder];
};

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
};

#pragma mark - Flipside View

- (void)flipsideViewControllerDidFinish:(XYZFlipsideViewController *)controller
{
    [self dismissViewControllerAnimated:YES completion:nil];
    if (self.playing) {
        [self.letterInput becomeFirstResponder];
    }
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue identifier] isEqualToString:@"showAlternate"]) {
        [[segue destinationViewController] setDelegate:self];
    }
};

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string {
    
    char c = [[string lowercaseString] characterAtIndex:0];
    
    if (c>='a' && c<='z') {
        BOOL letterChecked = [self.gp checkLetter:[string lowercaseString]];
        NSString *tempString = [NSString stringWithFormat:@"%cLabel", c];
        UILabel *tempLabel = [self valueForKey:tempString];
        if (letterChecked) {
            tempLabel.textColor = [UIColor colorWithRed:27/255.0f green:142/255.0f blue:24/255.0f alpha:0.6f];
        }
        else {
            tempLabel.textColor = [UIColor colorWithRed:206/255.0f green:2/255.0f blue:1/255.0f alpha:0.6f];
        }
        hangmanWordLabel.text = self.gp.hangmanWord;
        self.livesLabel.text = [NSString stringWithFormat:@"Lives: %d", self.gp.lives];
        
        BOOL won = [self.gp isGameWon:self.gp.hangmanWord];
        
        if (won || self.gp.lives == 0) {
            self.hangmanWordLabel.text = self.gp.correctWord;
            [self.letterInput resignFirstResponder];
            self.playing = false;
            NSString *result;
            if (won) {
                [self.hs updateHighscoresWithWord:self.gp.correctWord score:self.gp.mistakes];
                result = @"won";
            }
            else {
                result = @"lost";
            }
            NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
            [defaults setObject:result forKey:@"result"];
            [defaults synchronize];
            [self changeView:@"XYZEndViewController"];
        }
    }
    
    return NO;
};

-(void)changeView:(NSString *)viewController {
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    UIViewController *vc = [storyboard instantiateViewControllerWithIdentifier:viewController];
    [vc setModalPresentationStyle:UIModalPresentationFullScreen];
    [self presentViewController:vc animated:YES completion:nil];
}

@end
