//
//  ZTNavigationBar.h
//  ZTCode
//
//  Created by 曾涛 on 2018/5/29.
//  Copyright © 2018年 曾涛. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ZTNavigationBar : UIView

@property (strong, nonatomic) UIButton          *leftItem;          //左侧按钮
@property (strong, nonatomic) UIButton          *rightItem;         //右侧按钮
@property (strong, nonatomic) UILabel           *titleLbl;          //中间的文字
@property (strong, nonatomic) UIView            *lineView;          //线条
@property (strong, nonatomic) UIImageView       *imageView;         //图片
@property (strong, nonatomic) UIViewController  *baseController;    //当前控制器

@property (strong, nonatomic) UIColor  *centTitleColor;            //中间字体颜色

@property (copy,   nonatomic) NSString *leftImage;                 //左按钮默认图片
@property (copy,   nonatomic) NSString *leftTitle;                 //左按钮文本
@property (strong, nonatomic) UIColor  *leftTitleColor;            //左按钮字体颜色

@property (copy,   nonatomic) NSString *rightImage;                //右按钮默认图片
@property (copy,   nonatomic) NSString *rightTitle;                //右按钮文本
@property (strong, nonatomic) UIColor  *rightTitleColor;           //右按钮字体颜色


/**
 初始化导航栏，最好基类controller调用

 @param frame frame
 @param bgColor 背景色
 @param imageViewBgColor 背景图颜色
 @param lineColor 下方线条色
 @param baseController 控制器
 @return self
 */
- (instancetype)initWithFrame:(CGRect)frame
                      BgColor:(UIColor *)bgColor
             ImageViewBgColor:(UIColor *)imageViewBgColor
                    LineColor:(UIColor *)lineColor
               BaseController:(UIViewController *)baseController;



#pragma mark === 导航栏左 ====
/**
 *  设置导航栏左边按钮
 */
- (void)setUpLeftBarItem;


#pragma mark === 导航栏右 ====
/**
 设置导航栏右按钮图片
 
 @param image 图片名
 */
-(void)setUpRightBarItemImage:(NSString *)image;

/**
 *  设置导航栏右按钮文字
 *
 *  @param title 文字
 */
- (void)setUpRightBarItemTitle:(NSString *)title;

/**
 *  导航栏右按钮图片
 *
 *  @return 图片名字
 */
- (NSString *)rightBarItemIcon;


#pragma mark ==== 导航栏中 ====
/**
 *  设置导航栏中间的文字
 *
 *  @param title 文字
 */
- (void)setUpCenterTitle:(NSString*)title;


@end
