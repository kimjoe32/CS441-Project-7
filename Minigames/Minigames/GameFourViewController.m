//
//  GameFourViewController.m
//  Minigames
//
//  Created by Nicholas Ryan Seney on 4/29/17.
//  Copyright © 2017 Matt Perl, Joe Kim, Matt Spagnoli, Nick Seney. All rights reserved.
//

#import "GameFourViewController.h"

@interface GameFourViewController ()

@end

int gridMap[6][6] = {{-1, -1, -1, -1, -1, -1},
    {-1, -1, -1, -1, -1, -1},
    {-1, -1, -1, -1, -1, -1},
    {-1, -1, -1, -1, -1, -1},
    {-1, -1, -1, -1, -1, -1},
    {-1, -1, -1, -1, -1, -1}};

int buttonClicks = 0;
bool button1Matched = false;
bool button2Matched = false;
bool button3Matched = false;
bool button4Matched = false;
bool button5Matched = false;
bool button6Matched = false;

int currentScore = 0;

@implementation GameFourViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self initializeGrid];
}

- (void) initializeGrid{
    int num2Imgs = 0;
    int num10Imgs = 0;
    int numJackImgs = 0;
    int numQueenImgs = 0;
    int numKingImgs = 0;
    int numAceImgs = 0;
    
    int randSeed;
    int gridInd1;
    int gridInd2;
    int counter = 0;
    
    bool loopBreak = false;
    while(loopBreak == false){
        
        if(counter < 6){
            gridInd1 = 0;
        }
        else if(counter < 12){
            gridInd1 = 1;
        }
        else if(counter < 18){
            gridInd1 = 2;
        }
        else if(counter < 24){
            gridInd1 = 3;
        }
        else if(counter < 30){
            gridInd1 = 4;
        }
        else{
            gridInd1 = 5;
        }
        gridInd2 = counter%6;
        
        randSeed = arc4random_uniform(6);
        switch(randSeed){
            case 0: //2 img
                if(num2Imgs < 6){
                    gridMap[gridInd1][gridInd2] = 0;
                    num2Imgs++;
                    counter++;
                }
                break;
            case 1: //10 img
                if(num10Imgs < 6){
                    gridMap[gridInd1][gridInd2] = 1;
                    num10Imgs++;
                    counter++;
                }
                break;
            case 2: //Jack img
                if(numJackImgs < 6){
                    gridMap[gridInd1][gridInd2] = 2;
                    numJackImgs++;
                    counter++;
                }
                break;
            case 3: //Queen img
                if(numQueenImgs < 6){
                    gridMap[gridInd1][gridInd2] = 3;
                    numQueenImgs++;
                    counter++;
                }
                break;
            case 4: //King img
                if(numKingImgs < 6){
                    gridMap[gridInd1][gridInd2] = 4;
                    numKingImgs++;
                    counter++;
                }
                break;
            case 5: //Ace img
                if(numAceImgs < 6){
                    gridMap[gridInd1][gridInd2] = 5;
                    numAceImgs++;
                    counter++;
                }
                break;
        }
        if(num2Imgs == 6 && num10Imgs == 6 && numJackImgs == 6 && numQueenImgs == 6 && numKingImgs == 6 && numAceImgs == 6){
            loopBreak = true;
        }
    }
    
    for(int i = 0; i < 6; i++){
        for(int j = 0; j < 6; j++){
            printf("%d", gridMap[i][j]);
        }
        printf("\n");
    }
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */

@end
