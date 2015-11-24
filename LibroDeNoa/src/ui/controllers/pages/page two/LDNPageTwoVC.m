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

- (IBAction)purchaseButtonPressed:(UIButton *)sender
{
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"Lazy Error" message:@"You are not able to continue with the purchase because the dev hans't coded this part" preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction *ok = [UIAlertAction actionWithTitle:@"Ok" style:UIAlertActionStyleDefault handler:nil];
    
    [alertController addAction:ok];
    
    [self presentViewController:alertController animated:YES completion:nil];
    
}

@end
