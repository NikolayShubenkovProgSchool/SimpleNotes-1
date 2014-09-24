//
//  PSRFontsViewController.h
//  SimpleNotes
//
//  Created by Eugeniy Popov on 24.09.14.
//  Copyright (c) 2014 Daniil Korotin. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol PSRFontsViewControllerDelegate;

@interface PSRFontsViewController : UITableViewController

@property (nonatomic,weak) id <PSRFontsViewControllerDelegate> delegate;


@end

@protocol PSRFontsViewControllerDelegate <NSObject>

-(void) changeFontWith:(UIFont*)font;

@end