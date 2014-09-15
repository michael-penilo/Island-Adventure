//
//  GIGViewController.h
//  Island Adventure
//
//  Created by Michael Penilo on 9/09/2014.
//  Copyright (c) 2014 Get IT Going. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GIGCharacter.h"
#import "GIGCrevisse.h"

@interface GIGViewController : UIViewController

//iVars
@property (nonatomic) CGPoint currentPoint;
@property (strong, nonatomic) NSArray *tiles;
@property (strong, nonatomic) GIGCharacter *character;
@property (strong, nonatomic) GIGCrevisse *crevisse;

//IBOutlets
@property (strong, nonatomic) IBOutlet UIImageView *backgroundImageView;
@property (strong, nonatomic) IBOutlet UILabel *healthLabel;
@property (strong, nonatomic) IBOutlet UILabel *knowledgeLabel;
@property (strong, nonatomic) IBOutlet UILabel *supplyLabel;
@property (strong, nonatomic) IBOutlet UILabel *toolLabel;
@property (strong, nonatomic) IBOutlet UILabel *storyLabel;
@property (strong, nonatomic) IBOutlet UIButton *actionButton;
@property (strong, nonatomic) IBOutlet UIButton *northButton;
@property (strong, nonatomic) IBOutlet UIButton *southButton;
@property (strong, nonatomic) IBOutlet UIButton *eastButton;
@property (strong, nonatomic) IBOutlet UIButton *westButton;
@property (strong, nonatomic) IBOutlet UIButton *resetButton;

//IBActions
- (IBAction)actionButtonPressed:(UIButton *)sender;
- (IBAction)northButtonPressed:(UIButton *)sender;
- (IBAction)southButtonPressed:(UIButton *)sender;
- (IBAction)eastButtonPressed:(UIButton *)sender;
- (IBAction)westButtonPressed:(UIButton *)sender;
- (IBAction)resetButtonPressed:(UIButton *)sender;


@end
