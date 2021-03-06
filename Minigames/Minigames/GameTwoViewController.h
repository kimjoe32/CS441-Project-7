//
//  GameTwoViewController.h
//  Minigames
//
//  Created by Nicholas Ryan Seney on 4/29/17.
//  Copyright © 2017 Matt Perl, Joe Kim, Matt Spagnoli, Nick Seney. All rights reserved.
//


#import <SpriteKit/SpriteKit.h>
#import "GameTwoScene.h"

@interface GameTwoViewController : UIViewController
@property SKView * skView;

- (void) displayAlert:(SKScene *) scene;
- (void) backToMenu;
@end
