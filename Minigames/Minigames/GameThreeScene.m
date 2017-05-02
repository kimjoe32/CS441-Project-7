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
static const uint32_t playerCategory = 0x1 << 0;
static const uint32_t obstacleCategory = 0x1 << 1;
SKSpriteNode * playerNode;

- (void) didMoveToView:(SKView *)view
{
    if (!sceneCreated)
    {
        self.scaleMode = SKSceneScaleModeAspectFill;
        [self createObstacles];
        [self createButtons];
        [self createPlayer];
        sceneCreated = TRUE;
        self.physicsWorld.gravity = CGVectorMake(0,0);
        self.physicsWorld.contactDelegate = self;
    }
}

-(id)initWithSize:(CGSize)size {
    if (self = [super initWithSize:size])
    {
        SKSpriteNode *sn = [SKSpriteNode spriteNodeWithImageNamed:@"game3board.png"];
        
        sn.position = CGPointMake(CGRectGetMidX(self.frame), CGRectGetMidY(self.frame));
        sn.name = @"BACKGROUND";
        
        [self addChild:sn];
    }
    return self;
}

-(void) createObstacles
{
    for (int i =0; i < 31; i++)
    {
        SKSpriteNode * obs = [[SKSpriteNode alloc] initWithImageNamed:@"obstacleSquare.png"];
        if (i % 2 == 0)
            obs.position = CGPointMake(27,  CGRectGetMaxY(self.frame) - ((i*18) + 99));
        else
            obs.position = CGPointMake(243, CGRectGetMaxY(self.frame) - ((i*18) + 99));
        
        //setup physicsbody
        obs.texture = [SKTexture textureWithImage:[UIImage imageNamed:@"obstacleSquare.png"]];
        obs.name = @"obstacle";
        obs.physicsBody = [SKPhysicsBody bodyWithRectangleOfSize:CGSizeMake(17, 17)];
        obs.physicsBody.dynamic = FALSE;
        obs.physicsBody.categoryBitMask = obstacleCategory;
        obs.physicsBody.contactTestBitMask = playerCategory;
        obs.physicsBody.collisionBitMask = 0;
        obs.physicsBody.usesPreciseCollisionDetection = TRUE;
        
        [self addChild:obs];
        
        CGMutablePathRef path = CGPathCreateMutable();
        CGPathMoveToPoint(path, NULL, CGRectGetMidX(obs.frame), CGRectGetMidY(obs.frame));
        
        if (i%2 == 0)
            CGPathAddLineToPoint(path, NULL, 243, CGRectGetMidY(obs.frame));
        else
            CGPathAddLineToPoint(path, NULL, 27, CGRectGetMidY(obs.frame));
        SKAction *followline = [SKAction followPath:path
                                           asOffset:FALSE
                                       orientToPath:NO
                                           duration:2.0 - ((i%2)*.1)];
        
        [obs runAction:[SKAction repeatActionForever:[SKAction sequence:@[followline,
                                                                          [followline reversedAction]
                                                                          ]]]];
    }
}

-(void) createPlayer
{
    if (playerNode == nil)
    {
        playerNode =[[SKSpriteNode alloc] initWithImageNamed:@"PlayerSquare.png"];
        
        //setup physicsbody
        playerNode.name = @"playerNode";
        playerNode.physicsBody.dynamic = FALSE;
        playerNode.physicsBody = [SKPhysicsBody bodyWithRectangleOfSize:CGSizeMake(17, 17)];
        playerNode.physicsBody.categoryBitMask = playerCategory;
        playerNode.physicsBody.contactTestBitMask = obstacleCategory;
        playerNode.physicsBody.collisionBitMask = 0;
        
        playerNode.position = CGPointMake(135,
                                          CGRectGetMaxY(self.frame) - 693);
    }
    [self addChild:playerNode];
}

- (void) didBeginContact: (SKPhysicsContact *)contact
{
    //playerCategory = 0x1 << 0;
    //obstacleCategory = 0x1 << 1;
    SKPhysicsBody *playerBody, *obstacleBody;
    if (contact.bodyA.categoryBitMask < contact.bodyB.categoryBitMask)
    {
        playerBody = contact.bodyA;
        obstacleBody = contact.bodyB;
    }
    else
    {
        obstacleBody = contact.bodyB;
        playerBody = contact.bodyA;
    }
    
}

- (void) createButtons
{
    SKSpriteNode * down = [SKSpriteNode spriteNodeWithImageNamed:@"DownArrow.png"];
    down.position = CGPointMake(350,CGRectGetMidY(self.frame) - 55);
    down.name = @"down";
    down.zPosition = 1.0;
    
    SKSpriteNode * up = [SKSpriteNode spriteNodeWithImageNamed:@"UpArrow.png"];
    up.position = CGPointMake(350,CGRectGetMidY(self.frame) + 55);
    up.name = @"up";
    up.zPosition = 1.0;
    
    SKSpriteNode * right = [SKSpriteNode spriteNodeWithImageNamed:@"RightArrow.png"];
    right.position = CGPointMake(387,CGRectGetMidY(self.frame));
    right.name = @"right";
    right.zPosition = 1.0;
    
    SKSpriteNode * left = [SKSpriteNode spriteNodeWithImageNamed:@"LeftArrow.png"];
    left.position = CGPointMake(313,CGRectGetMidY(self.frame));
    left.name = @"left";
    left.zPosition = 1.0;
    
    [self addChild:down];
    [self addChild:right];
    [self addChild:left];
    [self addChild:up];
    
}

- (void) touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    UITouch *touch = [touches anyObject];
    CGPoint location = [touch locationInNode:self];
    
    SKNode *node = [self nodeAtPoint:location];
    CGFloat nodex= playerNode.position.x;
    CGFloat nodey= playerNode.position.y;
    if ([node.name isEqualToString:@"up"])
    {
        if (nodey+18 >= 644)    //player reached the top + middle
        {
            if (nodex > 91 && nodex <180)
            {
                playerNode.position = CGPointMake(nodex, nodey+18);
                NSLog(@"you win");
            }
        }
        else
        {
            playerNode.position = CGPointMake(nodex, nodey+18);
        }
    }
    else if ([node.name isEqualToString:@"down"])
    {
        if (nodey - 18 <= 87 && nodey -18 >= 25)
        {
            if (nodex >91 && nodex < 180)
            {
                playerNode.position = CGPointMake(nodex, nodey-18);
            }
        }
        else if(nodey -18 >= 25)
        {
            playerNode.position = CGPointMake(nodex, nodey-18);
        }
    }
    else if ([node.name isEqualToString:@"right"])
    {
        if ((nodex + 18 < 252 && nodey <644 && nodey >87) || (nodey < 87 && nodex + 18 < 180))
        {
            playerNode.position = CGPointMake(nodex+18, nodey);
        }
        
    }
    else if ([node.name isEqualToString:@"left"])
    {
        if ((nodex - 18 > 19 && nodey <644 && nodey >87) || (nodey < 87 && nodex - 18 > 91))
        {
            playerNode.position = CGPointMake(nodex - 18, nodey);
        }
    }
}

-(void) restartScene
{
    
}

@end
