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
@synthesize cup1;
@synthesize cup2;
@synthesize cup3;
NSTimeInterval globalTime;
int completedAnimations;

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
    globalTime = 2.0;
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
    
    cup1 = [[SKSpriteNode alloc] initWithImageNamed:@"Cup1.png"];
    cup1.position = CGPointMake(CGRectGetMidX(self.frame) - 100,
                                CGRectGetMidY(self.frame));
    cup1.name = @"cup1";
    
    cup2 = [[SKSpriteNode alloc] initWithImageNamed:@"Cup2.png"];
    cup2.position = CGPointMake(CGRectGetMidX(self.frame),
                                CGRectGetMidY(self.frame));
    cup2.name = @"cup2";
    
    cup3 = [[SKSpriteNode alloc] initWithImageNamed:@"Cup3.png"];
    cup3.position = CGPointMake(CGRectGetMidX(self.frame) + 100,
                                CGRectGetMidY(self.frame));
    cup3.name = @"cup3";
    
    [self addChild:cup1];
    [self addChild:cup2];
    [self addChild:cup3];
}

//the next couple of functions look ridiculous, but remember how hard you tried and how futile it was

- (SKAction *) leftUpMiddle
{
    CGFloat xPosition = CGRectGetMidX(self.frame);
    CGFloat yPosition = CGRectGetMidY(self.frame);
    
    CGMutablePathRef path = CGPathCreateMutable();
    CGPathMoveToPoint(path, NULL,
                      CGRectGetMidX(cup1.frame),
                      CGRectGetMidY(cup1.frame));
    CGPathAddLineToPoint(path, NULL, xPosition-75, yPosition+75);
    CGPathAddLineToPoint(path, NULL, xPosition, yPosition);
    SKAction *followline = [SKAction followPath:path
                                       asOffset:FALSE
                                   orientToPath:NO
                                       duration:globalTime];
    CGPathRelease(path);
    return followline;
}

- (SKAction *) middleDownLeft
{
    CGFloat xPosition = CGRectGetMidX(self.frame);
    CGFloat yPosition = CGRectGetMidY(self.frame);
    
    CGMutablePathRef path = CGPathCreateMutable();
    CGPathMoveToPoint(path, NULL,
                      CGRectGetMidX(cup2.frame),
                      CGRectGetMidY(cup2.frame));
    CGPathAddLineToPoint(path, NULL, xPosition-75, yPosition-75);
    CGPathAddLineToPoint(path, NULL, xPosition-100, yPosition);
    SKAction *followline = [SKAction followPath:path
                                       asOffset:FALSE
                                   orientToPath:NO
                                       duration:globalTime];
    CGPathRelease(path);
    return followline;
}

- (SKAction *) leftUpRight
{
    CGFloat xPosition = CGRectGetMidX(self.frame);
    CGFloat yPosition = CGRectGetMidY(self.frame);
    
    CGMutablePathRef path = CGPathCreateMutable();
    CGPathMoveToPoint(path, NULL,
                      CGRectGetMidX(cup1.frame),
                      CGRectGetMidY(cup1.frame));
    CGPathAddLineToPoint(path, NULL, xPosition-75, yPosition+75);
    CGPathAddLineToPoint(path, NULL, xPosition+75, yPosition+75);
    CGPathAddLineToPoint(path, NULL, xPosition+100, yPosition);
    SKAction *followline = [SKAction followPath:path
                                       asOffset:FALSE
                                   orientToPath:NO
                                       duration:globalTime];
    CGPathRelease(path);
    return followline;
}

- (SKAction *) rightDownLeft
{
    CGFloat xPosition = CGRectGetMidX(self.frame);
    CGFloat yPosition = CGRectGetMidY(self.frame);
    
    CGMutablePathRef path = CGPathCreateMutable();
    CGPathMoveToPoint(path, NULL,
                      CGRectGetMidX(cup3.frame),
                      CGRectGetMidY(cup3.frame));
    CGPathAddLineToPoint(path, NULL, xPosition+75, yPosition-75);
    CGPathAddLineToPoint(path, NULL, xPosition-75, yPosition-75);
    CGPathAddLineToPoint(path, NULL, xPosition-100, yPosition);
    SKAction *followline = [SKAction followPath:path
                                       asOffset:FALSE
                                   orientToPath:NO
                                       duration:globalTime];
    CGPathRelease(path);
    return followline;
}

