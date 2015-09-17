//
//  RatingHelper.h
//  
//
//  Created by yanws on 15/9/7.
//
//

#import <UIKit/UIKit.h>

@interface RatingHelper : NSObject

//显示AlertView
- (void)show;

//直接跳转评分
- (void)rating;

//APP事件，累计的事件
- (void)appAction;

@end
