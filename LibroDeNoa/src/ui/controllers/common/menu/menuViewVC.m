//
//  menuViewVC.m
//  LibroDeNoa
//
//  Created by Jose Manuel Ramírez Martínez on 24/11/15.
//  Copyright © 2015 Jose Manuel Ramírez Martínez. All rights reserved.
//

#import "menuViewVC.h"

@implementation menuViewVC

- (id)initWithFrameAux:(CGRect)frame andDelegate:(id<MenuViewDelegate>)delegate
{
    self = [[[NSBundle mainBundle] loadNibNamed:@"menuViewVC" owner:self options:nil] objectAtIndex:0];if (self) {
        self.frame = frame;
        self.delegate = delegate;
    }
    return self;
}

- (void)myMethod
{
    [self.delegate didFinishLoadingMenuView:self];
}
     
- (void)didFinishLoadingMenuView:(menuViewVC *)sender
{
    NSLog(@"didFinishLoadingMenuView");
}

@end