- (SKAction *) middleUpRight
{
    CGFloat xPosition = CGRectGetMidX(self.frame);
    CGFloat yPosition = CGRectGetMidY(self.frame);
    
    CGMutablePathRef path = CGPathCreateMutable();
    CGPathMoveToPoint(path, NULL,
                      CGRectGetMidX(cup2.frame),
                      CGRectGetMidY(cup2.frame));
    CGPathAddLineToPoint(path, NULL, xPosition+75, yPosition+75);
    CGPathAddLineToPoint(path, NULL, xPosition+100, yPosition);
    SKAction *followline = [SKAction followPath:path
                                       asOffset:FALSE
                                   orientToPath:NO
                                       duration:globalTime];
    CGPathRelease(path);
    return followline;
}

- (SKAction *) rightDownMiddle
{
    CGFloat xPosition = CGRectGetMidX(self.frame);
    CGFloat yPosition = CGRectGetMidY(self.frame);
    
    CGMutablePathRef path = CGPathCreateMutable();
    CGPathMoveToPoint(path, NULL,
                      CGRectGetMidX(cup3.frame),
                      CGRectGetMidY(cup3.frame));
    CGPathAddLineToPoint(path, NULL, xPosition+75, yPosition-75);
    CGPathAddLineToPoint(path, NULL, xPosition, yPosition);
    SKAction *followline = [SKAction followPath:path
                                       asOffset:FALSE
                                   orientToPath:NO
                                       duration:globalTime];
    CGPathRelease(path);
    return followline;
}

- (SKAction *) middleDownRight
{
    CGFloat xPosition = CGRectGetMidX(self.frame);
    CGFloat yPosition = CGRectGetMidY(self.frame);
    
    CGMutablePathRef path = CGPathCreateMutable();
    CGPathMoveToPoint(path, NULL,
                      CGRectGetMidX(cup2.frame),
                      CGRectGetMidY(cup2.frame));
    CGPathAddLineToPoint(path, NULL, xPosition+75, yPosition-75);
    CGPathAddLineToPoint(path, NULL, xPosition+100, yPosition);
    SKAction *followline = [SKAction followPath:path
                                       asOffset:FALSE
                                   orientToPath:NO
                                       duration:globalTime];
    CGPathRelease(path);
    return followline;
}

- (SKAction *) rightUpMiddle
{
    CGFloat xPosition = CGRectGetMidX(self.frame);
    CGFloat yPosition = CGRectGetMidY(self.frame);
    
    CGMutablePathRef path = CGPathCreateMutable();
    CGPathMoveToPoint(path, NULL,
                      CGRectGetMidX(cup3.frame),
                      CGRectGetMidY(cup3.frame));
    CGPathAddLineToPoint(path, NULL, xPosition+75, yPosition+75);
    CGPathAddLineToPoint(path, NULL, xPosition, yPosition);
    SKAction *followline = [SKAction followPath:path
                                       asOffset:FALSE
                                   orientToPath:NO
                                       duration:globalTime];
    CGPathRelease(path);
    return followline;
}

- (SKAction *) leftDownRight
{
    CGFloat xPosition = CGRectGetMidX(self.frame);
    CGFloat yPosition = CGRectGetMidY(self.frame);
    
    CGMutablePathRef path = CGPathCreateMutable();
    CGPathMoveToPoint(path, NULL,
                      CGRectGetMidX(cup1.frame),
                      CGRectGetMidY(cup1.frame));
    CGPathAddLineToPoint(path, NULL, xPosition-75, yPosition-75);
    CGPathAddLineToPoint(path, NULL, xPosition+75, yPosition-75);
    CGPathAddLineToPoint(path, NULL, xPosition+100, yPosition);
    SKAction *followline = [SKAction followPath:path
                                       asOffset:FALSE
                                   orientToPath:NO
                                       duration:globalTime];
    CGPathRelease(path);
    return followline;
}

