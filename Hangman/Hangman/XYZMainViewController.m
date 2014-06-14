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
@synthesize alphabet2;

XYZWords *words = NULL;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    self.hs = [XYZHighscores alloc];
    words = [XYZWords alloc];
    
    // start new game
    [self newGame];
};

- (void)viewDidAppear:(BOOL)animated {
    // make sure keyboard is active
    if (self.playing) {
        [self.letterInput becomeFirstResponder];
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
};

#pragma mark - Flipside View

- (void)flipsideViewControllerDidFinish:(XYZFlipsideViewController *)controller
{
    [self dismissViewControllerAnimated:YES completion:nil];
    // make sure keyboard is active
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
    
    // if input is a valid lowercase letter
    if (c>='a' && c<='z') {
        
        // check later
        BOOL letterChecked = [self.gp checkLetter:[string lowercaseString]];
        
        // update the alphabet labels
        UILabel *tempLabel;
        for (UILabel *label in self.alphabet2) {
            if ([[label.text lowercaseString] isEqualToString:string]) {
                tempLabel = label;
            }
        }
        if (letterChecked) {
            tempLabel.textColor = [UIColor colorWithRed:27/255.0f green:142/255.0f blue:24/255.0f alpha:0.6f];
        }
        else {
            tempLabel.textColor = [UIColor colorWithRed:206/255.0f green:2/255.0f blue:1/255.0f alpha:0.6f];
        }
        
        // update hangman word and lives label
        hangmanWordLabel.text = self.gp.hangmanWord;
        self.livesLabel.text = [NSString stringWithFormat:@"Lives: %d", self.gp.lives];
        
        // if game end
        if ([self.gp isGameEnd]) {
            self.hangmanWordLabel.text = self.gp.correctWord;
            [self.letterInput resignFirstResponder];
            self.playing = false;
            NSString *result;
            
            // if game is won, update highscores
            if ([self.gp isGameWon]) {
                [self.hs updateHighscoresWithWord:self.gp.correctWord score:self.gp.mistakes];
                result = @"won";
            }
            else {
                result = @"lost";
            }
            NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
            [defaults setObject:result forKey:@"result"];
            [defaults synchronize];
            
            // go to highscores view controller
            [self changeView:@"XYZEndViewController"];
        }
    }
    
    return NO;
};

// changes view controller
-(void)changeView:(NSString *)viewController {
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    UIViewController *vc = [storyboard instantiateViewControllerWithIdentifier:viewController];
    [vc setModalPresentationStyle:UIModalPresentationFullScreen];
    [self presentViewController:vc animated:YES completion:nil];
}

// starts new game, with new word
-(void)newGame {
    self.gp = [Gameplay alloc];
    NSString *correctWord = [words getWord];
    self.playing = true;
    [self.gp setUpGame:correctWord];
    hangmanWordLabel.text = self.gp.hangmanWord;
    self.livesLabel.text = [NSString stringWithFormat:@"Lives: %d", self.gp.lives];
    for (UILabel *label in alphabet2) {
        label.textColor = [UIColor blackColor];
    }
}

// when user gives up by pressing this button, start new game after showing correct word for 1 second
- (IBAction)newGameButton:(id)sender {
    self.hangmanWordLabel.text = self.gp.correctWord;
    [self performSelector:@selector(newGame) withObject:nil afterDelay:1.0];
}

@end
