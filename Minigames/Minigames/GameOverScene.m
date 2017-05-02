//
//  GameOverScene.m
//  Minigames
//
//  Created by Nicholas Ryan Seney on 5/1/17.
//  Copyright © 2017 Matt Perl, Joe Kim, Matt Spagnoli, Nick Seney. All rights reserved.
//

#import "GameOverScene.h"

@implementation GameOverScene
{
    bool sceneCreated;
    SKSpriteNode* continueButton;
    SKSpriteNode* menuButton;
    SKLabelNode* gameover;
}

- (void) didMoveToView:(SKView *)view
{
    if (!self->sceneCreated)
    {
        self.backgroundColor = [SKColor whiteColor];
        self.scaleMode = SKSceneScaleModeAspectFill;
        continueButton = [SKSpriteNode spriteNodeWithImageNamed:@"tryagain_button.png"];
        continueButton.name = @"continueButton";
        [continueButton setPosition:(CGPointMake(215,350))];
        menuButton = [SKSpriteNode spriteNodeWithImageNamed:@"menubutton.png"];
        menuButton.name = @"menuButton";
        [menuButton setPosition:(CGPointMake(215,275))];
        
        gameover = [[SKLabelNode alloc] init];
        gameover.text = @"Game Over!";
        gameover.fontColor = [UIColor blackColor];
        gameover.fontSize = 45;
        [gameover setPosition:(CGPointMake(215,450))];
        
        [self addChild:menuButton];
        [self addChild:continueButton];
        [self addChild:gameover];
        self->sceneCreated = TRUE;
    }
    
}


- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    
    UITouch* touch = [touches anyObject];
    CGPoint location = [touch locationInNode:self];
    SKNode *node = [self nodeAtPoint:location];
    
    //if fire button touched, bring the rain
    if ([node.name isEqualToString:@"continueButton"]) {
        
        SKView * skView = (SKView*) self.view;
        skView.showsFPS = TRUE;
        skView.showsNodeCount = TRUE;
        
        
        
        FirstGameScene *scene = [[FirstGameScene alloc] initWithSize:CGSizeMake(skView.bounds.size.width,
                                                                                
                                                                                skView.bounds.size.height)];
        
        scene.viewController = _viewController;
        NSLog(@"%@",scene);
        [skView presentScene:scene];
        
    }
    else if([node.name isEqualToString:@"menuButton"])
    {
        [_viewController performSegueWithIdentifier:@"mainMenuSegue" sender:nil];
    }
    
    
}

@end
