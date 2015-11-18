//
//  ViewController.m
//  LibroDeNoa
//
//  Created by Jose Manuel Ramírez Martínez on 18/11/15.
//  Copyright © 2015 Jose Manuel Ramírez Martínez. All rights reserved.
//

#import "ViewController.h"
#import "SoundManager.h"
#define _SoundManager [SoundManager sharedManager]

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UIImageView *tietCap;
@property (weak, nonatomic) IBOutlet UIImageView *tietCos;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [_SoundManager playMusic:@"BG04.07_hort_comodi.mp3" looping:YES fadeIn:YES];
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(notificationCallBack:)
                                                 name:nil object:nil];
    
    [self configTietNormal];
    [_tietCos startAnimating];
}

- (void)dealloc
{
    
}

- (void)notificationCallBack:(NSNotification *)notification
{
    if ([[notification name] isEqualToString:SoundDidFinishPlayingNotification]) {
        Sound *sound = (Sound *)[notification object];
        NSLog(@"%@", sound.name);
        // TODO...
        if ([[sound name] isEqualToString:@"copfusta_tiet2.mp3"]) {
            [self configTietNormal];
            [_tietCos startAnimating];
        }
    }
}

- (void)configTietNormal
{
    tietEstatic = YES;
    UIImage *tiet_cos1 = [UIImage imageNamed:@"01_tiet_estatic"];
    UIImage *tiet_cos2 = [UIImage imageNamed:@"01_tiet_copet_destral1"];
    
    NSArray *images = @[tiet_cos1, tiet_cos2];
    [_tietCos setAnimationImages:images];
    [_tietCos setAnimationDuration:2.0];
    [_tietCos setAnimationRepeatCount:0];
}

- (void)configTietTronc
{
    tietEstatic = NO;
    UIImage *tronc1 = [UIImage imageNamed:@"01_tiet_Partint_tronc1"];
    UIImage *tronc2 = [UIImage imageNamed:@"01_tiet_Partint_tronc2"];
    UIImage *tronc3 = [UIImage imageNamed:@"01_tiet_Partint_tronc3"];
    
    NSArray *images = @[tronc1, tronc2, tronc3];
    [_tietCos setAnimationImages:images];
    [_tietCos setAnimationDuration:1.5];
    [_tietCos setAnimationRepeatCount:1];
}

- (IBAction)clickTronc:(UIButton *)sender
{
    // Paramos animacion primera
    if (tietEstatic) {
    [_tietCos stopAnimating];
    
    [self configTietTronc];
    [_tietCos startAnimating];
    }
    [_SoundManager prepareToPlayWithSound:@"copfusta_tiet2.mp3"];
    [_SoundManager playSound:@"copfusta_tiet2.mp3"];
}
@end
