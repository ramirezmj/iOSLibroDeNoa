//
//  ViewController.m
//  LibroDeNoa
//
//  Created by Jose Manuel Ramírez Martínez on 18/11/15.
//  Copyright © 2015 Jose Manuel Ramírez Martínez. All rights reserved.
//

#import "LDNPageOneVC.h"
#import "SoundManager.h"
#import "LDNPageTwoVC.h"
#import "menuViewVC.h"

@interface LDNPageOneVC ()

/** TIETA **/
@property (weak, nonatomic) IBOutlet UIImageView *tietaCap;
@property (weak, nonatomic) IBOutlet UIImageView *tietaCos;
@property (weak, nonatomic) IBOutlet UIView *tietaContainerView;
@property (weak, nonatomic) IBOutlet UIView *tietaBafaradaContainerView;
@property (weak, nonatomic) IBOutlet UILabel *tietaBafaradaDialogLabel;
/** TIET **/
@property (weak, nonatomic) IBOutlet UIImageView *tietCap;
@property (weak, nonatomic) IBOutlet UIImageView *tietCos;
@property (weak, nonatomic) IBOutlet UIView *tietContainerView;
@property (weak, nonatomic) IBOutlet UIView *tietBafaradaContainerView;
@property (weak, nonatomic) IBOutlet UILabel *tietBafaradaDialogLabel;
/** PLANTES **/
@property (weak, nonatomic) IBOutlet UIImageView *plantaVerda;
@property (weak, nonatomic) IBOutlet UIImageView *plantesLiles;
@property (weak, nonatomic) IBOutlet UIImageView *plantaGroga;
/** CARLOTA **/
@property (weak, nonatomic) IBOutlet UIImageView *carlotaCos;
@property (weak, nonatomic) IBOutlet UIImageView *carlotaCap;
@property (weak, nonatomic) IBOutlet UIView *carlotaContainerView;
@property (weak, nonatomic) IBOutlet UIView *carlotaBafaradaContainerView;
@property (weak, nonatomic) IBOutlet UILabel *carlotaBafaradaDialogLabel;
/** MERLI **/
@property (weak, nonatomic) IBOutlet UIImageView *merli;
@property (weak, nonatomic) IBOutlet UIView *merliContainerView;
@property (weak, nonatomic) IBOutlet UIView *merliBafaradaContainerView;
@property (weak, nonatomic) IBOutlet UILabel *merliBafaradaDialogLabel;
/** CARRET **/
@property (weak, nonatomic) IBOutlet UIImageView *carret;
/** OCELL **/
@property (weak, nonatomic) IBOutlet UIImageView *ocell;
@property (weak, nonatomic) IBOutlet UIView *ocellContainerView;
/** SARGANTANA **/
@property (weak, nonatomic) IBOutlet UIImageView *sargantana;
@property (weak, nonatomic) IBOutlet UIView *sargantanaContainerView;

/** OTHER **/
@property (weak, nonatomic) IBOutlet UILabel *storyTellerLabel;

/** Private properties **/
@property (strong, nonatomic) NSArray *tietaDialogsArray;
@property (strong, nonatomic) NSArray *tietaSoundsArray;
@property (strong, nonatomic) NSArray *tietDialogsArray;
@property (strong, nonatomic) NSArray *tietSoundsArray;
@property (strong, nonatomic) NSArray *carlotaDialogsArray;
@property (strong, nonatomic) NSArray *carlotaSoundsArray;
@property (strong, nonatomic) NSArray *merliDialogsArray;
@property (strong, nonatomic) NSArray *merliSoundsArray;

/** Animations **/
@property (nonatomic, assign) BOOL tietEstatic;
@property (nonatomic, assign) BOOL tietaEstatic;

@end

@implementation LDNPageOneVC

#pragma mark - Life cycle

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self setupDialogs];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    [self configAnimations];
}

#pragma mark - Sounds Section

- (void)notificationCallBack:(NSNotification *)notification
{
    if ([[notification name] isEqualToString:SoundDidFinishPlayingNotification]) {
        Sound *sound = (Sound *)[notification object];
        // NSLog(@"%@", sound.name);
        // TODO...
        if ([[sound name] isEqualToString:@"copfusta_tiet2.mp3"]) {
            [self configTietNormal];
            [_tietCos startAnimating];
        }
    }
}
#pragma mark - Dialogs Setup

