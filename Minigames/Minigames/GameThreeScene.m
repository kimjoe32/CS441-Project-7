//
//  GameThreeScene.m
//  Minigames
//
//  Created by ETS Admin on 4/30/17.
//  Copyright © 2017 Matt Perl, Joe Kim, Matt Spagnoli, Nick Seney. All rights reserved.
//

#import "GameThreeScene.h"

@implementation GameThreeScene
@synthesize sceneCreated;
@synthesize cup1;
@synthesize cup2;
@synthesize cup3;

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
    
    cup1 = [[SKSpriteNode alloc] initWithImageNamed:@"Cup.png"];
    cup1.position = CGPointMake(CGRectGetMidX(self.frame) - 100,
                                        CGRectGetMidY(self.frame));
    
    cup2 = [[SKSpriteNode alloc] initWithImageNamed:@"Cup.png"];
    cup2.position = CGPointMake(CGRectGetMidX(self.frame),
                                CGRectGetMidY(self.frame));
    
    cup3 = [[SKSpriteNode alloc] initWithImageNamed:@"Cup.png"];
    cup3.position = CGPointMake(CGRectGetMidX(self.frame) + 100,
                                CGRectGetMidY(self.frame));
    
    [self addChild:cup1];
    [self addChild:cup2];
    [self addChild:cup3];
}


- (void) touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event

{
    
}

-(void) restartScene
{
    
}
@end
