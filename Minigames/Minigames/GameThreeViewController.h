//
//  GameThreeViewController.h
//  Minigames
//
//  Created by Nicholas Ryan Seney on 4/29/17.
//  Copyright © 2017 Matt Perl, Joe Kim, Matt Spagnoli, Nick Seney. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>
#import "GameThreeScene.h"

@interface GameThreeViewController : UIViewController
@property SKView * skView;

- (void) displayAlert:(SKScene *) scene;
- (void) backToMenu;
@end