- (void)setupDialogs
{
    [_SoundManager playMusic:@"BG04.07_hort_comodi.mp3" looping:YES fadeIn:YES];
    [_SoundManager playSound:NSLocalizedString(@"NARRATOR_PAGE_1_MP3_FAST", nil)];
    
    _storyTellerLabel.text = NSLocalizedString(@"NARRATOR_PAGE_1_TEXT", nil);
    
    _tietaDialogsArray = @[NSLocalizedString(@"BAFARADA_TIETA_1_PAGE_1", nil),
                           NSLocalizedString(@"BAFARADA_TIETA_2_PAGE_1", nil),
                           NSLocalizedString(@"BAFARADA_TIETA_3_PAGE_1", nil)];
    
    _tietaSoundsArray = @[NSLocalizedString(@"BAFARADA_SOUND_ID_7", nil),
                           NSLocalizedString(@"BAFARADA_SOUND_ID_8", nil),
                           NSLocalizedString(@"BAFARADA_SOUND_ID_9", nil)];

    _tietDialogsArray = @[NSLocalizedString(@"BAFARADA_TIET_1_PAGE_1", nil),
                          NSLocalizedString(@"BAFARADA_TIET_2_PAGE_1", nil),
                          NSLocalizedString(@"BAFARADA_TIET_3_PAGE_1", nil)];
     _tietSoundsArray = @[NSLocalizedString(@"BAFARADA_SOUND_ID_10", nil),
                            NSLocalizedString(@"BAFARADA_SOUND_ID_11", nil),
                            NSLocalizedString(@"BAFARADA_SOUND_ID_12", nil)];
    
    _carlotaDialogsArray = @[NSLocalizedString(@"BAFARADA_NOA_1_PAGE_1", nil),
                             NSLocalizedString(@"BAFARADA_NOA_2_PAGE_1", nil),
                             NSLocalizedString(@"BAFARADA_NOA_3_PAGE_1", nil)];
      _carlotaSoundsArray = @[NSLocalizedString(@"BAFARADA_SOUND_ID_4", nil),
                             NSLocalizedString(@"BAFARADA_SOUND_ID_5", nil),
                             NSLocalizedString(@"BAFARADA_SOUND_ID_6", nil)];
    
    _merliDialogsArray = @[NSLocalizedString(@"BAFARADA_GAT_1_PAGE_1", nil),
                           NSLocalizedString(@"BAFARADA_GAT_2_PAGE_1", nil),
                           NSLocalizedString(@"BAFARADA_GAT_3_PAGE_1", nil)];
       _merliSoundsArray = @[NSLocalizedString(@"BAFARADA_SOUND_ID_1", nil),
                              NSLocalizedString(@"BAFARADA_SOUND_ID_2", nil),
                              NSLocalizedString(@"BAFARADA_SOUND_ID_3", nil)];
}

#pragma mark - Animations Section

- (void)configAnimations
{
    [self animateStaticAnimations];
    [self animateEnviroment];
}

- (void)animateStaticAnimations
{
    [self configTietNormal];
    [_tietCos startAnimating];
    
    [self configTietaNormal];
    [_tietaCap startAnimating];
    [_tietaCos startAnimating];
    
    [self configCarlotaNormal];
    [_carlotaCap startAnimating];
}

- (void)animateEnviroment
{
    [self configPlantes];
    [_plantaGroga startAnimating];
    [_plantaVerda startAnimating];
    [_plantesLiles startAnimating];
}

- (void)animateTietaParlant
{
    [self configTietaParlant];
    [_tietaCap startAnimating];
}

- (void)animateTietaGirant
{
    [self configTietaGirant];
    [_tietaCap startAnimating];
}

/** Tiet **/

- (void)configTietNormal
{
    _tietEstatic = YES;
    UIImage *tiet_cos1 = [UIImage imageNamed:@"01_tiet_estatic"];
    UIImage *tiet_cos2 = [UIImage imageNamed:@"01_tiet_copet_destral1"];
    
    NSArray *images = @[tiet_cos1, tiet_cos2];
    [_tietCos setAnimationImages:images];
    [_tietCos setAnimationDuration:2.0];
    [_tietCos setAnimationRepeatCount:0];
}

