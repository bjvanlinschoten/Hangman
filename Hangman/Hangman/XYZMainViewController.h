//
//  XYZMainViewController.h
//  Hangman
//
//  Created by Boris van Linschoten on 09-06-14.
//  Copyright (c) 2014 bjvanlinschoten. All rights reserved.
//

#import "XYZFlipsideViewController.h"
#import "Gameplay.h"
#import "XYZEndViewController.h"
#import "XYZHighscores.h"
#import "XYZWords.h"


@interface XYZMainViewController : UIViewController <XYZFlipsideViewControllerDelegate, UITextFieldDelegate>

@property (strong, nonatomic) Gameplay *gp;
@property (strong, nonatomic) XYZHighscores *hs;
@property (assign, nonatomic, readwrite) BOOL playing;
@property (strong, nonatomic) IBOutlet UILabel *hangmanWordLabel;
@property (strong, nonatomic) IBOutlet UILabel *livesLabel;
@property (strong, nonatomic) IBOutlet UITextField *letterInput;

@property (strong, nonatomic) IBOutletCollection(UILabel) NSArray *alphabet2;

-(void)changeView:(NSString *)viewController;
-(void)newGame;
- (IBAction)newGameButton:(id)sender;

@end
