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
bool button2Matched = false;
bool button3Matched = false;
bool button4Matched = false;
bool button5Matched = false;
bool button6Matched = false;

int currentScore = 0;
int numMatches = 0;

int but1Ind1;
int but1Ind2;
int but2Ind1;
int but2Ind2;
int but3Ind1;
int but3Ind2;
int but4Ind1;
int but4Ind2;
int but5Ind1;
int but5Ind2;
int but6Ind1;
int but6Ind2;

UIImage *tmpImg;

@implementation GameFourViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self initializeGrid];
}

- (void) initializeGrid{
    [_remainingTriesField setText:@"5"];
    numMatches = 0;
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

- (void) setButtonImage:(int) intid :(int) ind1 :(int) ind2{
    
    switch(intid){
        case 0:
            tmpImg = [UIImage imageNamed:@"2S.png"];
            [[_GridButtons objectAtIndex:(ind1*6+ind2)] setBackgroundImage:tmpImg forState:UIControlStateNormal];
            break;
        case 1:
            tmpImg = [UIImage imageNamed:@"TS.png"];
            [[_GridButtons objectAtIndex:(ind1*6+ind2)] setBackgroundImage:tmpImg forState:UIControlStateNormal];
            break;
        case 2:
            tmpImg = [UIImage imageNamed:@"JS.png"];
            [[_GridButtons objectAtIndex:(ind1*6+ind2)] setBackgroundImage:tmpImg forState:UIControlStateNormal];
            break;
        case 3:
            tmpImg = [UIImage imageNamed:@"QS.png"];
            [[_GridButtons objectAtIndex:(ind1*6+ind2)] setBackgroundImage:tmpImg forState:UIControlStateNormal];
            break;
        case 4:
            tmpImg = [UIImage imageNamed:@"KS.png"];
            [[_GridButtons objectAtIndex:(ind1*6+ind2)] setBackgroundImage:tmpImg forState:UIControlStateNormal];
            break;
        case 5:
            tmpImg = [UIImage imageNamed:@"AS.png"];
            [[_GridButtons objectAtIndex:(ind1*6+ind2)] setBackgroundImage:tmpImg forState:UIControlStateNormal];
            break;
    }
}

- (void) decrementTries{
    int numTries = [[_remainingTriesField text] intValue];
    
    if(numTries ){
        
    }
    
}



- (IBAction) matchButtonPressed:(id) sender{
    
    switch(buttonClicks){
        case 0:
            _firstButtonPressed = sender;
            
            but1Ind1 = [_firstButtonPressed.currentTitle characterAtIndex:0]-48;
            but1Ind2 = [_firstButtonPressed.currentTitle characterAtIndex:1]-48;
            
            [self setButtonImage:gridMap[but1Ind1][but1Ind2] :but1Ind1 :but1Ind2];
            
            buttonClicks++;
            break;
        case 1:
            _secondButtonPressed = sender;
            
            but2Ind1 = [_secondButtonPressed.currentTitle characterAtIndex:0]-48;
            but2Ind2 = [_secondButtonPressed.currentTitle characterAtIndex:1]-48;
            
            if(_firstButtonPressed != _secondButtonPressed
               && gridMap[but1Ind1][but1Ind2] == gridMap[but2Ind1][but2Ind2]){
                
                [self setButtonImage:gridMap[but2Ind1][but2Ind2] :but2Ind1 :but2Ind2];
                buttonClicks++;
                button2Matched = true;
            }
            else{
                buttonClicks = 0;
                tmpImg = [UIImage imageNamed:@"questionMarkCardImg.jpg"];
                [[_GridButtons objectAtIndex:(but1Ind1*6+but1Ind2)] setBackgroundImage:tmpImg forState:UIControlStateNormal];
                [[_GridButtons objectAtIndex:(but2Ind1*6+but2Ind2)] setBackgroundImage:tmpImg forState:UIControlStateNormal];
            }
            
            break;
        case 2:
            _thirdButtonPressed = sender;
            
            but3Ind1 = [_thirdButtonPressed.currentTitle characterAtIndex:0]-48;
            but3Ind2 = [_thirdButtonPressed.currentTitle characterAtIndex:1]-48;
            
            if(button2Matched == true
               && gridMap[but1Ind1][but1Ind2] == gridMap[but3Ind1][but3Ind2]){
                
                [self setButtonImage:gridMap[but3Ind1][but3Ind2] :but3Ind1 :but3Ind2];
                buttonClicks++;
                button3Matched = true;
            }
            else{
                buttonClicks = 0;
                button2Matched = false;
                tmpImg = [UIImage imageNamed:@"questionMarkCardImg.jpg"];
                [[_GridButtons objectAtIndex:(but1Ind1*6+but1Ind2)] setBackgroundImage:tmpImg forState:UIControlStateNormal];
                [[_GridButtons objectAtIndex:(but2Ind1*6+but2Ind2)] setBackgroundImage:tmpImg forState:UIControlStateNormal];
                [[_GridButtons objectAtIndex:(but3Ind1*6+but3Ind2)] setBackgroundImage:tmpImg forState:UIControlStateNormal];
            }
            
            break;
        case 3:
            _fourthButtonPressed = sender;
            
            but4Ind1 = [_fourthButtonPressed.currentTitle characterAtIndex:0]-48;
            but4Ind2 = [_fourthButtonPressed.currentTitle characterAtIndex:1]-48;
            
            if(button3Matched == true
               && gridMap[but1Ind1][but1Ind2] == gridMap[but4Ind1][but4Ind2]){
                
                [self setButtonImage:gridMap[but4Ind1][but4Ind2] :but4Ind1 :but4Ind2];
                buttonClicks++;
                button4Matched = true;
            }
            else{
                buttonClicks = 0;
                button2Matched = false;
                button3Matched = false;
                tmpImg = [UIImage imageNamed:@"questionMarkCardImg.jpg"];
                [[_GridButtons objectAtIndex:(but1Ind1*6+but1Ind2)] setBackgroundImage:tmpImg forState:UIControlStateNormal];
                [[_GridButtons objectAtIndex:(but2Ind1*6+but2Ind2)] setBackgroundImage:tmpImg forState:UIControlStateNormal];
                [[_GridButtons objectAtIndex:(but3Ind1*6+but3Ind2)] setBackgroundImage:tmpImg forState:UIControlStateNormal];
                [[_GridButtons objectAtIndex:(but4Ind1*6+but4Ind2)] setBackgroundImage:tmpImg forState:UIControlStateNormal];
            }
            break;
        case 4:
            _fifthButtonPressed = sender;
            
            but5Ind1 = [_fifthButtonPressed.currentTitle characterAtIndex:0]-48;
            but5Ind2 = [_fifthButtonPressed.currentTitle characterAtIndex:1]-48;
            
            if(button4Matched == true
               && gridMap[but1Ind1][but1Ind2] == gridMap[but5Ind1][but5Ind2]){
                
                [self setButtonImage:gridMap[but5Ind1][but5Ind2] :but5Ind1 :but5Ind2];
                buttonClicks++;
                button5Matched = true;
            }
            else{
                buttonClicks = 0;
                button2Matched = false;
                button3Matched = false;
                button4Matched = false;
                tmpImg = [UIImage imageNamed:@"questionMarkCardImg.jpg"];
                [[_GridButtons objectAtIndex:(but1Ind1*6+but1Ind2)] setBackgroundImage:tmpImg forState:UIControlStateNormal];
                [[_GridButtons objectAtIndex:(but2Ind1*6+but2Ind2)] setBackgroundImage:tmpImg forState:UIControlStateNormal];
                [[_GridButtons objectAtIndex:(but3Ind1*6+but3Ind2)] setBackgroundImage:tmpImg forState:UIControlStateNormal];
                [[_GridButtons objectAtIndex:(but4Ind1*6+but4Ind2)] setBackgroundImage:tmpImg forState:UIControlStateNormal];
                [[_GridButtons objectAtIndex:(but5Ind1*6+but5Ind2)] setBackgroundImage:tmpImg forState:UIControlStateNormal];
            }
            break;
        case 5:
            _sixthButtonPressed = sender;
            
            but6Ind1 = [_sixthButtonPressed.currentTitle characterAtIndex:0]-48;
            but6Ind2 = [_sixthButtonPressed.currentTitle characterAtIndex:1]-48;
            
            if(button5Matched == true
               && gridMap[but1Ind1][but1Ind2] == gridMap[but6Ind1][but6Ind2]){
                
                [self setButtonImage:gridMap[but6Ind1][but6Ind2] :but6Ind1 :but6Ind2];
                buttonClicks++;
                button6Matched = true;
            }
            else{
                buttonClicks = 0;
                button2Matched = false;
                button3Matched = false;
                button4Matched = false;
                button5Matched = false;
                tmpImg = [UIImage imageNamed:@"questionMarkCardImg.jpg"];
                [[_GridButtons objectAtIndex:(but1Ind1*6+but1Ind2)] setBackgroundImage:tmpImg forState:UIControlStateNormal];
                [[_GridButtons objectAtIndex:(but2Ind1*6+but2Ind2)] setBackgroundImage:tmpImg forState:UIControlStateNormal];
                [[_GridButtons objectAtIndex:(but3Ind1*6+but3Ind2)] setBackgroundImage:tmpImg forState:UIControlStateNormal];
                [[_GridButtons objectAtIndex:(but4Ind1*6+but4Ind2)] setBackgroundImage:tmpImg forState:UIControlStateNormal];
                [[_GridButtons objectAtIndex:(but5Ind1*6+but5Ind2)] setBackgroundImage:tmpImg forState:UIControlStateNormal];
                [[_GridButtons objectAtIndex:(but6Ind1*6+but6Ind2)] setBackgroundImage:tmpImg forState:UIControlStateNormal];
            }
            break;
    }
    
    if(button6Matched == true && numMatches == 6){
        //add to current score for all matches
        buttonClicks = 0;
        button2Matched = false;
        button3Matched = false;
        button4Matched = false;
        button5Matched = false;
        button6Matched = false;
        numMatches = 0;
        //reset game
        
    }
    else if(button6Matched == true){
        //add to current score for 1 match
        buttonClicks = 0;
        button2Matched = false;
        button3Matched = false;
        button4Matched = false;
        button5Matched = false;
        button6Matched = false;
        numMatches++;
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
