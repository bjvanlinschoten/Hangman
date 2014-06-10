//
//  XYZFlipsideViewController.m
//  Hangman
//
//  Created by Boris van Linschoten on 09-06-14.
//  Copyright (c) 2014 bjvanlinschoten. All rights reserved.
//

#import "XYZFlipsideViewController.h"

@interface XYZFlipsideViewController ()

@end

@implementation XYZFlipsideViewController

@synthesize livesLabel, livesSlider, lengthOfWordLabel, lengthOfWordSlider;

- (void)viewDidLoad
{
    [super viewDidLoad];
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    int lives = [defaults integerForKey:@"lives"];
    int lengthOfWord = [defaults integerForKey:@"lengthOfWord"];
    livesSlider.value = lives;
    livesLabel.text = [NSString stringWithFormat:@"Number of Lives: %d", lives];
    lengthOfWordSlider.value = lengthOfWord;
    lengthOfWordLabel.text = [NSString stringWithFormat:@"Length of Word: %d", lengthOfWord];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Actions

- (IBAction)done:(id)sender {
    [self.delegate flipsideViewControllerDidFinish:self];
}

- (IBAction)setLives:(id)sender {
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSInteger lives = (int)livesSlider.value;
    [defaults setInteger:lives forKey:@"lives"];
    livesLabel.text = [NSString stringWithFormat:@"Number of Lives: %d", lives];
}

- (IBAction)setLengthOfWord:(id)sender {
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSInteger lengthOfWord = (int)lengthOfWordSlider.value;
    [defaults setInteger:lengthOfWord forKey:@"lengthOfWord"];
    lengthOfWordLabel.text = [NSString stringWithFormat:@"Length of Word: %d", lengthOfWord];
}
@end
