//
//  UIImage+Extension.h
//  图片拉伸
//
//  Created by 赵鹏 on 2018/9/7.
//  Copyright © 2018年 apple. All rights reserved.
//

//UIImage类的分类(Category)

#import <UIKit/UIKit.h>

@interface UIImage (Extension)

+ (UIImage *)resizableImage:(NSString *)imageName;

@end
