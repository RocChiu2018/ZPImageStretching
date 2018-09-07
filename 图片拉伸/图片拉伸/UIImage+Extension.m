//
//  UIImage+Extension.m
//  图片拉伸
//
//  Created by 赵鹏 on 2018/9/7.
//  Copyright © 2018年 apple. All rights reserved.
//

#import "UIImage+Extension.h"

@implementation UIImage (Extension)

+ (UIImage *)resizableImage:(NSString *)imageName
{
    UIImage *image = [self resizableImage:imageName];
    
    return [image stretchableImageWithLeftCapWidth:image.size.width * 0.5 topCapHeight:image.size.height * 0.5];
}

@end
