//
//  menuViewVC.m
//  LibroDeNoa
//
//  Created by Jose Manuel Ramírez Martínez on 24/11/15.
//  Copyright © 2015 Jose Manuel Ramírez Martínez. All rights reserved.
//

#import "menuViewVC.h"

@implementation menuViewVC

- (id)initWithFrameAux:(CGRect)frame
{
    self = [[[NSBundle mainBundle] loadNibNamed:@"menuViewVC" owner:self options:nil] objectAtIndex:0];if (self) {
        self.frame = frame;
    }
    return self;
}

@end
