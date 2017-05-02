//
//  FirstGameScene.h
//  Minigames
//
//  Created by Nicholas Ryan Seney on 4/29/17.
//  Copyright © 2017 Matt Perl, Joe Kim, Matt Spagnoli, Nick Seney. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>
#import "GameOverScene.h"
@interface FirstGameScene : SKScene<SKPhysicsContactDelegate>
@property(weak,nonatomic) UIViewController* viewController;

@end
