//
//  GameScene.m
//  PVZ
//
//  Created by Ibokan on 12-11-7.
//  Copyright 2012年 __MyCompanyName__. All rights reserved.
//

#import "GameScene.h"
#import "Zombies.h"
#import "CCAnimationHelper.h"
@implementation GameScene
@synthesize backGround;
+(CCScene *) scene
{
	CCScene *scene = [CCScene node];
	
	GameScene *layer = [GameScene node];
	
	[scene addChild: layer];
	
	return scene;
}
-(id) init
{
	if( (self=[super init]) ) {
    
        self.isTouchEnabled = YES;
        [[CCSpriteFrameCache sharedSpriteFrameCache] addSpriteFramesWithFile:@"cardMenu.plist"];
        backGround = [CCSprite spriteWithSpriteFrameName:@"background1.png"];
        backGround.anchorPoint = ccp(1, 0);
        backGround.position = ccp(480, 0);
        [self addChild:backGround];
        [self scheduleOnce:@selector(delayTwoSecondsToMove) delay:2];
        
	}
	return self;
}

-(void)delayTwoSecondsToMove
{
    NSLog(@"waiting 2 seconds...");
    [backGround runAction:[CCMoveTo actionWithDuration:2 position:ccp(680, 0)]];
    [self schedule:@selector(addZombie) interval:2];
}
-(void)addZombie
{
    [[CCSpriteFrameCache sharedSpriteFrameCache] addSpriteFramesWithFile:@"zombies_type.plist"];
    
    CCAnimation* anim = [CCAnimation animationWithFile:@"zombie"                             
                                            frameCount:22 
                                                 delay:0.08f];
    CCAnimate* animate = [CCAnimate actionWithAnimation:anim]; 
    CCRepeatForever* repeat = [CCRepeatForever actionWithAction:animate]; 
    CCSprite * zombie = [CCSprite spriteWithSpriteFrameName:@"zombie001.png"];
    [zombie runAction:repeat];
    zombie.position = ccp(480,50);
    [self addChild:zombie];
    
    [zombie runAction:[CCMoveTo actionWithDuration:10 position:ccp(0, 50)]];
    
}

@end
