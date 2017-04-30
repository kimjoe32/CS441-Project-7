//
//  GameTwoScene.h
//  Minigames
//
//  Created by ETS Admin on 4/29/17.
//  Copyright © 2017 Matt Perl, Joe Kim, Matt Spagnoli, Nick Seney. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>
#import "GameTwoViewController.h"
@interface GameTwoScene : SKScene <SKPhysicsContactDelegate>
@property (nonatomic) BOOL sceneCreated;
@property (nonatomic) BOOL isJumping;
@property (nonatomic) NSInteger score;
@property (weak, nonatomic) UIViewController * viewController;


- (void) restartScene;
@end