- (void)configTietTronc
{
    _tietEstatic = NO;
    UIImage *tronc1 = [UIImage imageNamed:@"01_tiet_Partint_tronc1"];
    UIImage *tronc2 = [UIImage imageNamed:@"01_tiet_Partint_tronc2"];
    UIImage *tronc3 = [UIImage imageNamed:@"01_tiet_Partint_tronc3"];
    
    NSArray *images = @[tronc1, tronc2, tronc3];
    [_tietCos setAnimationImages:images];
    [_tietCos setAnimationDuration:1.0];
    [_tietCos setAnimationRepeatCount:1];
}

/** Tieta **/

- (void)configTietaNormal
{
    _tietaEstatic = YES;
    
    // Normal
    UIImage *tieta_cap1 = [UIImage imageNamed:@"01_tieta_cap_estatica"];
    UIImage *tieta_cap2 = [UIImage imageNamed:@"01_tieta_cap_ullcanto_01"];
    UIImage *tieta_cap3 = [UIImage imageNamed:@"01_tieta_cap_ullcanto_02"];
    
    NSArray *imagesCap = @[tieta_cap1, tieta_cap2, tieta_cap3];
    [_tietaCap setAnimationImages:imagesCap];
    [_tietaCap setAnimationDuration:5.0];
    [_tietaCap setAnimationRepeatCount:0];

    // Regant
    UIImage *tieta_cos1 = [UIImage imageNamed:@"01_tieta_estatica"];
    UIImage *tieta_cos2 = [UIImage imageNamed:@"01_tieta_Regant_01"];
    UIImage *tieta_cos3 = [UIImage imageNamed:@"01_tieta_Regant_02"];
    
    NSArray *images = @[tieta_cos1, tieta_cos2, tieta_cos3, tieta_cos2, tieta_cos3, tieta_cos2, tieta_cos3,tieta_cos1,tieta_cos1, tieta_cos1];
    [_tietaCos setAnimationImages:images];
    [_tietaCos setAnimationDuration:5.0];
    [_tietaCos setAnimationRepeatCount:0];
}

- (void)configTietaGirant
{
    // Girant-se
    UIImage *tieta_cap_girat1 = [UIImage imageNamed:@"01_tieta_cap_ullcanto_01"];
    UIImage *tieta_cap_girat2 = [UIImage imageNamed:@"01_tieta_cap_ullcanto_02"];
    UIImage *tieta_cap_girat3 = [UIImage imageNamed:@"01_tieta_cap_Ullscara_01"];
    UIImage *tieta_cap_girat4 = [UIImage imageNamed:@"01_tieta_cap_Ullscara_02"];
    
    NSArray *imagesCap_girant = @[tieta_cap_girat1, tieta_cap_girat2, tieta_cap_girat3, tieta_cap_girat4];
    [_tietaCap setAnimationImages:imagesCap_girant];
    [_tietaCap setAnimationDuration:5.0];
    [_tietaCap setAnimationRepeatCount:1];
}

- (void)configTietaParlant
{
    // Parlant
    UIImage *tieta_cap_parlant1 = [UIImage imageNamed:@"01_tieta_cap_parlantcara_01"];
    UIImage *tieta_cap_parlant2 = [UIImage imageNamed:@"01_tieta_cap_parlantcara_02"];
    
    NSArray *imagesCap_parlant = @[tieta_cap_parlant1, tieta_cap_parlant2];
    [_tietaCap setAnimationImages:imagesCap_parlant];
    [_tietaCap setAnimationDuration:1.0];
    [_tietaCap setAnimationRepeatCount:3];
}

/** Carlota **/

- (void)configCarlotaNormal
{
    UIImage *carlota_cap1 = [UIImage imageNamed:@"01_Carlota_Estatica"];
    UIImage *carlota_cap2 = [UIImage imageNamed:@"01_Carlota_Ulls_01"];
    
    NSArray *images = @[carlota_cap1, carlota_cap2];
    [_carlotaCap setAnimationImages:images];
    [_carlotaCap setAnimationDuration:5.0];
    [_carlotaCap setAnimationRepeatCount:0];
}

