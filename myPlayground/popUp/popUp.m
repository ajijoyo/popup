//
//  popUp.m
//  myPlayground
//
//  Created by Dealjava on 11/28/16.
//  Copyright © 2016 proto. All rights reserved.
//

#import "popUp.h"

#define defaultDuration 0.3

@implementation popUp

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (instancetype)init{
    self = [super initWithFrame:[[UIApplication sharedApplication] keyWindow].bounds];
    if (self) {
        
        for (UIView * vim in [UIApplication sharedApplication].keyWindow.subviews) {
            if ([vim isKindOfClass:[popUp class]]) {
                break;
                return self;
            }
        }
        _isDismissAble = YES;
        index = 0;
        images = @[[UIImage imageNamed:@"kaps_cooliest"],
                   [UIImage imageNamed:@"kaps_ghosting"],
                   [UIImage imageNamed:@"kaps_kiss"],
                   [UIImage imageNamed:@"kaps_question"],
                   [UIImage imageNamed:@"kaps_right_sticker"],
                   [UIImage imageNamed:@"kaps_spoiled"],
                   [UIImage imageNamed:@"kaps_wrong_sticker"],
                   ];
        
//        self.backgroundColor = [[UIColor grayColor]colorWithAlphaComponent:0.2];
        
        CGFloat width = self.bounds.size.width - 32;
        baseView = [[UIView alloc]initWithFrame:CGRectMake((self.bounds.size.width - width) / 2, 0, width, 10)];
        baseView.layer.cornerRadius = 8;
        baseView.layer.backgroundColor = [UIColor whiteColor].CGColor;
        baseView.layer.shadowColor = [[UIColor blackColor] colorWithAlphaComponent:0.5].CGColor;
        baseView.layer.shadowOffset = CGSizeMake(1, 1);
        baseView.layer.shadowOpacity = 1;
        baseView.layer.shadowRadius = 90;
        [self addSubview:baseView];
        
        titleLabel = [UILabel new];
        titleLabel.textAlignment = NSTextAlignmentCenter;
        titleLabel.textColor = [UIColor redColor];
        titleLabel.font = [UIFont boldSystemFontOfSize:17];
        titleLabel.frame = CGRectMake(0, 0, baseView.bounds.size.width, 0);
        titleLabel.hidden = YES;
        [baseView addSubview:titleLabel];
        
        messageLabel = [UILabel new];
        messageLabel.textAlignment = NSTextAlignmentCenter;
        messageLabel.font = [UIFont systemFontOfSize:14];
        messageLabel.numberOfLines = 0;
        messageLabel.frame = CGRectMake(0, 0, baseView.bounds.size.width, 0);
        messageLabel.hidden = YES;
        [baseView addSubview:messageLabel];
        
        CGFloat widthBttn = width/2;
        
        confirmBttn = [UIButton buttonWithType:UIButtonTypeCustom];
        confirmBttn.hidden = YES;
        [confirmBttn setTitle:@"ok" forState:UIControlStateNormal];
        confirmBttn.autoresizingMask = (UIViewAutoresizingFlexibleLeftMargin |UIViewAutoresizingFlexibleRightMargin);
        confirmBttn.frame = CGRectMake(((widthBttn - 120)/ 2) + widthBttn, 0, 120, 0);
        confirmBttn.layer.cornerRadius = 8;
        confirmBttn.layer.backgroundColor = [UIColor redColor].CGColor;
//        confirmBttn.layer.shadowColor = [UIColor grayColor].CGColor;
//        confirmBttn.layer.shadowOffset = CGSizeMake(0.5, 0.5);
//        confirmBttn.layer.shadowOpacity = 1;
//        confirmBttn.layer.shadowRadius = 1;
        [baseView addSubview:confirmBttn];
        
        cancelBttn = [UIButton buttonWithType:UIButtonTypeCustom];
        cancelBttn.hidden = YES;
        [cancelBttn setTitle:@"cancel" forState:UIControlStateNormal];
        [cancelBttn setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
        cancelBttn.frame = CGRectMake((widthBttn - 120)/ 2, 0, 120, 0);
        [baseView addSubview:cancelBttn];
        
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(dismis:)];
        [self addGestureRecognizer:tap];
        
        UITapGestureRecognizer *basetap = [[UITapGestureRecognizer alloc]initWithTarget:self action:nil];
        [baseView addGestureRecognizer:basetap];
        
    }
    return self;
}

