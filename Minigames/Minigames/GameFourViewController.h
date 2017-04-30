//
//  GameFourViewController.h
//  Minigames
//
//  Created by Nicholas Ryan Seney on 4/29/17.
//  Copyright © 2017 Matt Perl, Joe Kim, Matt Spagnoli, Nick Seney. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GameFourViewController : UIViewController

@property (strong, nonatomic) IBOutletCollection(UIButton) NSMutableArray *GridButtons;
@property (strong, nonatomic) IBOutlet UITextField *CSTextField;
@property (strong, nonatomic) IBOutlet UITextField *HSTextField;
@property (strong, nonatomic) IBOutlet UITextField *remainingTriesField;

@property (strong, nonatomic) IBOutlet UIButton *resetButton;
@property (strong, nonatomic) IBOutlet UIButton *firstButtonPressed;
@property (strong, nonatomic) IBOutlet UIButton *secondButtonPressed;

@end
