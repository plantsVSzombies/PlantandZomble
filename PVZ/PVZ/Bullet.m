//
//  Bullet.m
//  PVZ
//
//  Created by Ibokan on 12-11-8.
//  Copyright 2012年 __MyCompanyName__. All rights reserved.
//

#import "Bullet.h"
#import "GameScene.h"

@implementation Bullet
+ (id) BulletWithinLayer:(CCLayer *)layer
{
    //游戏层
	GameScene *ly = (GameScene *)layer;
    //产生子弹精灵
	Bullet *sprite = [Bullet spriteWithFile:@"bullet.PNG" rect:CGRectMake(0, 0, 16, 16)];
    //加到游戏层
	//[ly.gameWorld addChild:sprite z:100];
    
	[sprite BulletInit];        //子弹初始化
	[sprite setVisible:NO];     //初始时不可见
	[sprite SetGamelayer:layer];//记住游戏层变量
	
	return sprite;
}
//记住游戏层变量
- (void)SetGamelayer:(CCLayer *)layer
{
	gLayer = layer;
}
//子弹初始化
- (void) BulletInit
{
    //效果1，烟
	emitter = [[CCParticleSmoke alloc] initWithTotalParticles:300];
	emitter.posVar = ccp(2, 2);
	emitter.startSize = 2;
	emitter.startSizeVar = 2;
	emitter.endSize = 5;
	emitter.endSizeVar = 3;
	
	emitter.angle = 0;
	emitter.angleVar = 360;
	
	emitter.speed = 20;
	emitter.speedVar = 10;
	
	emitter.life = 0.2;
	emitter.lifeVar = 0.0;
	emitter.gravity = ccp(0, 0);
    
    //	ccColor4F startColor = {0.8f, 0.8f, 0.0f, 0.1f};
    //	emitter.startColor = startColor;	
	
    //	ccColor4F endColor = {0.8f, 0.8f, 0.0f, 0.1f};
	ccColor4F endColor = {0.0f, 0.0f, 0.0f, 0.3f};
	emitter.endColor = endColor;	
    
    //效果2 太阳
	emitter2 = [[CCParticleSun alloc] initWithTotalParticles:250];
    
	emitter2.posVar = ccp(3, 3);
	emitter2.startSize = 20;
	emitter2.startSizeVar = 2;
	emitter2.endSize = 0;
	emitter2.endSizeVar = 0;
	ccColor4F endColor2 = {0.0f, 0.0f, 0.0f, 0.1f};
	emitter2.endColor = endColor2;	
	
	// radial
    //	emitter2.radialAccel = -120;
    //	emitter2.radialAccelVar = 0;	
	//停止粒子发射
	[emitter stopSystem];
	[emitter2 stopSystem];
	
    //将 粒子发射器1、2加载到子弹精灵上
	[self addChild: emitter];
	[emitter release];
	
	[self addChild: emitter2];
	[emitter2 release];
	
    
}
// 将子弹发射，从 ptFrom 到 ptTo，5秒时长
- (void)FireFrom:(CGPoint)ptFrom To:(CGPoint)ptTo bulletType:(int)bType
{
	[self setPosition:ptFrom];
	
	id ac1 = [CCShow action];
	id ac2 = [CCMoveTo actionWithDuration:5 position:ptTo];
	id seq = [CCSequence actions:ac1, ac2, nil];
	
	// 根据子弹类型，发射不同的子弹效果
	if (bType == 1)
	{
		emitter.position = ccp(self.contentSize.width / 2, self.contentSize.height / 2);
		[emitter resetSystem];
	}
	else
	{
		emitter2.position = ccp(self.contentSize.width / 2, self.contentSize.height / 2);
		[emitter2 resetSystem];
	}
	
	[self runAction:seq];	
}

// on "dealloc" you need to release all your retained objects
- (void) dealloc
{
	// in case you have something to dealloc, do it in this method
	// in this particular example nothing needs to be released.
	// cocos2d will automatically release all the children (Label)
	
	// don't forget to call "super dealloc"
	[super dealloc];
}
@end
