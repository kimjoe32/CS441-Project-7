//
//  GameViewController.m
//  Minigames
//
//  Created by Matt Perl on 4/26/17.
//  Copyright © 2017 Matt Perl, Joe Kim, Matt Spagnoli, Nick Seney. All rights reserved.
//

#import "GameViewController.h"
#import "GameOneViewController.h"
#import "GameScene.h"

@implementation GameViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    SKView * skView = (SKView*) self.view;
    skView.showsFPS = TRUE;
    skView.showsNodeCount = TRUE;
    
    
    
    GameScene *scene = [[GameScene alloc] initWithSize:CGSizeMake(skView.bounds.size.width,
                                                                     skView.bounds.size.height)];
    
    scene.viewController = self;
    [skView presentScene:scene];
    
    
   


}
/*- (IBAction)LoadGameOne:(id)sender {
  [self performSegueWithIdentifier:@"GameOneSegue" sender:nil];
}
- (IBAction)LoadGameTwo:(id)sender {
    [self performSegueWithIdentifier:@"GameTwoSegue" sender:nil];
}
- (IBAction)LoadGameThree:(id)sender {
    [self performSegueWithIdentifier:@"GameThreeSegue" sender:nil];
}
- (IBAction)LoadGameFour:(id)sender {
    [self performSegueWithIdentifier:@"GameFourSegue" sender:nil];
}
- (IBAction)LoadGameFive:(id)sender {
    [self performSegueWithIdentifier:@"GameFiveSegue" sender:nil];
}
- (IBAction)LoadGameSix:(id)sender {
    [self performSegueWithIdentifier:@"GameSixSegue" sender:nil];
}
- (IBAction)LoadGameSeven:(id)sender {
    
    [self performSegueWithIdentifier:@"GameSevenSegue" sender:nil];
}*/

- (BOOL)shouldAutorotate {
    return YES;
}

- (UIInterfaceOrientationMask)supportedInterfaceOrientations {
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
        return UIInterfaceOrientationMaskAllButUpsideDown;
    } else {
        return UIInterfaceOrientationMaskAll;
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}

- (BOOL)prefersStatusBarHidden {
    return YES;
}

@end
