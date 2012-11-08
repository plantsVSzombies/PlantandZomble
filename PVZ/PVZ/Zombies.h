//
//  Zombies.h
//  PVZ
//
//  Created by Ibokan on 12-11-8.
//  Copyright 2012年 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"
typedef enum 
{
    Zombie = 0,
    FlagZombie,
    ConeheadZombie,
    BucketheadZombie
}ZomBoetType;//僵尸的类型
@interface Zombies : CCSprite {
    ZomBoetType type;
    bool isHiting;//判断是否被击中
    CCAction *addZombie;
}
-(void) addZombie;//加僵尸
-(void)moveWithParabola:(CCSprite*)mSprite startP:(CGPoint)startPoint endP:(CGPoint)endPoint startA:(float)startAngle endA:(float)endAngle dirTime:(float)time;//僵尸的移动

@end
