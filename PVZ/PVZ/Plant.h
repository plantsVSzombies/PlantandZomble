//
//  Plant.h
//  PVZ
//
//  Created by Ibokan on 12-11-8.
//  Copyright 2012年 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"

typedef enum 
{
    peashooter = 0,
    SunFlower,
    snowPeashooter,
    ThreePeater,
    CherryBomb,
    ScaredyShroom,
    WallNut
}PlantType;//植物的类型
@interface Plant : CCSprite {
    PlantType type;//植物类型
    CCAction *addPlant;//添加植物的动画
}

@end
