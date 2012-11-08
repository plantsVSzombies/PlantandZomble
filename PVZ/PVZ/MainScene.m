//
//  HelloWorldLayer.m
//  PVZ
//
//  Created by Ibokan on 12-11-7.
//  Copyright __MyCompanyName__ 2012年. All rights reserved.
//


#import "MainScene.h"
#import "GameScene.h"
#import "AppDelegate.h"

#pragma mark - MainScene

@implementation MainScene
@synthesize rool;
@synthesize loadingLabel;
+(CCScene *) scene
{
	CCScene *scene = [CCScene node];
	
	MainScene *layer = [MainScene node];
	
	[scene addChild: layer];
	
	return scene;
}

-(id) init
{
	if( (self=[super init]) ) {

        self.isTouchEnabled = YES;
        [[CCSpriteFrameCache sharedSpriteFrameCache] addSpriteFramesWithFile:@"loadingLogo.plist"];
        CCSprite * loadingLogo = [CCSprite spriteWithSpriteFrameName:@"titlescreen.png"];
        loadingLogo.anchorPoint = ccp(0, 0);
		[self addChild:loadingLogo];
        
        // 使用已有的精灵生成一个菜单项,生成开始菜单
        
        CCSprite* logoLine = [CCSprite spriteWithSpriteFrameName:@"LogoLine.png"]; 
        logoLine.position = ccp(240, 30);
        [self addChild:logoLine];

        loadingLabel = [CCLabelTTF labelWithString:@"loading..." fontName:@"Helvetica-BoldOblique" fontSize:18]; 
        loadingLabel.position = ccp(240, 25);
        [self addChild:loadingLabel];
        
        rool = [CCSprite spriteWithSpriteFrameName:@"SodRollCap.png"];
        rool.position = ccp(105, 85);
        [self addChild:rool];
        [rool runAction:[CCMoveTo actionWithDuration:5 position:ccp(360, 85)]];
        [rool runAction:[CCRotateTo actionWithDuration:5 angle:720]];
        [self scheduleOnce:@selector(initStartItemMenu) delay:5];
        


	}
	return self;
}
-(void)initStartItemMenu
{
    
    [rool removeFromParentAndCleanup:NO];
    [loadingLabel removeFromParentAndCleanup:NO];
    [CCMenuItemFont setFontName:@"Helvetica-BoldOblique"];
    [CCMenuItemFont setFontSize:20];
    CCMenuItemFont* itemStart = [CCMenuItemFont itemFromString:@"点击开始游戏" target:self selector:@selector(startGame)];
    CCMenu *menu = [CCMenu menuWithItems:itemStart, nil];
    [menu setPosition:ccp( 240, 23)];
    [self addChild:menu];
}

-(void)startGame
{
    NSLog(@"start...");
    CCTransitionProgressRadialCW *jumoZoom = [CCTransitionProgressRadialCW transitionWithDuration:1 scene:[GameScene scene]];

    [[CCDirector sharedDirector] pushScene:jumoZoom];
}
- (void) dealloc
{
    [rool release];
    [loadingLabel release];
	[super dealloc];
}

@end
