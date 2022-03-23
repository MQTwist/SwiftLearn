//
//  UIColor+Extension.m
//  SwiftDemo
//
//  Created by 3ttyy on 2022/3/3.
//

#import "UIColor+Extension.h"

@implementation UIColor (Extension)

+ (UIColor *)randomColor {
    return [UIColor colorWithRed:arc4random() % 256 / 255. green:arc4random() % 256 / 255. blue:arc4random() % 256 / 255. alpha:1];
}

@end
