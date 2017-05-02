//
//  GameScene.m
//  Minigames
//
//  Created by Matt Perl on 4/26/17.
//  Copyright © 2017 Matt Perl, Joe Kim, Matt Spagnoli, Nick Seney. All rights reserved.
//

#import "GameScene.h"

@implementation GameScene {
    
    SKSpriteNode* _backgroundImage;
    SKSpriteNode* _game1;
    SKSpriteNode* _game2;
    SKSpriteNode* _game3;
    SKSpriteNode* _game4;
    SKSpriteNode* _game5;
    SKSpriteNode* _game6;
}

- (void)didMoveToView:(SKView *)view {
    // Setup your scene here
    _backgroundImage = [SKSpriteNode spriteNodeWithImageNamed:@"firstmenuscreen2.png"];
    _backgroundImage.position = CGPointMake(CGRectGetMidX(self.frame),CGRectGetMidY(self.frame));
    _backgroundImage.name = @"BACKGROUND";
    [self addChild:_backgroundImage];
    
    _game1 = [SKSpriteNode spriteNodeWithImageNamed:@"GameOne.png"];
    _game1.position = CGPointMake(90,375);
    _game1.name = @"game1";
    [self addChild:_game1];
    
    _game2 = [SKSpriteNode spriteNodeWithImageNamed:@"GameTwo.png"];
    _game2.position = CGPointMake(200,375);
    _game2.name = @"game2";
    [self addChild:_game2];
    
    _game3 = [SKSpriteNode spriteNodeWithImageNamed:@"GameThree.png"];
    _game3.position = CGPointMake(310,375);
    _game3.name = @"game3";
    [self addChild:_game3];
    
    _game4 = [SKSpriteNode spriteNodeWithImageNamed:@"GameFour.png"];
    _game4.position = CGPointMake(90,315);
    _game4.name = @"game4";
    [self addChild:_game4];
    
    _game5 = [SKSpriteNode spriteNodeWithImageNamed:@"GameFive.png"];
    _game5.position = CGPointMake(200,315);
    _game5.name = @"game5";
    [self addChild:_game5];
    
    _game6 = [SKSpriteNode spriteNodeWithImageNamed:@"GameSix.png"];
    _game6.position = CGPointMake(310,315);
    _game6.name = @"game6";
    [self addChild:_game6];

}


- (void)touchDownAtPoint:(CGPoint)pos {
  
}

- (void)touchMovedToPoint:(CGPoint)pos {
   
}

- (void)touchUpAtPoint:(CGPoint)pos {
  
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    // Run 'Pulse' action from 'Actions.sks'
    UITouch* touch = [touches anyObject];
    CGPoint location = [touch locationInNode:self];
    SKNode *node = [self nodeAtPoint:location];
    
    if ([node.name isEqualToString:@"game1"]) {
        
        [_viewController performSegueWithIdentifier:@"GameOneSegue" sender:nil];
        
    }
    else if([node.name isEqualToString:@"game2"])
    {
        [_viewController performSegueWithIdentifier:@"GameTwoSegue" sender:nil];
    }
    else if([node.name isEqualToString:@"game3"])
    {
        [_viewController performSegueWithIdentifier:@"GameThreeSegue" sender:nil];
    }
    else if([node.name isEqualToString:@"game4"])
    {
        [_viewController performSegueWithIdentifier:@"GameFourSegue" sender:nil];
    }
    else if([node.name isEqualToString:@"game5"])
    {
        [_viewController performSegueWithIdentifier:@"mainSixSegue" sender:nil];
    }
    else if([node.name isEqualToString:@"game6"])
    {
        [_viewController performSegueWithIdentifier:@"mainSevenSegue" sender:nil];
    }
    
    
}
- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event{
    
}
- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {
    
}
- (void)touchesCancelled:(NSSet *)touches withEvent:(UIEvent *)event {
    
}


-(void)update:(CFTimeInterval)currentTime {
    // Called before each frame is rendered
}

@end
