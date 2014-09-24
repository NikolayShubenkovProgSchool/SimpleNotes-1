//
//  PSRColorSelectorViewController.m
//  SimpleNotes
//
//  Created by Eugeniy Popov on 24.09.14.
//  Copyright (c) 2014 Daniil Korotin. All rights reserved.
//

#import "PSRColorSelectorViewController.h"

@interface PSRColorSelectorViewController ()

@end

@implementation PSRColorSelectorViewController

- (void)viewDidLoad {
    [super viewDidLoad];
        self.navigationItem.title = @"Настройки";

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];

}

#pragma mark - Private

-(void) updateColor{
    
    
    CGFloat r=self.redSlider.value;
    CGFloat g=self.greenSlider.value;
    CGFloat b=self.blueSlider.value;
    
    UIColor*color=[UIColor colorWithRed:r green:g blue:b alpha:1];
    
    self.colorTestView.backgroundColor=color;
    
    [self.delegate colorChangedWithColor:color];
}



#pragma mark - Actions

- (IBAction)changeSliderAction:(UISlider *)sender {
    
    [self updateColor];
    
}


@end
