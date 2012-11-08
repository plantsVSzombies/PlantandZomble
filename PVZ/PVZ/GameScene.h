//
//  GameScene.h
//  PVZ
//
//  Created by Ibokan on 12-11-7.
//  Copyright 2012年 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"
#import "Plant.h"
#import "Zombies.h"
#import "Bullet.h"

@interface GameScene : CCLayer {
    CCSprite * backGround;
}
@property(nonatomic,retain)CCSprite * backGround;
+(CCScene *) scene;

@end
