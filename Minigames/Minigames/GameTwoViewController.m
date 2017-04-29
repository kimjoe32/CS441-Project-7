//
//  GameTwoViewController.m
//  Minigames
//
//  Created by Nicholas Ryan Seney on 4/29/17.
//  Copyright © 2017 Matt Perl, Joe Kim, Matt Spagnoli, Nick Seney. All rights reserved.
//

#import "GameTwoViewController.h"

@implementation GameTwoViewController
static const uint32_t playerCategory = 0x1 << 0;
static const uint32_t obstacleCategory = 0x1 << 1;
-(void) viewDidLoad
{
    [super viewDidLoad];
    SKView * skView = (SKView*) self.view;
    skView.showsFPS = TRUE;
    skView.showsNodeCount = TRUE;
    
    SKScene *scene = [[GameTwoScene alloc] initWithSize:CGSizeMake(skView.bounds.size.width,
                                                              skView.bounds.size.height)];
    
    [skView presentScene:scene];
}


- (void) createPlayer
{
    SKSpriteNode *player = [[SKSpriteNode alloc] initWithImageNamed:@"Player.png"];
    player.position = CGPointMake(184, 530);
    player.name = @"playerNode";
    player.physicsBody = [SKPhysicsBody bodyWithRectangleOfSize:CGSizeMake(20, 20)];
    
    player.physicsBody.usesPreciseCollisionDetection = TRUE;
    player.physicsBody.categoryBitMask = playerCategory;
    
//    [self addCh :player];
}


@end
