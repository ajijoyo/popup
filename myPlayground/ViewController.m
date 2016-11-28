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
    [[popUp showMessage:@"hello\nlagi lagi coba\nlagi gak papa" withTitle:@"coba title"]onConfirm:^{
        
    } onCancel:nil];
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
