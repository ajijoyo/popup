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
    UILabel *titleLabel;
    UILabel *messageLabel;
    UIButton *confirmBttn;
    UIButton *cancelBttn;
}

@property(nonatomic,assign) bool isDismissAble;
@property(nonatomic,strong) NSString *messageString;
@property(nonatomic,strong) NSString *titleString;

+(instancetype)showMessage:(NSString*)message;
+(instancetype)showMessage:(NSString*)message withTitle:(NSString*)title;

-(void)onConfirm:(popUpHandler)sender;
-(void)onConfirm:(popUpHandler)confirm onCancel:(popUpHandler)cancel;
@end
