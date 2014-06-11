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


@interface XYZMainViewController : UIViewController <XYZFlipsideViewControllerDelegate, UITextFieldDelegate>

@property (strong, nonatomic) Gameplay *gp;
@property (strong, nonatomic) XYZHighscores *hs;
@property (assign, nonatomic, readwrite) BOOL playing;
@property (strong, nonatomic) IBOutlet UILabel *hangmanWordLabel;
@property (strong, nonatomic) IBOutlet UILabel *livesLabel;
@property (strong, nonatomic) IBOutlet UITextField *letterInput;
@property (strong, nonatomic) IBOutlet UILabel *aLabel;
@property (strong, nonatomic) IBOutlet UILabel *bLabel;
@property (strong, nonatomic) IBOutlet UILabel *cLabel;
@property (strong, nonatomic) IBOutlet UILabel *dLabel;
@property (strong, nonatomic) IBOutlet UILabel *eLabel;
@property (strong, nonatomic) IBOutlet UILabel *fLabel;
@property (strong, nonatomic) IBOutlet UILabel *gLabel;
@property (strong, nonatomic) IBOutlet UILabel *hLabel;
@property (strong, nonatomic) IBOutlet UILabel *iLabel;
@property (strong, nonatomic) IBOutlet UILabel *jLabel;
@property (strong, nonatomic) IBOutlet UILabel *kLabel;
@property (strong, nonatomic) IBOutlet UILabel *lLabel;
@property (strong, nonatomic) IBOutlet UILabel *mLabel;
@property (strong, nonatomic) IBOutlet UILabel *nLabel;
@property (strong, nonatomic) IBOutlet UILabel *oLabel;
@property (strong, nonatomic) IBOutlet UILabel *pLabel;
@property (strong, nonatomic) IBOutlet UILabel *qLabel;
@property (strong, nonatomic) IBOutlet UILabel *rLabel;
@property (strong, nonatomic) IBOutlet UILabel *sLabel;
@property (strong, nonatomic) IBOutlet UILabel *tLabel;
@property (strong, nonatomic) IBOutlet UILabel *uLabel;
@property (strong, nonatomic) IBOutlet UILabel *vLabel;
@property (strong, nonatomic) IBOutlet UILabel *wLabel;
@property (strong, nonatomic) IBOutlet UILabel *xLabel;
@property (strong, nonatomic) IBOutlet UILabel *yLabel;
@property (strong, nonatomic) IBOutlet UILabel *zLabel;

-(void)changeView:(NSString *)viewController;

@end
