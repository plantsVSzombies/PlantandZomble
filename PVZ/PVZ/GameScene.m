//
//  GameScene.m
//  PVZ
//
//  Created by Ibokan on 12-11-7.
//  Copyright 2012年 __MyCompanyName__. All rights reserved.
//

#import "GameScene.h"


@implementation GameScene
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
        CCSprite * backGround = [CCSprite spriteWithSpriteFrameName:@"background1.png"];
        backGround.anchorPoint = ccp(0, 0);
        [self addChild:backGround];
	}
	return self;
}

@end
