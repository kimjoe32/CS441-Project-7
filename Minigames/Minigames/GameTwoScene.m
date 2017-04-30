//
//  GameTwoScene.m
//  Minigames
//
//  Created by ETS Admin on 4/29/17.
//  Copyright © 2017 Matt Perl, Joe Kim, Matt Spagnoli, Nick Seney. All rights reserved.
//

#import "GameTwoScene.h"

@implementation GameTwoScene
@synthesize score;
@synthesize sceneCreated;
@synthesize isJumping;
@synthesize viewController;

static const uint32_t playerCategory = 0x1 << 0;
static const uint32_t obstacleCategory = 0x1 << 1;

-(void)dealloc {
    NSLog(@"%s - %p",__PRETTY_FUNCTION__,self);
}

- (void) didMoveToView:(SKView *)view
{
    if (!sceneCreated)
    {
        NSLog(@"scenecreate");
        isJumping = FALSE;
        self.backgroundColor = [SKColor colorWithRed:254/255.0 green:209/255.0 blue:0 alpha:1];
        self.scaleMode = SKSceneScaleModeAspectFill;
        [self initObjects];
        [self createGameTwoScene];
        sceneCreated = TRUE;
        self.physicsWorld.gravity = CGVectorMake(0,0);
        self.physicsWorld.contactDelegate = self;
    }
}

- (void) createGameTwoScene
{
    //create label on top that says "Game Two"
    SKLabelNode * gameTwoNode = [SKLabelNode labelNodeWithFontNamed:@"Bradley Hand"];
    gameTwoNode.text = @"Game Two";
    
    gameTwoNode.name = @"gameTwoNode";
    gameTwoNode.fontSize = 40;
    gameTwoNode.fontColor = [SKColor blackColor];
    
    gameTwoNode.position = CGPointMake(CGRectGetMidX(self.frame),
                                       CGRectGetMaxY(self.frame)-gameTwoNode.frame.size.height - 10);
    
    //create label that displays score
    SKLabelNode * scoreNode = [SKLabelNode labelNodeWithFontNamed:@"Bradley Hand"];
    scoreNode.text = @"Score: 0";
    
    scoreNode.name = @"scoreNode";
    scoreNode.fontSize = 40;
    scoreNode.fontColor = [SKColor blackColor];
    
    scoreNode.position = CGPointMake(CGRectGetMidX(self.frame),
                                       gameTwoNode.frame.origin.y - gameTwoNode.frame.size.height);
    
    [self addChild:gameTwoNode];
    [self addChild:scoreNode];
}

- (void) initObjects
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
    obstacleNode.position = CGPointMake(CGRectGetMidX(self.frame),
                                        CGRectGetMidY(self.frame));
    
    //setup physicsbody
    obstacleNode.texture = [SKTexture textureWithImage:[UIImage imageNamed:@"Obs1.png"]];
    obstacleNode.name = @"obstacleNode";
    obstacleNode.physicsBody = [SKPhysicsBody bodyWithTexture:obstacleNode.texture
                                               alphaThreshold:0
                                                         size:obstacleNode.size];
    obstacleNode.physicsBody.dynamic = FALSE;
    obstacleNode.physicsBody.categoryBitMask = obstacleCategory;
    obstacleNode.physicsBody.contactTestBitMask = playerCategory;
    obstacleNode.physicsBody.collisionBitMask = 0;
    obstacleNode.physicsBody.usesPreciseCollisionDetection = TRUE;
    
    [self animateObstacle:obstacleNode];
    return obstacleNode;
}

-(void) animateObstacle: (SKSpriteNode*) obs
{
    if (obs == nil)
    {
        obs = (SKSpriteNode*) [SKNode nodeWithFileNamed:@"obstacleNod"];
    }
    //animate it to rotate
    SKAction * anim = [SKAction repeatActionForever:
                    [SKAction rotateByAngle:-M_PI/12  duration:.5]];
    [obs runAction:anim];
}

-(SKSpriteNode*) createPlayerNode
{
    SKSpriteNode* playerNode =
    [[SKSpriteNode alloc] initWithImageNamed:@"Player1.png"];
    
    playerNode.position = CGPointMake(CGRectGetMidX(self.frame),
                                        CGRectGetMidY(self.frame) + 100);
    
    //setup physicsbody
    playerNode.name = @"playerNode";
    playerNode.physicsBody.dynamic = FALSE;
    playerNode.physicsBody = [SKPhysicsBody bodyWithRectangleOfSize:CGSizeMake(20, 20)];
    playerNode.physicsBody.categoryBitMask = playerCategory;
    playerNode.physicsBody.contactTestBitMask = obstacleCategory;
    playerNode.physicsBody.collisionBitMask = 0;
    
    return playerNode;
}

- (void) playerJumped
{
    if (isJumping) return;
    isJumping = TRUE;
    SKSpriteNode* playerNode = (SKSpriteNode*)[self childNodeWithName:@"playerNode"];
    //animate playerNode
    
    if (playerNode != nil)
    {
        SKAction * anim =[SKAction sequence:@[ [SKAction scaleBy:.4 duration:.6],
                                               [SKAction scaleBy:2.5 duration:.6]]];
        //isJumping for disabling collision
        [playerNode runAction:anim completion:^
        {
            isJumping = FALSE;
        }];
    }
    
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
    
    if (isJumping)
    {
        score++;
        [self setScore];
    }
    else if (score < 10)
    {   //player lost
        SKSpriteNode * obstacle = (SKSpriteNode *) [self childNodeWithName:@("obstacleNode")];
        [obstacle removeAllActions]; //stop rotating
        GameTwoViewController * vc = (GameTwoViewController*) viewController;
        [vc displayAlert:self];
        vc = nil;
    }
    else
    {   //player won
        NSLog(@"PLAYERWON");
    }
}

- (void) setScore
{
    SKLabelNode* scoreNode = (SKLabelNode*)[self childNodeWithName:@"scoreNode"];
    scoreNode.text = [NSString stringWithFormat:@"Score: %ld", (long)score];
}

- (void) touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event

{
    [self playerJumped];
}

-(void) restartScene
{
    //reset variable and restart obstacle animation
    score = 0;
    [self setScore];
    isJumping = FALSE;
    SKSpriteNode* obs = (SKSpriteNode*)[self childNodeWithName:@"obstacleNode"];
    obs.zRotation = 0;
    [self animateObstacle:obs];
}


@end