/** Plantes **/

- (void)configPlantes
{
    UIImage *planta_groga1 = [UIImage imageNamed:@"01_planta groga1"];
    UIImage *planta_groga2 = [UIImage imageNamed:@"01_planta groga2"];
    
    NSArray *images1 = @[planta_groga1,planta_groga2];
    [_plantaGroga setAnimationImages:images1];
    [_plantaGroga setAnimationDuration:4.5];
    [_plantaGroga setAnimationRepeatCount:0];
    
    UIImage *planta_verda1 = [UIImage imageNamed:@"01_planta Verda1"];
    UIImage *planta_verda2 = [UIImage imageNamed:@"01_planta Verda2"];
    
    NSArray *images2 = @[planta_verda1, planta_verda2];
    [_plantaVerda setAnimationImages:images2];
    [_plantaVerda setAnimationDuration:5.0];
    [_plantaVerda setAnimationRepeatCount:0];
    
    UIImage *plantes_liles1 = [UIImage imageNamed:@"01_plantes liles1"];
    UIImage *plantes_liles2 = [UIImage imageNamed:@"01_plantes liles2"];
    
    NSArray *images3 = @[plantes_liles1, plantes_liles2];
    [_plantesLiles setAnimationImages:images3];
    [_plantesLiles setAnimationDuration:4.0];
    [_plantesLiles setAnimationRepeatCount:0];
}

#pragma mark - IBActions methods

- (IBAction)didPressTietAxe:(UIButton *)sender
{
    // Paramos animacion primera
    if (_tietEstatic) {
        [_tietCos stopAnimating];
        
        [self configTietTronc];
        [_tietCos startAnimating];
    }
    [_SoundManager prepareToPlayWithSound:@"copfusta_tiet2.mp3"];
    [_SoundManager playSound:@"copfusta_tiet2.mp3"];
}

- (IBAction)didPressTietCap:(UIButton *)sender
{
    int idDialog = [LDNHelpers getRandomBafarada:_tietDialogsArray];
    _tietBafaradaDialogLabel.text    = _tietDialogsArray[idDialog];
    [LDNHelpers changeViewVisibility:_tietBafaradaContainerView playingSound:_tietSoundsArray[idDialog]];
}

- (IBAction)didPressCarlotaCap:(UIButton *)sender
{
    int idDialog = [LDNHelpers getRandomBafarada:_carlotaDialogsArray];
    _carlotaBafaradaDialogLabel.text = _carlotaDialogsArray[idDialog];
    [LDNHelpers changeViewVisibility:_carlotaBafaradaContainerView playingSound:_carlotaSoundsArray[idDialog]];
}

- (IBAction)didPressMerli:(UIButton *)sender
{
    int idDialog = [LDNHelpers getRandomBafarada:_merliDialogsArray];
    _merliBafaradaDialogLabel.text   = _merliDialogsArray[idDialog];
    [LDNHelpers changeViewVisibility:_merliBafaradaContainerView playingSound:_merliSoundsArray[idDialog]];
}

- (IBAction)didPressTietaCap:(UIButton *)sender
{
    int idDialog = [LDNHelpers getRandomBafarada:_tietaDialogsArray];
    _tietaBafaradaDialogLabel.text   = _tietaDialogsArray[idDialog];
    [LDNHelpers changeViewVisibility:_tietaBafaradaContainerView playingSound:_tietaSoundsArray[idDialog]];
}

- (IBAction)didPressOcell:(UIButton *)sender
{
    NSLog(@"didPressOcell");
}

- (IBAction)didPressSargantana:(UIButton *)sender
{
    NSLog(@"didpressSargantana");
}

#pragma mark - Base Methods

- (void)goToNextPage:(UIButton *)button;
{
    NSLog(@"Next page button clicked");
    [self performSegueWithIdentifier:@"pageOneToPageTwoSegue" sender:nil];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue identifier] isEqualToString:@"pageOneToPageTwoSegue"]) {
        LDNPageTwoVC *pageTwoVC = segue.destinationViewController;
    }
}

@end
