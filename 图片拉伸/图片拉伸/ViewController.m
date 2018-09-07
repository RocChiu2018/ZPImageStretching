//
//  ViewController.m
//  图片拉伸
//
//  Created by apple on 16/6/3.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

#pragma mark ————— 生命周期 —————
- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    UIImageView *imageView = [[UIImageView alloc] init];
    imageView.frame = CGRectMake(100, 10, 280, 150);
    [self.view addSubview:imageView];

    //加载原图
    UIImage *image = [UIImage imageNamed:@"chat_send_nor"];
    
    /**
     图片拉伸方法1：调用resizableImageWithCapInsets方法来处理图片；
     按照代码写的尺寸把原图片的相应区域保护起来，即保持原样，既不进行拉伸也不进行压缩，而其余的部分则不受到保护，系统会根据根据模式来进行拉伸或压缩，从而达到了图片既进行了拉伸或压缩也不失真的效果；
     下面的代码表示图片的上，左，下，右各有30个point被保护起来了，而没被保护的区域（中间的正方形）系统则进行平铺；
     如果方法中不写resizingMode参数的话则默认是平铺模式（UIImageResizingModeTile）。
     */
    UIImage *newImage = [image resizableImageWithCapInsets:UIEdgeInsetsMake(30, 30, 30, 30)];
    imageView.image = newImage;
    
    /**
     图片拉伸处理方法2：调用stretchableImageWithLeftCapWidth:topCapHeight:方法来处理图片；
     这个方法是苹果最早处理图片拉伸的方法；
     调用这种方法之后，系统会根据传入的左边和上边的需要保护的区域来推算出右边和下边的需要保护的区域，调用方法时不管传入的需要保护的区域是多少，最后系统算出的需要拉伸的区域都是图片最中间的1*1的地方，所以说这个方法只拉伸图片最中间的1*1的区域；
     调用方法时一般传入的左边需要被保护的区域为图片宽度的一半，上边需要保护的区域为图片高度的一半。
     */
//    UIImage *newImage = [image stretchableImageWithLeftCapWidth:image.size.width * 0.5 topCapHeight:image.size.height * 0.5];
//    imageView.image = newImage;
    
    /**
     图片拉伸处理方法3：
     在Assets.xcassets中点击要进行拉伸的图片，点击右侧栏中的slicing，选择里面的Horizontal and Vertical（竖直和水平方向进行拉伸），xcode会自动算出需要保护的尺寸。
     */
//    UIImageView *imageView = [[UIImageView alloc] init];
//    imageView.frame = CGRectMake(100, 10, 280, 150);
//    imageView.image = [UIImage imageNamed:@"chat_send_nor"];
//    [self.view addSubview:imageView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
