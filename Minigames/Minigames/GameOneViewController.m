//
//  GameOneViewController.m
//  Minigames
//
//  Created by Nicholas Ryan Seney on 4/29/17.
//  Copyright © 2017 Matt Perl, Joe Kim, Matt Spagnoli, Nick Seney. All rights reserved.
//

#import "GameOneViewController.h"

@implementation GameOneViewController


-(void) viewDidLoad
{
    SKView * skView = (SKView*) self.view;
    skView.showsFPS = TRUE;
    skView.showsNodeCount = TRUE;
    
    
    
    FirstGameScene *scene = [[FirstGameScene alloc] initWithSize:CGSizeMake(skView.bounds.size.width,
                                                                   skView.bounds.size.height)];
      NSLog(@"%@",scene);
    scene.viewController = self;
    [skView presentScene:scene];
    
    
    
}


@end
