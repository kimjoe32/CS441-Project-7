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
SKSpriteNode* obstacleNode;
SKSpriteNode* playerNode;
SKSpriteNode* menuButton;
float globalTime;
static const uint32_t playerCategory = 0x1 << 0;
static const uint32_t obstacleCategory = 0x1 << 1;

- (void) didMoveToView:(SKView *)view
{
    if (!sceneCreated)
    {
        globalTime = 0;
        isJumping = FALSE;
        self.backgroundColor = [SKColor colorWithRed:254/255.0 green:209/255.0 blue:0 alpha:1];
        self.scaleMode = SKSceneScaleModeAspectFill;
        [self createGameTwoScene];
        sceneCreated = TRUE;
        self.physicsWorld.gravity = CGVectorMake(0,0);
        self.physicsWorld.contactDelegate = self;
        [self backToMenuButton];
    }
    [self initObjects];
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
    if (obstacleNode == nil)
    {
        obstacleNode = [self createObstacleNode];
    }
    //make player node
    if (playerNode == nil)
    {
        playerNode = [self createPlayerNode];
    }
    
    if (obstacleNode.parent == nil)
    {
        [self addChild:obstacleNode];
        if (![obstacleNode hasActions])
            [obstacleNode removeAllActions];
        
    }
    if (playerNode.parent == nil)
    {
        [self addChild:playerNode];
        if ([playerNode hasActions])
            [playerNode removeAllActions];
    }
}

-(SKSpriteNode*) createObstacleNode
{
    obstacleNode=[[SKSpriteNode alloc] initWithImageNamed:@"Obs1.png"];
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
    
    [self animateObstacle];
    return obstacleNode;
}

-(void) animateObstacle
{
    //animate it to rotate
    SKAction * anim = [SKAction repeatActionForever:
                    [SKAction rotateByAngle:-M_PI  duration:4.5 - globalTime]];
    [obstacleNode runAction:anim];
}

-(SKSpriteNode*) createPlayerNode
{
    playerNode=[[SKSpriteNode alloc] initWithImageNamed:@"Player1.png"];
    
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
    //animate playerNode
    
    if (playerNode != nil)
    {
        SKAction * anim =[SKAction sequence:@[ [SKAction scaleBy:.4 duration:.5],
                                               [SKAction scaleBy:2.5 duration:.5]]];
        //isJumping for disabling collision
        [playerNode runAction:anim
                   completion:^
         {
             isJumping = FALSE;
         }];
    }
    
}

- (void) didBeginContact: (SKPhysicsContact *)contact
{
    if (isJumping)
    {
        score++;
        [self setScore];
        if (score >= 10)
        {
            [obstacleNode removeAllActions]; //stop rotating
            menuButton.position = CGPointMake(CGRectGetMidX(self.frame),CGRectGetMidY(self.frame));
            //player won
            NSLog(@"WIN");
            return;
        }
        globalTime += 0.20;
        [obstacleNode removeAllActions]; //stop rotating
        [self animateObstacle];
    }
    else if (score < 10)
    {   //player lost
        [obstacleNode removeAllActions]; //stop rotating
        GameTwoViewController * vc = (GameTwoViewController*) viewController;
        [vc displayAlert:self];
        vc = nil;
    }
}

- (void) backToMenuButton
{
    if (menuButton == nil)
    {
        menuButton = [SKSpriteNode spriteNodeWithImageNamed:@"MainMenuButton"];
        menuButton.position = CGPointMake(CGRectGetMidX(self.frame),CGRectGetMidY(self.frame) - 225);
        menuButton.name = @"menuButton";//how the node is identified later
        menuButton.zPosition = 1.0;
    }
    [self addChild:menuButton];
}

- (void) setScore
{
    SKLabelNode* scoreNode = (SKLabelNode*)[self childNodeWithName:@"scoreNode"];
    scoreNode.text = [NSString stringWithFormat:@"Score: %ld", (long)score];
}

- (void) touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event

{
    UITouch *touch = [touches anyObject];
    CGPoint location = [touch locationInNode:self];
    SKNode *node = [self nodeAtPoint:location];
    
    //if fire button touched, bring the rain
    if ([node.name isEqualToString:@"menuButton"]) {
        GameTwoViewController * vc = (GameTwoViewController*) viewController;
        [vc backToMenu];
        vc = nil;
        viewController = nil;
        [obstacleNode removeAllActions];
        [self removeAllChildren];
        [self removeAllActions];
    }
    else
    {
        [self playerJumped];
    }
}

-(void) restartScene
{
    //reset variable and restart obstacle animation
    [self initObjects];
    globalTime = 0;
    score = 0;
    [self setScore];
    isJumping = FALSE;
    obstacleNode.zRotation = 0;
    [self animateObstacle];
    menuButton.position = CGPointMake(CGRectGetMidX(self.frame),CGRectGetMidY(self.frame) - 225);
}


@end

