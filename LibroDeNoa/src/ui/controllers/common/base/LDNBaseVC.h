//
//  LDNBaseVC.h
//  LibroDeNoa
//
//  Created by Jose Manuel Ramírez Martínez on 22/11/15.
//  Copyright © 2015 Jose Manuel Ramírez Martínez. All rights reserved.
//

@interface LDNBaseVC : UIViewController

@property (strong, nonatomic) UIButton *previousPageButton;
@property (strong, nonatomic) UIButton *nextPageButton;

- (void)setupPreviousPageButton;
- (void)goToNextPage:(UIButton *)button;
- (void)goToPreviousPage:(UIButton *)button;

@end
