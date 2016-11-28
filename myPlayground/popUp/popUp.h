//
//  popUp.h
//  myPlayground
//
//  Created by Dealjava on 11/28/16.
//  Copyright © 2016 proto. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^popUpHandler)();

@interface popUp : UIView
{
    popUpHandler actionConfirm;
    popUpHandler actionCancel;
    
    UIView *baseView;
    UIImageView *imageView;
    UILabel *titleLabel;
    UILabel *messageLabel;
    UIButton *confirmBttn;
    UIButton *cancelBttn;
    NSInteger index;
    
    NSArray *images;
}
@property(nonatomic,strong) UIView *customView;
@property(nonatomic,assign) bool isDismissAble;
@property(nonatomic,strong) NSString *messageString;
@property(nonatomic,strong) NSString *titleString;


+(instancetype)showMessage:(NSString*)message;
+(instancetype)showMessage:(NSString*)message withTitle:(NSString*)title;
+(instancetype)showProgress;
+(void)stopProgress;

-(void)onConfirm:(popUpHandler)sender;
-(void)onConfirm:(popUpHandler)confirm onCancel:(popUpHandler)cancel;
-(void)withConfirm:(NSString*)titleConfirm onConfirm:(popUpHandler)sender;
-(void)withConfirm:(NSString*)titleConfirm onConfirm:(popUpHandler)confirm withCancel:(NSString*)titleCancel  onCancel:(popUpHandler)cancel;


@end
