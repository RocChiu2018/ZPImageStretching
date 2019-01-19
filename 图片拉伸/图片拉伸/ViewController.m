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
    
    [self pictureStretch1];
    
//    [self pictureStretch2];
    
//    [self pictureStretch3];
}

#pragma mark ————— 图片拉伸方法1 —————
/**
 图片拉伸方法1：使用"resizableImageWithCapInsets:"方法来处理图片。
 按照方法中参数写的尺寸把原图片的相应区域保护起来，被保护的区域既不进行拉伸也不进行压缩，而其余的部分则不被保护。在运行的时候系统会把图片中不被保护的区域进行拉伸或压缩，从而达到了图片既进行了拉伸或压缩但也不失真的效果；
 "UIEdgeInsetsMake"方法中的参数表示图片中的上，左，下，右各有30个point被保护起来了，在运行的时候系统会对图片中没被保护的区域（图片中间的正方形）进行平铺；
 如果方法中不写"resizingMode"参数的话则系统默认是平铺模式(UIImageResizingModeTile)。
 */
- (void)pictureStretch1
{
    UIImageView *imageView = [[UIImageView alloc] init];
    imageView.frame = CGRectMake(100, 10, 280, 150);
    
    //加载原图片
    UIImage *image = [UIImage imageNamed:@"chat_send_nor"];
    
    //处理图片
    UIImage *newImage = [image resizableImageWithCapInsets:UIEdgeInsetsMake(30, 30, 30, 30)];
    
    imageView.image = newImage;
    [self.view addSubview:imageView];
}

#pragma mark ————— 图片拉伸方法2 —————
/**
 图片拉伸方法2：使用"stretchableImageWithLeftCapWidth: topCapHeight: "方法来处理图片。
 这个方法是苹果最早处理图片拉伸的方法；
 调用这个方法之后，系统会根据传入的图片左边和上边的需要保护的区域来推算出图片右边和下边需要保护的区域。调用这个方法时不管参数传入的是多少，最后系统算出的需要拉伸的区域都是图片最中间的1*1的地方，所以说这个方法只拉伸图片最中间的1*1的区域；
 调用这个方法时一般传入的左边需要被保护的区域为图片宽度的一半，上边需要保护的区域为图片高度的一半。
 */
- (void)pictureStretch2
{
    UIImageView *imageView = [[UIImageView alloc] init];
    imageView.frame = CGRectMake(100, 10, 280, 150);
    
    UIImage *image = [UIImage imageNamed:@"chat_send_nor"];
    UIImage *newImage = [image stretchableImageWithLeftCapWidth:image.size.width * 0.5 topCapHeight:image.size.height * 0.5];
    
    imageView.image = newImage;
    [self.view addSubview:imageView];
}

#pragma mark ————— 图片拉伸方法3 —————
/**
 图片拉伸方法3：
 在"Assets.xcassets"文件中点击要进行拉伸的图片，然后在右侧栏中找到"Slicing"中的"Slices"，选择下拉菜单中的"Horizontal and Vertical"（水平和竖直方向进行拉伸），然后系统就会自动算出图片需要保护的尺寸了。
 */
- (void)pictureStretch3
{
    UIImageView *imageView = [[UIImageView alloc] init];
    imageView.frame = CGRectMake(100, 10, 280, 150);
    imageView.image = [UIImage imageNamed:@"chat_send_nor"];
    [self.view addSubview:imageView];
}

#pragma mark ————— 图片拉伸方法4 —————
/**
 图片拉伸方法4：
 上述的图片拉伸方法1和图片拉伸方法2都是在代码中利用UIImage类的实例方法来对图片进行处理，上述的图片拉伸方法3是在"Assets.xcassets"文件中对图片进行设置从而来实现对图片进行拉伸或压缩而不失真的目的。图片拉伸方法4是针对使用storyboard或者xib文件来讲，在文件中选中UIImageView控件，然后在右侧栏中找到"Stretching"，设置"Stretching"中的X值和Y值，根据X值算出图片需要被保护的左边的区域大小为：图片的整个宽度乘以X的值（比如，图片整个的宽度为100，X的值为0.5，那么图片左边被保护的区域大小就是100 * 0.5 = 50）。根据Y值算出图片需要被保护的上面的区域大小为：图片的整个高度乘以Y的值（比如，图片整个的高度为200，Y的值为0.5，那么图片上面被保护的区域大小就是200 * 0.5 = 100）。系统在根据被保护的左边和上面的大小算出图片被保护的下面和右边的大小。"Stretching"中的"Width"和"Height"代表截取图片中的某一块区域进行拉伸，默认都写为0，代表截取图片最中间的1*1的区域进行拉伸，从而实现了图片既拉伸了而又不失真的效果。
 */

@end
