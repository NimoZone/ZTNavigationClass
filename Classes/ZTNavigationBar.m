//
//  ZTNavigationBar.m
//  ZTCode
//
//  Created by 曾涛 on 2018/5/29.
//  Copyright © 2018年 曾涛. All rights reserved.
//

#import "ZTNavigationBar.h"

#define APP_W     [UIScreen mainScreen].bounds.size.width
#define APP_H     [UIScreen mainScreen].bounds.size.height
#define IPHONE    (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone)
#define IPAD      (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)
#define IPHONE_10 (IPHONE && APP_H >= 812)


@interface ZTNavigationBar()
{
    CGFloat     _topScale;
    CGFloat     _buttonWidth;
    CGFloat     _buttonHeight;
}
@end

@implementation ZTNavigationBar

- (instancetype)initWithFrame:(CGRect)frame BgColor:(UIColor *)bgColor ImageViewBgColor:(UIColor *)imageViewBgColor LineColor:(UIColor *)lineColor BaseController:(UIViewController *)baseController{
    
    if (self = [super initWithFrame:frame]) {
        
        _buttonWidth         = 100.0f;
        _buttonHeight        = (IPHONE_10 || IPAD)?(40):(30);
        _topScale            = (IPHONE_10)?(35):(26);
        _baseController      = baseController;
        self.backgroundColor = bgColor;
        
        _lineView = [[UIView alloc]initWithFrame:CGRectMake(0, self.frame.size.height - 1, self.frame.size.width, 1)];
        _lineView.backgroundColor = lineColor;
        [self addSubview:_lineView];
        
        _imageView = [[UIImageView alloc]initWithFrame:self.bounds];
        _imageView.alpha = 0;
        _imageView.backgroundColor = imageViewBgColor;
        [self addSubview:_imageView];
    }
    
    return self;
}

#pragma mark -  导航栏左侧按钮
- (void)setUpLeftBarItem{
    
    
    _leftItem = [[UIButton alloc]initWithFrame:CGRectMake(0, _topScale, _buttonWidth, _buttonHeight)];
    _leftItem.titleLabel.font = [UIFont systemFontOfSize:14];
    [_leftItem setTitle:(!_leftTitle)?(@"返回"):(_leftTitle) forState:UIControlStateNormal];
    [_leftItem setTitleColor:(!_leftTitleColor)?([UIColor blackColor]):(_leftTitleColor) forState:UIControlStateNormal];
    [_leftItem setImage:[UIImage imageNamed:[self leftBarItemIcon]] forState:UIControlStateNormal];
    _leftItem.imageEdgeInsets = UIEdgeInsetsMake(0, -35, 0, 0);
    _leftItem.titleEdgeInsets = UIEdgeInsetsMake(0, -20, 0, 0);
    [self addSubview:_leftItem];
    
//        _leftItem.backgroundColor = [UIColor brownColor];
}


#pragma mark -  设置导航栏右侧图片按钮
- (void)setUpRightBarItemImage:(NSString *)image{
    
    _rightItem = [[UIButton alloc]initWithFrame:CGRectMake(self.frame.size.width - _buttonWidth, _topScale, _buttonWidth, _buttonHeight)];
    [_rightItem setImage:[UIImage imageNamed:image] forState:UIControlStateNormal];
    _rightItem.imageEdgeInsets = UIEdgeInsetsMake(0, 70 - 20, 0, 0);
    [self addSubview:_rightItem];
    
    //    _rightItem.backgroundColor = [UIColor blueColor];
}

#pragma mark - 设置导航栏右侧文字按钮
- (void)setUpRightBarItemTitle:(NSString *)title{
    
    if (_rightItem != nil) [_rightItem removeFromSuperview];
    
    NSDictionary *attrbute = @{NSFontAttributeName:[UIFont systemFontOfSize:14]};
    CGFloat width = [title boundingRectWithSize:CGSizeMake(APP_W, 10000)
                                        options:NSStringDrawingUsesLineFragmentOrigin|NSStringDrawingUsesFontLeading
                                     attributes:attrbute
                                        context:nil].size.width+10;
    
    _rightItem = [[UIButton alloc]initWithFrame:CGRectMake(self.frame.size.width - _buttonWidth, _topScale, _buttonWidth, _buttonHeight)];
    _rightItem.titleLabel.font = [UIFont systemFontOfSize:14];
    [_rightItem setTitle:title forState:UIControlStateNormal];
    [_rightItem setTitleColor:(!_rightTitleColor)?([UIColor blackColor]):(_rightTitleColor) forState:UIControlStateNormal];
    _rightItem.titleEdgeInsets = UIEdgeInsetsMake(0, 80 - width, 0, 0);
    [self addSubview:_rightItem];
    
    //    _rightItem.backgroundColor = [UIColor blueColor];
    
}

#pragma mark - 设置导航栏中间文字
- (void)setUpCenterTitle:(NSString *)title{
    
    if (_titleLbl != nil) [_titleLbl removeFromSuperview];
    
    _titleLbl = [[UILabel alloc]initWithFrame:CGRectMake((self.frame.size.width - 220)/2, _topScale, 220, _buttonHeight)];
    _titleLbl.text = title;
    _titleLbl.textColor = (!_centTitleColor)?([UIColor blackColor]):(_centTitleColor);
    _titleLbl.font = [UIFont boldSystemFontOfSize:17];
    _titleLbl.textAlignment = 1;
    [self addSubview:_titleLbl];
    
    //    _titleLbl.backgroundColor = [UIColor redColor];
}

- (void)setUpBackgroundImage:(NSString *)image{
    
    if (_imageView != nil) [_imageView removeFromSuperview];
    
    _imageView       = [[UIImageView alloc]init];
    _imageView.image = [UIImage imageNamed:image];
    _imageView.frame = self.bounds;
    [self addSubview:_imageView];
}

#pragma mark - 导航栏左按钮图片
- (NSString *)leftBarItemIcon{
    
    if (_baseController.navigationController.viewControllers.count > 1) {
        // 此时push进来的viewController是第二个子控制器
        return _leftImage;
    }
    return @" ";
}

#pragma mark - 导航栏右按钮图片
- (NSString *)rightBarItemIcon{
    
    return @"";
}

#pragma mark - 导航栏中间图片
- (NSString *)centerImage{
    return @"";
}

@end
