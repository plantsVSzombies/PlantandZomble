//
//  HelloWorldLayer.h
//  PVZ
//
//  Created by Ibokan on 12-11-7.
//  Copyright __MyCompanyName__ 2012年. All rights reserved.
//


#import <GameKit/GameKit.h>

#import "cocos2d.h"

@interface MainScene : CCLayer 
{
    CCSprite *rool; 
    CCLabelTTF *loadingLabel;
}

@property(nonatomic,retain)CCSprite *rool;
@property(nonatomic,retain)CCLabelTTF *loadingLabel;
+(CCScene *) scene;

@end