- (SKAction *) rightUpLeft
{
    CGFloat xPosition = CGRectGetMidX(self.frame);
    CGFloat yPosition = CGRectGetMidY(self.frame);
    
    CGMutablePathRef path = CGPathCreateMutable();
    CGPathMoveToPoint(path, NULL,
                      CGRectGetMidX(cup3.frame),
                      CGRectGetMidY(cup3.frame));
    CGPathAddLineToPoint(path, NULL, xPosition+75, yPosition+75);
    CGPathAddLineToPoint(path, NULL, xPosition-75, yPosition+75);
    CGPathAddLineToPoint(path, NULL, xPosition-100, yPosition);
    SKAction *followline = [SKAction followPath:path
                                       asOffset:FALSE orientToPath:NO duration:globalTime];
    CGPathRelease(path);
    return followline;
}

- (SKAction *) leftDownMiddle
{
    CGFloat xPosition = CGRectGetMidX(self.frame);
    CGFloat yPosition = CGRectGetMidY(self.frame);
    
    CGMutablePathRef path = CGPathCreateMutable();
    CGPathMoveToPoint(path, NULL,
                      CGRectGetMidX(cup1.frame),
                      CGRectGetMidY(cup1.frame));
    CGPathAddLineToPoint(path, NULL, xPosition-75, yPosition-75);
    CGPathAddLineToPoint(path, NULL, xPosition, yPosition);
    SKAction *followline = [SKAction followPath:path
                                       asOffset:FALSE
                                   orientToPath:NO
                                       duration:globalTime];
    CGPathRelease(path);
    return followline;
}

- (SKAction *) middleUpLeft
{
    CGFloat xPosition = CGRectGetMidX(self.frame);
    CGFloat yPosition = CGRectGetMidY(self.frame);
    
    CGMutablePathRef path = CGPathCreateMutable();
    CGPathMoveToPoint(path, NULL,
                      CGRectGetMidX(cup2.frame),
                      CGRectGetMidY(cup2.frame));
    CGPathAddLineToPoint(path, NULL, xPosition-75, yPosition+75);
    CGPathAddLineToPoint(path, NULL, xPosition-100, yPosition);
    SKAction *followline = [SKAction followPath:path
                                       asOffset:FALSE
                                   orientToPath:NO
                                       duration:globalTime];
    CGPathRelease(path);
    return followline;
}

-(void) swap: (SKSpriteNode *) sk1 sk2: (SKSpriteNode*) sk2
{
    CGPoint temp = sk1.position;
    sk1.position = sk2.position;
    sk2.position = temp;
    
    if ([sk1.name isEqualToString: @"c"])
    {
        sk2.name = @"c";
        sk1.name = @"";
    }
    else if ([sk2.name isEqualToString: @"c"])
    {
        sk1.name = @"c";
        sk2.name = @"";
    }
}

- (void) resetCups
{
    if (CGRectGetMidX(cup2.frame) < CGRectGetMidX(self.frame))
        [self swap:cup1 sk2:cup2];
    if (CGRectGetMidX(cup3.frame) < CGRectGetMidX(self.frame))
        [self swap:cup1 sk2:cup3];
    
    if (CGRectGetMidX(cup1.frame) == CGRectGetMidX(self.frame))
        [self swap:cup2 sk2:cup1];
    if (CGRectGetMidX(cup3.frame) == CGRectGetMidX(self.frame))
        [self swap:cup2 sk2:cup3];
    
    if (CGRectGetMidX(cup1.frame) > CGRectGetMidX(self.frame))
        [self swap:cup3 sk2:cup1];
    if (CGRectGetMidX(cup2.frame) > CGRectGetMidX(self.frame))
        [self swap:cup3 sk2:cup2];
    
    CGPoint pos = cup1.position;
    pos = CGPointMake( CGRectGetMidX(self.frame) - 100, CGRectGetMidY(self.frame));
    cup1.position = pos;
    
    pos = cup2.position;
    pos = CGPointMake( CGRectGetMidX(self.frame), CGRectGetMidY(self.frame));
    cup2.position = pos;
    
    pos = cup3.position;
    pos = CGPointMake( CGRectGetMidX(self.frame) + 100, CGRectGetMidY(self.frame));
    cup3.position = pos;
}

