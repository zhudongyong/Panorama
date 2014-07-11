//
//  ViewController.m
//  SphereView
//
//  Created by zhudongyong on 14-7-5.
//  Copyright (c) 2014年 MyCompony. All rights reserved.
//

#import "ViewController.h"
#import "PanoramVC.h"
#import "SpinVC.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (BOOL)prefersStatusBarHidden {
    return YES;
}

#pragma mark - IBAction
- (IBAction)showSpinView:(id)sender {
    PanoramVC *vc = [[PanoramVC alloc] initWithNibName:@"PanoramVC" bundle:nil];
    vc.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
    
    [self presentViewController:vc
                       animated:YES
                     completion:nil];
}

- (IBAction)showSphereView:(id)sender {
    SpinVC *vc = [[SpinVC alloc] initWithNibName:@"SpinVC" bundle:nil];
    vc.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
    
    [self presentViewController:vc
                       animated:YES
                     completion:nil];
}


@end
