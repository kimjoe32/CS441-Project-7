
#import "FirstGameScene.h"


@implementation FirstGameScene
{
    
    NSMutableArray* spikes;
    bool sceneCreated;
    int index;
    SKTexture* idlePlayer;
    SKTexture* playerjump;
    SKSpriteNode* player;
    SKAction* jump;
   // SKLabelNode* dodged;
    bool touching;
    int stupidCollisionCounter;
    float x;
    
}
static const uint32_t playerCategory  = 0x1 << 0;
static const uint32_t spikeCategory = 0x1 << 1;



- (void) didMoveToView:(SKView *)view
{
    if (!self->sceneCreated)
    {
        self.backgroundColor = [SKColor whiteColor];
        self.scaleMode = SKSceneScaleModeAspectFill;
        [self createGameScene];
        self->sceneCreated = TRUE;
    }
    
}

-(void) createGameScene
{
  
    index = 0;
    x = 1;
    stupidCollisionCounter = 0;
    self.physicsWorld.contactDelegate = self;
    self.physicsWorld.gravity = CGVectorMake(0.0,-2.0);
    
   /* dodged = [[SKLabelNode alloc] init];
    [dodged setPosition:(CGPointMake(self.size.width-20,self.size.height))];
    dodged.text = @"Dodged: 0";
    dodged.fontColor = [UIColor blackColor];
    dodged.fontSize = 12;
    [dodged setPosition:(CGPointMake(150,250))];*/
    
    SKPhysicsBody* gameBorderbody = [SKPhysicsBody bodyWithEdgeLoopFromRect:self.frame];
    self.physicsBody = gameBorderbody;
    self.physicsBody.friction = 1.0f;
    
    
    idlePlayer = [SKTexture textureWithImageNamed:@"gameOnePlayer.png"];
    playerjump = [SKTexture textureWithImageNamed:@"jump.png"];
    player = [SKSpriteNode spriteNodeWithTexture:idlePlayer];
    player.physicsBody = [SKPhysicsBody bodyWithRectangleOfSize:player.size];
    jump = [SKAction animateWithTextures:@[playerjump, idlePlayer] timePerFrame:.75];
    player.position = CGPointMake(250, 40);
    
    player.physicsBody.categoryBitMask = playerCategory;
    player.physicsBody.contactTestBitMask = spikeCategory;
    player.physicsBody.collisionBitMask = spikeCategory;
    
    
    spikes = [[NSMutableArray alloc] init];
    for(int i=0;i<1000;i++)
    {
        SKSpriteNode* spike = [SKSpriteNode spriteNodeWithImageNamed:@"spikeE.png"];
        spike.physicsBody = [SKPhysicsBody bodyWithRectangleOfSize:spike.size];
        spike.position = CGPointMake(self.size.width-((int)arc4random()%(int)self.size.width),self.size.height+5);
        spike.physicsBody.categoryBitMask = spikeCategory;
        spike.physicsBody.contactTestBitMask = playerCategory;
        
        spike.physicsBody.collisionBitMask = 0;
        [spikes addObject:spike];
    }
    [self update];
    [self addChild:player];
  // [self addChild:dodged];
    [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(update) userInfo:nil repeats:true];
    [NSTimer scheduledTimerWithTimeInterval:3 target:self selector:@selector(update) userInfo:nil repeats:true];
    [NSTimer scheduledTimerWithTimeInterval:6 target:self selector:@selector(update2) userInfo:nil repeats:true];
    
}



- (void)didBeginContact:(SKPhysicsContact *)contact
{
    
    SKPhysicsBody *playerBody, *chargeBody;
    
    if (contact.bodyA.categoryBitMask < contact.bodyB.categoryBitMask)
    {
        playerBody = contact.bodyA;
        chargeBody = contact.bodyB;
    }
    else
    {
        playerBody = contact.bodyB;
        chargeBody = contact.bodyA;
    }
    
    if ((playerBody.categoryBitMask & playerCategory) !=0 && (chargeBody.categoryBitMask & spikeCategory) !=0)
    {
        
        if(stupidCollisionCounter > 1)
        {
            SKView * skView = (SKView*) self.view;
            skView.showsFPS = TRUE;
            skView.showsNodeCount = TRUE;
            
            
            
            GameOverScene *scene = [[GameOverScene alloc] initWithSize:CGSizeMake(skView.bounds.size.width,
                                                                             skView.bounds.size.height)];
            NSLog(@"%@",scene);
            scene.viewController = self.viewController;
            [skView presentScene:scene];
        }
        stupidCollisionCounter ++;
     
    }
   
}

-(void) touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    touching = false;
    
}


- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    NSArray *touchesArray = [touches allObjects];
    touching = true;
    for(int i=0; i<[touchesArray count]; i++)
    {
        UITouch *touch = (UITouch *)[touchesArray objectAtIndex:i];
        CGPoint point = [touch locationInView:nil];
        
        if(point.x > 212)
        {
            //CGPoint newPos = CGPointMake(player.position.x, player.position.y+40);
           // [player runAction:jump];
            //player.position = newPos;
            dispatch_async(dispatch_get_main_queue(), ^{
                [self performSelector:@selector(left) withObject:nil afterDelay:.0];
            });
            
        }
        else
        {
            //CGPoint newPos = CGPointMake(player.position.x, player.position.y+40);
            //[player runAction:jump];
            //player.position = newPos;
            
            dispatch_async(dispatch_get_main_queue(), ^{
                [self performSelector:@selector(right) withObject:nil afterDelay:.0];
            });
        }
    }
    
}

-(void) left
{
    if(touching)
    {
        CGPoint newPos = CGPointMake(player.position.x+2.5, player.position.y);
        player.position = newPos;
        [self performSelector:@selector(left) withObject:nil afterDelay:0.01];
    }
}

-(void) right
{
    if(touching)
    {
        CGPoint newPos = CGPointMake(player.position.x-2.5, player.position.y);
        player.position = newPos;
         [self performSelector:@selector(right) withObject:nil afterDelay:0.01];
    }
}

-(void) update
{
    
    if(index%40 == 0)
    {
        self.physicsWorld.gravity = CGVectorMake(0.0,-2.0-x);
        x+=1.25;
    }
    
    if(index%3 == 0 && index < 1000)
    {
        [self addChild:spikes[index]];
        index++;
    }
    
    while(index % 3 != 0 && index < 1000)
    {
        [self addChild:spikes[index]];
        index++;
        
    }
   // dodged.text = [NSString stringWithFormat:@"Dodged: %d",index];
    
}
-(void) update2
{
    if(index%5 == 0 && index < 1000)
    {
        [self addChild:spikes[index]];
        index++;
    }
    
    while(index % 5 != 0 && index < 1000)
    {
        [self addChild:spikes[index]];
        index++;
        
    }
   // dodged.text = [NSString stringWithFormat:@"Dodged: %d",index];
}




@end
