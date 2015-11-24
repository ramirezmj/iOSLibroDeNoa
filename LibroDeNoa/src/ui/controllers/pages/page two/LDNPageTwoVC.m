//
//  LDNPageTwoVC.m
//  LibroDeNoa
//
//  Created by Jose Manuel Ramírez Martínez on 22/11/15.
//  Copyright © 2015 Jose Manuel Ramírez Martínez. All rights reserved.
//

#import "LDNPageTwoVC.h"

@interface LDNPageTwoVC ()

@end

@implementation LDNPageTwoVC

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.nextPageButton setHidden:YES];
    [self setupPreviousPageButton];
    // Do any additional setup after loading the view.
}

- (void)goToPreviousPage:(UIButton *)button
{
    [self dismissViewControllerAnimated:NO completion:nil];
}

@end
