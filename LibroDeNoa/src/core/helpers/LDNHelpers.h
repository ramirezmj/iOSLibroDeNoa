//
//  LDNHelpers.h
//  LibroDeNoa
//
//  Created by Jose Manuel Ramírez Martínez on 22/11/15.
//  Copyright © 2015 Jose Manuel Ramírez Martínez. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LDNHelpers : NSObject

+ (void)changeViewVisibility:(UIView *)view playingSound:(NSString *)sound;
+ (void)changeViewVisibility:(UIView *)view;
+ (int)getRandomBafarada:(NSArray *)dialogs;
+ (void)changeButtonVisibility:(UIButton *)button;

@end
