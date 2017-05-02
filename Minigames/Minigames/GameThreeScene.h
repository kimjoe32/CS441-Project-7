//
//  GameThreeScene.h
//  Minigames
//
//  Created by ETS Admin on 4/30/17.
//  Copyright © 2017 Matt Perl, Joe Kim, Matt Spagnoli, Nick Seney. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>
#import "GameThreeViewController.h"
@interface GameThreeScene : SKScene <SKPhysicsContactDelegate>
@property (weak, nonatomic) UIViewController * viewController;
@property (nonatomic) BOOL sceneCreated;
- (void) restartScene;
@end
