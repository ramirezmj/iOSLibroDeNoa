//
//  menuViewVC.h
//  LibroDeNoa
//
//  Created by Jose Manuel Ramírez Martínez on 24/11/15.
//  Copyright © 2015 Jose Manuel Ramírez Martínez. All rights reserved.
//

#import <UIKit/UIKit.h>
@class menuViewVC;

@protocol MenuViewDelegate <NSObject>

@required
- (void)didFinishLoadingMenuView:(menuViewVC *)sender;

@end

@interface menuViewVC : UIView

@property (nonatomic, weak) id <MenuViewDelegate> delegate;

- (id)initWithFrameAux:(CGRect)frame andDelegate:(id<MenuViewDelegate>)delegate;

@end
