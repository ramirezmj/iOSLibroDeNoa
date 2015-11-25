//
//  LDNHelpers.m
//  LibroDeNoa
//
//  Created by Jose Manuel Ramírez Martínez on 22/11/15.
//  Copyright © 2015 Jose Manuel Ramírez Martínez. All rights reserved.
//

#import "LDNHelpers.h"

@implementation LDNHelpers

+ (void)changeViewVisibility:(UIView *)view playingSound:(NSString *)sound
{
    if (view.isHidden) {
        view.hidden = NO;
        [_SoundManager prepareToPlayWithSound:sound];
        [_SoundManager playSound:sound];
    } else {
        view.hidden = YES;
    }
}

+ (void)changeButtonVisibility:(UIButton *)button
{
    if (button.isHidden) {
        button.hidden = NO;
    } else {
        button.hidden = YES;
    }
}

+ (int)getRandomBafarada:(NSArray *)dialogs
{
    return arc4random() % ([dialogs count]);
}

+ (void)changeViewVisibility:(UIView *)view
{
    [self changeViewVisibility:view playingSound:nil];
}

@end
