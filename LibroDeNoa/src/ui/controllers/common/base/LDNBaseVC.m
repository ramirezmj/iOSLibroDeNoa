//
//  LDNBaseVC.m
//  LibroDeNoa
//
//  Created by Jose Manuel Ramírez Martínez on 22/11/15.
//  Copyright © 2015 Jose Manuel Ramírez Martínez. All rights reserved.
//

#import "LDNBaseVC.h"
#import "menuViewVC.h"
@interface LDNBaseVC ()

@property (strong, nonatomic) UIButton *menuButton;

@property (nonatomic, assign) CGFloat leftPadding;
@property (nonatomic, assign) CGFloat rightPadding;
@property (nonatomic, assign) CGFloat menuButtonTopPadding;
@property (nonatomic, assign) CGFloat nextPageBottomPadding;

@end

@implementation LDNBaseVC

#pragma mark - Life cycle

- (void)viewDidLoad {
    [super viewDidLoad];
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(notificationCallBack:)
                                                 name:nil object:nil];
    [self setupOverlayMenuButtons];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
    CGRect rect = CGRectMake(535, 25, 0, 0);
    _menuView = [[menuViewVC alloc] initWithFrameAux:rect];
    [self.view addSubview:_menuView];
    [LDNHelpers changeViewVisibility:_menuView];
}

- (void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self name:SoundDidFinishPlayingNotification object:nil];
}

#pragma mark - Public methods

- (void)notificationCallBack:(NSNotification *)notification{}

- (void)goToNextPage:(UIButton *)button{}

- (void)goToPreviousPage:(UIButton *)button{}

#pragma mark - Private methods

- (void)setupOverlayMenuButtons
{
    _leftPadding = 30;
    _rightPadding = self.view.bounds.size.width - 120;
    _menuButtonTopPadding = 30;
    _nextPageBottomPadding = self.view.bounds.size.height - 100;
    
    UIImage *nextPageImage = [UIImage imageNamed:@"next_page_button"];
    CGRect nextPageRect = CGRectMake(_rightPadding, _nextPageBottomPadding, nextPageImage.size.width/2, nextPageImage.size.height/2);
    
    self.nextPageButton = [[UIButton alloc] initWithFrame:nextPageRect];
    [_nextPageButton setBackgroundImage:nextPageImage forState:UIControlStateNormal];
    [_nextPageButton addTarget:self action:@selector(goToNextPage:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_nextPageButton];
    
    UIImage *menuButtonImage = [UIImage imageNamed:@"menu_button"];
    CGRect menuButtonRect = CGRectMake(_rightPadding, _menuButtonTopPadding, menuButtonImage.size.width/2, menuButtonImage.size.height/2);
    
    self.menuButton = [[UIButton alloc] initWithFrame:menuButtonRect];
    [_menuButton setBackgroundImage:menuButtonImage forState:UIControlStateNormal];
    [_menuButton addTarget:self action:@selector(openMenu:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_menuButton];
}

- (void)setupPreviousPageButton
{
    UIImage *previousPageImage = [UIImage imageNamed:@"previous_page_button"];
    CGRect previousPageRect = CGRectMake(_leftPadding, _nextPageBottomPadding, previousPageImage.size.width/2, previousPageImage.size.height/2);
    
    self.previousPageButton = [[UIButton alloc] initWithFrame:previousPageRect];
    [_previousPageButton setBackgroundImage:previousPageImage forState:UIControlStateNormal];
    [_previousPageButton addTarget:self action:@selector(goToPreviousPage:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_previousPageButton];
}

- (void)openMenu:(UIButton *)button
{
    [LDNHelpers changeViewVisibility:_menuView playingSound:nil];
}



@end
