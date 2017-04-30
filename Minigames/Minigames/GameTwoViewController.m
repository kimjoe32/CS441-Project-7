//
//  GameTwoViewController.m
//  Minigames
//
//  Created by Nicholas Ryan Seney on 4/29/17.
//  Copyright © 2017 Matt Perl, Joe Kim, Matt Spagnoli, Nick Seney. All rights reserved.
//

#import "GameTwoViewController.h"

@implementation GameTwoViewController
@synthesize skView;

-(void) viewWillAppear:(BOOL)animated
{
    if (!skView){
        skView = (SKView*) self.view;
        skView.showsFPS = TRUE;
        skView.showsNodeCount = TRUE;
        GameTwoScene *scene = [[GameTwoScene alloc] initWithSize:CGSizeMake(skView.bounds.size.width,
                                                                        skView.bounds.size.height)];
    
        scene.viewController = self;
    
        [skView presentScene:scene];
    }
}
-(void) viewDidLoad
{
    [super viewDidLoad];
}

- (void) displayAlert:(GameTwoScene *) scene
{
    
    UIAlertController * alert =
    [UIAlertController alertControllerWithTitle:@"Game Over"
                                        message:[NSString stringWithFormat:@"Score: %ld", scene.score]
                                 preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction* restartButton = [UIAlertAction actionWithTitle:@"Restart"
                                                            style:UIAlertActionStyleDefault
                                                          handler:^(UIAlertAction * action)
    {
        [scene restartScene];
    }];
    
    
    UIAlertAction* menuButton = [UIAlertAction actionWithTitle:@"Menu"
                                                         style:UIAlertActionStyleDefault
                                                       handler:^(UIAlertAction * action)
    {
        //go back to main menu
        [scene removeAllActions];
        [scene removeAllChildren];
        
        [self performSegueWithIdentifier:@"mainMenuSegue" sender:self];
        
        if (!skView)
        {
            [skView removeFromSuperview];
            [skView presentScene:nil];
            skView = nil;
        }
    }];
    
    //Add your buttons to alert controller
    
    [alert addAction:restartButton];
    [alert addAction:menuButton];
    
    [self presentViewController:alert animated:TRUE completion:nil];
}




@end
