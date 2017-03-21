//
//  LXScaleNavTitleView.m
//  导航条头像缩放
//
//  Created by zlwl001 on 2017/3/21.
//  Copyright © 2017年 manman. All rights reserved.
//

#import "LXScaleNavTitleView.h"
@interface LXScaleNavTitleView()<UIScrollViewDelegate>
@property(strong,nonatomic)UIImageView *headerImageView;
@property(nonatomic,strong)UIScrollView *scrollview;
@end
@implementation LXScaleNavTitleView

-(LXScaleNavTitleView *)initWithHeaderImageName:(NSString *)imageName scrollview:(UIScrollView *)scrollview{
    self = [super init];
    if (self) {
        _headerImageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:imageName]];
        _headerImageView.layer.cornerRadius = 35;
        _headerImageView.layer.masksToBounds = YES;
        _headerImageView.frame = (CGRect){0,0,70,70};
        _headerImageView.center = (CGPoint){self.center.x,0};
        [self addSubview:_headerImageView];
        self.scrollview = scrollview;
        self.scrollview.delegate = self;
    }
    return self;
}
-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
    CGFloat offsetY = scrollView.contentOffset.y +scrollView.contentInset.top;
    
    CGFloat scale = 1.0;
    
    //  放大
    if(offsetY < 0) scale = MIN(1.5, 1- offsetY / 300);
    // 允许下拉放大的最大距离为300
    // 1.5是放大的最大倍数，当达到最大时，大小为：1.5 * 70 = 105
    // 这个值可以自由调整
    if (offsetY > 0)scale = MAX(0.45, 1- offsetY/300);
    // 允许向上超过导航条缩小的最大距离为300
    // 为了防止缩小过度，给一个最小值为0.45，其中0.45 = 31.5 / 70.0，表示
    // 头像最小是31.5像素
    
    _headerImageView.transform = CGAffineTransformMakeScale(scale, scale);
    
    // 保证缩放后y坐标不变
    CGRect frame = _headerImageView.frame;
    frame.origin.y = - _headerImageView.layer.cornerRadius / 2;
    _headerImageView.frame = frame;
    

}

@end
