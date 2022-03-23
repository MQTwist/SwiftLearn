//
//  ViewController.h
//  SwiftDemo
//
//  Created by 3ttyy on 2022/3/2.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN


typedef NS_ENUM(NSUInteger, GradientType) {
    GradientFromTopToBottom,
    GradientFromLeftToRight,
    GradientFromLeftTopToRightBottom,
    GradientFromLeftBottomToRightTop,
};

@interface ViewController : UIViewController

@end

NS_ASSUME_NONNULL_END
