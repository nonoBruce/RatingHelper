//
//  RatingHelper.m
//  
//
//  Created by yanws on 15/9/7.
//
//

#define USERDEFAULT_NOREMIND    @"USERDEFAULT_NOREMIND"//不再提醒
#define USERDEFAULT_REMINDLATER @"USERDEFAULT_REMINDLATER"//下次再说
//#define USERDEFAULT_RATED       @"USERDEFAULT_RATED"//已经评论过了,操作和noremind的一样样
#define USERDEFAULT_LAUNCHNUM   @"USERDEFAULT_LAUNCHNUM"//用户启动应用的次数

#define USERDEFAULT_LAUNCHNUM_THRESHOLD   1    //启动二十次后，弹出评价

#import "RatingHelper.h"

@interface RatingHelper()<UIAlertViewDelegate>

@property(nonatomic, strong)UIAlertView *alertView;

//@property(nonatomic, assign)NSInteger launchNum;

@end

@implementation RatingHelper

- (instancetype)init {
    if(self = [super init]) {
        self.alertView = [[UIAlertView alloc] initWithTitle:@"给“Color Fun”打分" message:@"Color Fun需要您的鼓励" delegate:self cancelButtonTitle:@"赞一个" otherButtonTitles:@"下次再说",@"不再提醒", nil];
    }
    return self;
}

- (void)show{
    
    
    
    if(![self isNoremind]){
        //监听启动
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(gameLaunch)
                                                     name:UIApplicationDidFinishLaunchingNotification
                                                   object:nil];
        
        //设置默认值
        [self userDefaultsInit];
        
        
        //设置
        if([self launchNum]>USERDEFAULT_LAUNCHNUM_THRESHOLD){

            
            [self.alertView show];
        }
    }else{
        
    }
    
}


- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex {
    
//    NSLog(@"%ld",(long)buttonIndex);
    
    switch (buttonIndex) {
        case 0: {//rating
            
            [self rating];
            //设置不再显示了
            [self setNoremind:YES];
            
            break;
        }
        case 1: {//下次再说,launchNum 重新设置为0
            [self setLaunchNum:0];
            break;
        }
        case 2: {//不再提醒
            [self setNoremind:YES];
            break;
        }
        default:
            break;
    }
}


- (void)rating {
    
    NSString *appID = @"1028227998";
    //===appstore information view
//    NSString *str = [NSString stringWithFormat:@"itms-apps://itunes.apple.com/app/id%@",appID];
    
    //appstre rating view
    NSString *str = [NSString stringWithFormat:@"http://itunes.apple.com/WebObjects/MZStore.woa/wa/viewContentsUserReviews?id=%@&pageNumber=0&sortOrdering=2&type=Purple+Software&mt=8",appID];
    
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:str]];
}



#pragma mark - NSUserDefaults

//取值

//- (BOOL)isRated {
//    BOOL isRated = [[NSUserDefaults standardUserDefaults] boolForKey:USERDEFAULT_RATED];
//    return isRated;
//}

- (BOOL)isNoremind {
    
    BOOL isNoremind = [[NSUserDefaults standardUserDefaults] boolForKey:USERDEFAULT_NOREMIND];
    return isNoremind;
}

- (BOOL)isRemindLater {
    
    BOOL isRemindLater = [[NSUserDefaults standardUserDefaults] boolForKey:USERDEFAULT_REMINDLATER];
    return isRemindLater;
}

- (NSInteger)launchNum {
    
    NSInteger launchNum = [[NSUserDefaults standardUserDefaults] integerForKey:USERDEFAULT_LAUNCHNUM];
    return launchNum;
    
    //    NSInteger imageNetVersion = [[NSUserDefaults standardUserDefaults] integerForKey:USERDEFAULT_IMAGEVERSION];
    //    NSNumber *versionNum = [NSNumber numberWithInteger:imageNetVersion];
    //    return versionNum;
}


//===注册默认设置
- (void)userDefaultsInit {
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    
    NSDictionary *defaultValues = [NSDictionary dictionaryWithObjectsAndKeys:
                                   @"1",USERDEFAULT_LAUNCHNUM,
                                   @"NO",USERDEFAULT_NOREMIND,
//                                   @"NO",USERDEFAULT_RATED,
                                   @"NO",USERDEFAULT_REMINDLATER,
                                   nil];
    
    [userDefaults registerDefaults:defaultValues];
}

- (void)resetUserDefaultInit{
//    [self setRated:NO];
//
//    [self setRemindLater:NO];
    [self setNoremind:NO];
    [self setLaunchNum:0];
    
}


//- (void)setRated:(BOOL)isRated {
//    [[NSUserDefaults standardUserDefaults] setBool:isRated forKey:USERDEFAULT_RATED];
//}

- (void)setNoremind:(BOOL)isNoremind {
    [[NSUserDefaults standardUserDefaults] setBool:isNoremind forKey:USERDEFAULT_NOREMIND];
}

//- (void)setRemindLater:(BOOL)isRemindLater {
//    [[NSUserDefaults standardUserDefaults] setBool:isRemindLater forKey:USERDEFAULT_REMINDLATER];
//}

- (void)setLaunchNum:(NSInteger)launchNum{
    
    [[NSUserDefaults standardUserDefaults] setInteger:launchNum forKey:USERDEFAULT_LAUNCHNUM];
    
//    NSLog(@"launchNum = %d",[self launchNum]);
}
// *** Terminating app due to uncaught exception 'NSInvalidArgumentException', reason: '-[__NSArrayI gameLaunch]: unrecognized selector sent to instance 0x14e48be0'

#pragma mark - 监听启动次数
//启动游戏
- (void)gameLaunch{
    NSInteger launchNum = [self launchNum];
    launchNum++;
    [self setLaunchNum:launchNum];

//    NSLog(@"launchNum = %d",(int)launchNum);

}
@end
