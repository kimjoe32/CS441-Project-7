//
//  GameTwoScene.m
//  Minigames
//
//  Created by ETS Admin on 4/29/17.
//  Copyright © 2017 Matt Perl, Joe Kim, Matt Spagnoli, Nick Seney. All rights reserved.
//

#import "GameTwoScene.h"

@implementation GameTwoScene
- (void) didMoveToView:(SKView *)view
{
    if (!self.sceneCreated)
    {
        self.backgroundColor = [SKColor whiteColor];
        self.scaleMode = SKSceneScaleModeAspectFill;
        [self addChild:[self createGameTwoScene]];
        [self initScene];
        self.sceneCreated = TRUE;
    }
}

- (SKLabelNode*) createGameTwoScene
{
    SKLabelNode * gameTwoNode =
    [SKLabelNode labelNodeWithFontNamed:@"Bradley Hand"];
    
    gameTwoNode.name = @"gameTwoNode";
    gameTwoNode.text = @"Game Two";
    
    gameTwoNode.fontSize = 40;
    gameTwoNode.fontColor = [SKColor blackColor];
    
    gameTwoNode.position = CGPointMake(CGRectGetMidX(self.frame),
                                       CGRectGetMaxY(self.frame));
    
    return gameTwoNode;
}

- (void) initScene
{
    //make obstacle node
    SKSpriteNode* obstacleNode = [self createObstacleNode];
    [self addChild:obstacleNode];
    
    //make player node
    SKSpriteNode* playerNode = [self createPlayerNode];
    [self addChild:playerNode];
}

-(SKSpriteNode*) createObstacleNode
{
    SKSpriteNode* obstacleNode =
    [[SKSpriteNode alloc] initWithImageNamed:@"Obs1.png"];
    
    obstacleNode.name = @"obstacleNode";
    
    obstacleNode.position = CGPointMake(CGRectGetMidX(self.frame),
                                        CGRectGetMidY(self.frame));
    
    
    //animate obstaclenode
    NSMutableArray * obstacleFrames = [NSMutableArray array];
    for(int i = 1; i < 10; i++)
    {
        SKTexture* skt = [SKTexture textureWithImageNamed:[NSString stringWithFormat:@"Obs%d.png",i]];
        skt.filteringMode = SKTextureFilteringNearest;
        [obstacleFrames addObject:skt];
    }
    
    self.obstacleAnimation = obstacleFrames;
    if (obstacleNode != nil)
    {
        SKAction * anim = [SKAction repeatActionForever:
                           [SKAction animateWithTextures:self.obstacleAnimation
                                            timePerFrame:.4]];
        [obstacleNode runAction:anim];
    }
    return obstacleNode;
}

-(SKSpriteNode*) createPlayerNode
{
    SKSpriteNode* playerNode =
    [[SKSpriteNode alloc] initWithImageNamed:@"Player.png"];
    
    playerNode.position = CGPointMake(CGRectGetMidX(self.frame),
                                        CGRectGetMidY(self.frame) + 100);
    
    return playerNode;
}
@end

