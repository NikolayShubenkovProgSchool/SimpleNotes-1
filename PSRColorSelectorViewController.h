//
//  PSRColorSelectorViewController.h
//  SimpleNotes
//
//  Created by Eugeniy Popov on 24.09.14.
//  Copyright (c) 2014 Daniil Korotin. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol PSRColorSelectorViewControllerDelegate;

@interface PSRColorSelectorViewController : UIViewController
@property (weak, nonatomic) IBOutlet UISlider *redSlider;
@property (weak, nonatomic) IBOutlet UISlider *greenSlider;
@property (weak, nonatomic) IBOutlet UISlider *blueSlider;

@property (weak, nonatomic) IBOutlet UIView *colorTestView;

@property (weak,nonatomic) id <PSRColorSelectorViewControllerDelegate>  delegate;

- (IBAction)changeSliderAction:(UISlider *)sender;
@end

@protocol PSRColorSelectorViewControllerDelegate <NSObject>

-(void)colorChangedWithColor:(UIColor*) color;

@end