-(void)dismis:(UITapGestureRecognizer*)tap{
    if (tap){
        if (_isDismissAble) {
            [UIView animateKeyframesWithDuration:defaultDuration delay:0 options:UIViewKeyframeAnimationOptionCalculationModeCubicPaced animations:^{
                self.alpha = 0;
            } completion:^(bool b){
                [self removeFromSuperview];
            }];
        }
    }else{
        [UIView animateKeyframesWithDuration:defaultDuration delay:0 options:UIViewKeyframeAnimationOptionCalculationModeCubicPaced animations:^{
            self.alpha = 0;
        } completion:^(bool b){
            [self removeFromSuperview];
        }];
    }
}

-(void)composeMessageView{
    
    CGFloat height = 8;
    if (_titleString) {
        titleLabel.text = _titleString;
        titleLabel.frame = CGRectMake(0, height, baseView.bounds.size.width, 35);
        height += titleLabel.frame.size.height ;
        titleLabel.hidden = NO;
    }
    messageLabel.hidden = NO;
    messageLabel.text = _messageString;
    CGRect messageFit = [self sizeFit:_messageString];
    messageLabel.frame = CGRectMake(0, height, baseView.bounds.size.width, messageFit.size.height + 10);
    height += messageLabel.frame.size.height + 16;
    
    CGRect baseViewframe = baseView.frame;
    baseViewframe.origin.y = (self.bounds.size.height - height) / 2;
    baseViewframe.size.height = height;
    baseView.frame = baseViewframe;
    
    [[UIApplication sharedApplication].keyWindow addSubview:self];
}

-(void)setupForLoading{
    
    CGFloat height = 120;
    if (_titleString) {
        titleLabel.text = _titleString;
        titleLabel.frame = CGRectMake(0, 8, height, 35);
        titleLabel.hidden = NO;
    }
    
    imageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 47.5, 120, 55)];
    imageView.contentMode = UIViewContentModeScaleAspectFit;
    imageView.contentScaleFactor = 0.8;
    [baseView addSubview:imageView];
    
    _customView = [[UIView alloc]initWithFrame:CGRectMake(0, 35, 120, 85)];
    [baseView addSubview:_customView];
    
    CGRect baseViewframe = baseView.frame;
    baseViewframe.origin.y = (self.bounds.size.height - height) / 2;
    baseViewframe.origin.x = (self.bounds.size.width - height) / 2;
    baseViewframe.size.height = height;
    baseViewframe.size.width = height;
    baseView.frame = baseViewframe;
    [baseView setNeedsDisplay];
    
    [[UIApplication sharedApplication].keyWindow addSubview:self];
}

-(void)startAnimationShadow{
    CABasicAnimation *anim = [CABasicAnimation animationWithKeyPath:@"shadowRadius"];
    anim.fromValue = [NSNumber numberWithFloat:60];
    anim.toValue = [NSNumber numberWithFloat:120];
    anim.duration = 1.0;
    anim.autoreverses = YES;
    anim.repeatCount = INFINITY;
    [baseView.layer addAnimation:anim forKey:@"shadowRadius"];
    
}

-(void)startAnimationLoading{
    
    [CATransaction begin];
    [CATransaction setAnimationDuration:0.25];
    [CATransaction setCompletionBlock:^{
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [self startAnimationLoading];
        });
    }];
    
    
    CATransition *transition = [CATransition new];
    transition.type = kCATransitionFade;
    transition.subtype = kCATransitionFromBottom;
    [imageView.layer addAnimation:transition forKey:kCATransition];
    imageView.image = images[index];
    [CATransaction commit];
    
    index = index < images.count - 1 ? index + 1 : 0;
}

-(void)handlerbttn:(UIButton*)sender{
    if (sender == confirmBttn) {
        if (actionConfirm) { actionConfirm(); }
    }else{
        if (actionCancel) { actionCancel(); }
    }
    [self dismis:nil];
}

-(CGRect)sizeFit:(NSString*)stringSize{
    return [stringSize boundingRectWithSize:CGSizeMake(baseView.bounds.size.width - 20, CGFLOAT_MAX) options:(NSStringDrawingUsesLineFragmentOrigin|NSStringDrawingUsesFontLeading) attributes:nil context:nil];
}

-(void)withConfirm:(NSString *)titleConfirm onConfirm:(popUpHandler)sender{
    [confirmBttn setTitle:titleConfirm forState:UIControlStateNormal];
    [self onConfirm:sender];
}

