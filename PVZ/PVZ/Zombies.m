//
//  Zombies.m
//  PVZ
//
//  Created by Ibokan on 12-11-8.
//  Copyright 2012年 __MyCompanyName__. All rights reserved.
//

#import "Zombies.h"
#import "CCAnimationHelper.h"

@implementation Zombies
-(void) addZombie//加僵尸
{
    [[CCSpriteFrameCache sharedSpriteFrameCache] addSpriteFramesWithFile:@"zombies_type.plist"];

    CCAnimation* anim = [CCAnimation animationWithFile:@"zombies_type.plist"                             
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
-(void)moveWithParabola:(CCSprite*)mSprite startP:(CGPoint)startPoint endP:(CGPoint)endPoint startA:(float)startAngle endA:(float)endAngle dirTime:(float)time//僵尸的移动
{

}
@end
