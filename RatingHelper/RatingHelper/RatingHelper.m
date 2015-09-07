//
//  RatingHelper.m
//  
//
//  Created by yanws on 15/9/7.
//
//

#define USERDEFAULT_NOREMIND    @"USERDEFAULT_NOREMIND"
#define USERDEFAULT_REMINDLATER @"USERDEFAULT_REMINDLATER"

#import "RatingHelper.h"

@interface RatingHelper()<UIAlertViewDelegate>

@property(nonatomic, strong)UIAlertView *alertView;

@end

@implementation RatingHelper


- (void)show{
    self.alertView = [[UIAlertView alloc] initWithTitle:@"给“Color Fun”打分" message:@"Color Fun需要您的鼓励" delegate:self cancelButtonTitle:@"赞一个" otherButtonTitles:@"不再提醒",@"下次再说", nil];
    
    [self.alertView show];
    
}


- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex {
    
    NSLog(@"%ld",(long)buttonIndex);
    
    switch (buttonIndex) {
        case 0: {//rating
            [self rating];
            break;
        }
            
        case 1: {//不再提醒
            break;
        }
            
        case 2: {//下次再说
            break;
        }
            
            
            
        default:
            break;
    }
}


- (void)rating {
    
    NSString *appID = @"1028227998";
//    itms-apps://itunes.apple.com/app/idxxxxxxx
    NSString *str = [NSString stringWithFormat:@"itms-apps://itunes.apple.com/app/id%@",appID];
    
    
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:str]];
}
@end
