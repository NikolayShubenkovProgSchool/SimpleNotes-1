//
//  PSRDetailViewController.m
//  SimpleNotes
//
//  Created by Daniil Korotin on 24.04.14.
//  Copyright (c) 2014 Daniil Korotin. All rights reserved.
//

#import "PSRDetailViewController.h"
#import "PSRColorSelectorViewController.h"
@interface PSRDetailViewController () <PSRColorSelectorViewControllerDelegate>

@end

@implementation PSRDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.textView = [[UITextView alloc] initWithFrame:self.view.bounds];
    [self.view addSubview:self.textView];
    
    if (self.note) {
        self.textView.text = self.note.text;
        self.textView.textColor=self.note.color;
    }
    
    self.navigationItem.title = self.note.text;
    
    UIBarButtonItem *cancelButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemCancel target:self action:@selector(cancel)];
    
    


    
   // UIImage*shriftImage=[UIImage imageNamed:@"color_choose.jpeg"];
    UIImage*colorImage=[UIImage imageNamed:@"color_choose.png"];

    NSAssert(colorImage,@"картинка не создана");
    
    UIBarButtonItem*colorButton=[[UIBarButtonItem alloc]initWithImage:colorImage
                                                                style:UIBarButtonItemStylePlain
                                                               target:self
                                                               action:@selector(colorAction:)];
    
    
    self.navigationItem.rightBarButtonItem = colorButton;
}


-(void) colorAction:(UIBarButtonItem*)sender{
    
    UIStoryboard*currentStoryboard=[UIStoryboard storyboardWithName:@"Storyboard" bundle:nil];   //почему то теряется ссылка self.storyboard

    PSRColorSelectorViewController*colorController=[currentStoryboard instantiateViewControllerWithIdentifier:@"PSRColorSelectorViewController"];
    NSAssert(colorController,@"viewController не создан");
    
    colorController.delegate=self;
    [self.navigationController pushViewController:colorController animated:YES];
    
}

- (void)cancel {
    
}

- (void)viewWillDisappear:(BOOL)animated {
    self.note.text = self.textView.text;
    self.note.color=self.textView.textColor;

}


#pragma mark - PSRColorSelectorViewControllerDelegate

-(void)colorChangedWithColor:(UIColor*) color{
    
    self.textView.textColor=color;
}

@end
