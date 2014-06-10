//
//  XYZFlipsideViewController.h
//  Hangman
//
//  Created by Boris van Linschoten on 09-06-14.
//  Copyright (c) 2014 bjvanlinschoten. All rights reserved.
//

#import <UIKit/UIKit.h>

@class XYZFlipsideViewController;

@protocol XYZFlipsideViewControllerDelegate
- (void)flipsideViewControllerDidFinish:(XYZFlipsideViewController *)controller;
@end

@interface XYZFlipsideViewController : UIViewController

@property (strong, nonatomic) IBOutlet UILabel *livesLabel;
@property (strong, nonatomic) IBOutlet UILabel *lengthOfWordLabel;
@property (strong, nonatomic) IBOutlet UISlider *livesSlider;
@property (strong, nonatomic) IBOutlet UISlider *lengthOfWordSlider;


- (IBAction)setLives:(id)sender;
- (IBAction)setLengthOfWord:(id)sender;

@property (weak, nonatomic) id <XYZFlipsideViewControllerDelegate> delegate;

- (IBAction)done:(id)sender;

@end
