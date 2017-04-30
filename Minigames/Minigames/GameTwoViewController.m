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
        NSLog(@"%s - (re)creating skView",__PRETTY_FUNCTION__);
        skView = (SKView*) self.view;
        skView.showsFPS = TRUE;
        skView.showsNodeCount = TRUE;
//        [self.view addSubview:skView];
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
            NSLog(@"%s - removing skView",__PRETTY_FUNCTION__);
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
