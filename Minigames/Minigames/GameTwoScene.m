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
    
    gameTwoNode.position = CGPointMake(CGRectGetMidX(self.frame), CGRectGetMidY(self.frame));
    
    return gameTwoNode;
}
@end