-(void)withConfirm:(NSString *)titleConfirm onConfirm:(popUpHandler)confirm withCancel:(NSString *)titleCancel onCancel:(popUpHandler)cancel{
    [confirmBttn setTitle:titleConfirm forState:UIControlStateNormal];
    [cancelBttn setTitle:@"cancel" forState:UIControlStateNormal];
    [self onConfirm:confirm onCancel:cancel];
}

-(void)onConfirm:(popUpHandler)sender{
    actionConfirm = sender;
    _isDismissAble = NO;
    CGRect confirmframe = confirmBttn.frame;
    confirmframe.origin.y = messageLabel.frame.origin.y + messageLabel.bounds.size.height + 10;
    confirmframe.size.height = 35;
    confirmBttn.frame = confirmframe;
    confirmBttn.hidden = NO;
    [confirmBttn addTarget:self action:@selector(handlerbttn:) forControlEvents:UIControlEventTouchUpInside];
    
    CGFloat height = confirmBttn.frame.origin.y + confirmBttn.bounds.size.height + 8;
    
    CGRect baseViewframe = baseView.frame;
    baseViewframe.origin.y = (self.bounds.size.height - height) / 2;
    baseViewframe.size.height = height;
    baseView.frame = baseViewframe;
    [baseView setNeedsDisplay];
}

-(void)onConfirm:(popUpHandler)confirm onCancel:(popUpHandler)cancel{
    actionConfirm = confirm;
    actionCancel = cancel;
    _isDismissAble = NO;
    CGRect confirmframe = confirmBttn.frame;
    confirmframe.origin.y = messageLabel.frame.origin.y + messageLabel.bounds.size.height + 10;
    confirmframe.size.height = 35;
    confirmBttn.hidden = NO;
    confirmBttn.frame = confirmframe;
    [confirmBttn addTarget:self action:@selector(handlerbttn:) forControlEvents:UIControlEventTouchUpInside];
    
    CGRect cancelframe = cancelBttn.frame;
    cancelframe.origin.y = confirmframe.origin.y;
    cancelframe.size.height = 35;
    cancelBttn.hidden = NO;
    cancelBttn.frame = cancelframe;
    [cancelBttn addTarget:self action:@selector(handlerbttn:) forControlEvents:UIControlEventTouchUpInside];
    
    CGFloat height = cancelBttn.frame.origin.y + cancelBttn.bounds.size.height + 8;
    
    CGRect baseViewframe = baseView.frame;
    baseViewframe.origin.y = (self.bounds.size.height - height) / 2;
    baseViewframe.size.height = height;
    baseView.frame = baseViewframe;
    [baseView setNeedsDisplay];
}

+(void)stopProgress{
    for (UIView *vim in [UIApplication sharedApplication].keyWindow.subviews){
        if ([vim isKindOfClass:[popUp class]]) {
            [vim removeFromSuperview];
        }
    }
}

+(instancetype)showProgress{
    popUp *pop = [popUp new];
    pop.titleString = @"connecting";
    pop.messageString = @"connecting";
    pop.isDismissAble = NO;
    [pop setupForLoading];
    [pop startAnimationLoading];
    [pop startAnimationShadow];
    /*
     use 'pop.customView' to custom your loading progress
     */
    
    pop.alpha = 0;
    [UIView animateKeyframesWithDuration:defaultDuration delay:0 options:UIViewKeyframeAnimationOptionCalculationModeCubicPaced animations:^{
        pop.alpha = 1;
    } completion:nil];
    
    
    return pop;
}


+(instancetype)showMessage:(NSString *)message{
    popUp *pop = [popUp new];
    pop.messageString = message;
    [pop composeMessageView];
    
    pop.alpha = 0;
    [UIView animateKeyframesWithDuration:defaultDuration delay:0 options:UIViewKeyframeAnimationOptionCalculationModeCubicPaced animations:^{
        pop.alpha = 1;
    } completion:nil];
    
    
    return pop;
}

+(instancetype)showMessage:(NSString *)message withTitle:(NSString *)title{
    popUp *pop = [popUp new];
    pop.messageString = message;
    pop.titleString = title;
    [pop composeMessageView];
    
    pop.alpha = 0;
    [UIView animateKeyframesWithDuration:defaultDuration delay:0 options:UIViewKeyframeAnimationOptionCalculationModeCubicPaced animations:^{
        pop.alpha = 1;
    } completion:nil];
    
    return pop;
}

@end