- (void) doRandomSwap
{
    NSMutableArray *cup1Sequence = [[NSMutableArray alloc] init];
    NSMutableArray *cup2Sequence = [[NSMutableArray alloc] init];
    NSMutableArray *cup3Sequence = [[NSMutableArray alloc] init];
    for (int i =0; i < 10; i++)
    {
        switch (arc4random_uniform(5))
        {
            default://swap 1 and 2
            {
//                NSLog(@"swap 1 and 2");
                [cup1Sequence addObject:[self leftUpMiddle]];
                [cup2Sequence addObject:[self middleDownLeft]];
                
                [cup3Sequence addObject:[SKAction waitForDuration:globalTime]];
                break;
            }
            case 1: //swap 1 and 3
            {
//                NSLog(@"swap 1 and 3");
                [cup1Sequence addObject:[self leftUpRight]];
                [cup3Sequence addObject:[self rightDownLeft]];
                
                [cup2Sequence addObject:[SKAction waitForDuration:globalTime]];
                break;
            }
            case 2://swap 2 and 3
            {
//                NSLog(@"swap 2 and 3");
                [cup2Sequence addObject:[self middleUpRight]];
                [cup3Sequence addObject:[self rightDownMiddle]];
                
                [cup1Sequence addObject:[SKAction waitForDuration:globalTime]];
                break;
            }
            case 3://swap 2 and 3 alternate
            {
//                NSLog(@"swap 2 and 3 alt");
                [cup2Sequence addObject:[self middleDownRight]];
                [cup3Sequence addObject:[self rightUpMiddle]];
                
                [cup1Sequence addObject:[SKAction waitForDuration:globalTime]];
                break;
            }
            case 4://swap 1 and 3 alternate
            {
//                NSLog(@"swap 1 and 3 alt");
                [cup1Sequence addObject:[self leftDownRight]];
                [cup3Sequence addObject:[self rightUpLeft]];
                
                [cup2Sequence addObject:[SKAction waitForDuration:globalTime]];
                break;
            }
            case 5://swap 1 and 2 alternate
            {
//                NSLog(@"swap 1 and 2 alt");
                [cup1Sequence addObject:[self leftDownMiddle]];
                [cup2Sequence addObject:[self middleUpLeft]];
                
                [cup3Sequence addObject:[SKAction waitForDuration:globalTime]];
                break;
            }
        }
    }
    
    NSMutableArray * seq =[[NSMutableArray alloc] init];
    
    for (int i =0; i < 10; i++)
    {
        SKAction * set =
        [SKAction group:@[
                                            [SKAction runBlock:^{
                                                [cup1 runAction:[cup1Sequence objectAtIndex:i]
                                                     completion:^{
                                                         completedAnimations++;
                                                         [self finishedAnimations];
                                                     }];
                                            }],
                                            [SKAction runBlock:^{
                                                [cup2 runAction:[cup2Sequence objectAtIndex:i]
                                                     completion:^{
                                                         completedAnimations++;
                                                         [self finishedAnimations];
                                                     }];
                                            }],
                                            [SKAction runBlock:^{
                                                [cup3 runAction:[cup3Sequence objectAtIndex:i]
                                                     completion:^{
                                                         completedAnimations++;
                                                         [self finishedAnimations];
                                                     }];
                                            }]
                                            ]];
        [seq addObject:set];
    }
    SKAction *s = [SKAction sequence: @[[seq objectAtIndex:0],
                                        [seq objectAtIndex:1],
                                        [seq objectAtIndex:2],
                                        [seq objectAtIndex:3],
                                        [seq objectAtIndex:4],
                                        [seq objectAtIndex:5],
                                        [seq objectAtIndex:6],
                                        [seq objectAtIndex:7],
                                        [seq objectAtIndex:8],
                                        [seq objectAtIndex:9]]];
    [self runAction:s completion:^{
        [self setUserInteractionEnabled:TRUE];
    }];
}

- (void) finishedAnimations
{
    if (completedAnimations >= 3)
    {
        [self resetCups];
        completedAnimations = 0;
    }
}

- (void) startShuffling
{
    [self doRandomSwap];
}

- (void) touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [self setUserInteractionEnabled:FALSE];
    [self startShuffling];
}

-(void) restartScene
{
    globalTime = 1.0;
}

@end
