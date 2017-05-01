//
//  GameThreeScene.m
//  Minigames
//
//  Created by ETS Admin on 4/30/17.
//  Copyright © 2017 Matt Perl, Joe Kim, Matt Spagnoli, Nick Seney. All rights reserved.
//

#import "GameThreeScene.h"
#import <stdatomic.h>

@implementation GameThreeScene
@synthesize sceneCreated;

- (void) didMoveToView:(SKView *)view
{
    if (!sceneCreated)
    {
        self.backgroundColor = [SKColor whiteColor];
        self.scaleMode = SKSceneScaleModeAspectFill;
        [self createGameThreeScene];
        sceneCreated = TRUE;
        self.physicsWorld.gravity = CGVectorMake(0,0);
        
    }
}

- (void) createGameThreeScene
{
    //create label on top that says "Game Two"
    SKLabelNode * gameThreeNode = [SKLabelNode labelNodeWithFontNamed:@"Bradley Hand"];
    gameThreeNode.text = @"Game Three";
    
    gameThreeNode.name = @"gameThreeNode";
    gameThreeNode.fontSize = 40;
    gameThreeNode.fontColor = [SKColor blackColor];
    
    gameThreeNode.position = CGPointMake(CGRectGetMidX(self.frame),
                                         CGRectGetMaxY(self.frame)-gameThreeNode.frame.size.height - 10);
    
    [self addChild:gameThreeNode];
}

//the next couple of functions look ridiculous, but remember how hard you tried and how futile it was


- (void) touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
//    [self setUserInteractionEnabled:FALSE];
}

-(void) restartScene
{
    
}

@end
