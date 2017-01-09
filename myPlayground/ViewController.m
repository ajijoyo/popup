//
//  ViewController.m
//  myPlayground
//
//  Created by Dealjava on 11/28/16.
//  Copyright © 2016 proto. All rights reserved.
//

#import "ViewController.h"
#import "popUp.h"

@interface ViewController ()

@end

@implementation ViewController

- (IBAction)showing:(id)sender {
    [[popUp showMessage:@"lorem ipsum\nipsum ipsum" withTitle:@"with title"]
     withConfirm:@"confirm" onConfirm:^{
         [self time];
     }withCancel:@"cancel" onCancel:^{
     
     }];
}
//
-(void)time{
    [popUp showProgress];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [popUp stopProgress];
    });
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
}

-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
