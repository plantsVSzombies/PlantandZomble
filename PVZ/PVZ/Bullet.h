//
//  Bullet.h
//  PVZ
//
//  Created by Ibokan on 12-11-8.
//  Copyright 2012年 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"

@interface Bullet : CCSprite {
    CCLayer *gLayer;                //游戏层
	CCParticleSystem	*emitter;   //粒子效果1
	CCParticleSystem	*emitter2;  //粒子效果2
}
//产生子弹
+ (id) BulletWithinLayer:(CCLayer *)layer;
//设置游戏层
- (void)SetGamelayer:(CCLayer *)layer;

//子弹初始化
- (void)BulletInit;

// 发射从。。。到。。。
- (void)FireFrom:(CGPoint)ptFrom To:(CGPoint)ptTo bulletType:(int)bType;
@end
