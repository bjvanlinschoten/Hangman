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

Gameplay *gp = NULL;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    gp = Gameplay.alloc;
    [gp setUpWord:@"hangman"];
    hangmanWordLabel.text = gp.hangmanWord;
    self.livesLabel.text = [NSString stringWithFormat:@"Lives: %d", gp.lives];
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
};

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue identifier] isEqualToString:@"showAlternate"]) {
        [[segue destinationViewController] setDelegate:self];
    }
};

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string {
    
    char c = [string characterAtIndex:0];
    
    if (c>='A' && c<='Z') {
        c = c + 32;
    }
    
    if (c>='a' && c<='z') {
        BOOL b = [gp checkLetter:string];
        NSString *tempString = [NSString stringWithFormat:@"%cLabel", c];
        UILabel *tempLabel = [self valueForKey:tempString];
        if (b) {
            tempLabel.textColor = [UIColor colorWithRed:27/255.0f green:142/255.0f blue:24/255.0f alpha:0.5f];
        }
        else {
            tempLabel.textColor = [UIColor colorWithRed:206/255.0f green:2/255.0f blue:1/255.0f alpha:0.5f];
        }
        hangmanWordLabel.text = gp.hangmanWord;
        self.livesLabel.text = [NSString stringWithFormat:@"Lives: %d", gp.lives];
    }
    
    return NO;
};

@end
