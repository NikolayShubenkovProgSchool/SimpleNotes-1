//
//  PSRDetailViewController.m
//  SimpleNotes
//
//  Created by Daniil Korotin on 24.04.14.
//  Copyright (c) 2014 Daniil Korotin. All rights reserved.
//

#import "PSRDetailViewController.h"
#import "PSRColorSelectorViewController.h"
#import "PSRFontsViewController.h"
@interface PSRDetailViewController () <PSRColorSelectorViewControllerDelegate,PSRFontsViewControllerDelegate>

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
        self.textView.font=self.note.font;
    }
    
    self.navigationItem.title = self.note.text;
    

    
    
    UIImage*colorImage=[UIImage imageNamed:@"color_choose.png"];
    
    NSAssert(colorImage,@"картинка не создана");
    /*
    UIBarButtonItem*colorButton=[[UIBarButtonItem alloc]initWithImage:colorImage
                                                                style:UIBarButtonItemStylePlain
                                                               target:self
                                                               action:@selector(colorAction:)];
     */
    

    UIBarButtonItem *colorButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemCompose
                                                                                 target:self
                                                                                 action:@selector(colorAction:)];
    UIBarButtonItem *fontsButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemOrganize
                                                                                 target:self
                                                                                 action:@selector(fontsAction)];
    
    self.navigationItem.rightBarButtonItems = @[fontsButton,colorButton];
}

- (void)viewWillDisappear:(BOOL)animated {
    
    self.note.text = self.textView.text;
    self.note.color=self.textView.textColor;
    self.note.font=self.textView.font;
    
}


#pragma mark - Actions

-(void) colorAction:(UIBarButtonItem*)sender{
#warning тут можно сделать несколько иначе, это позволит отвязать контроллер от названия сторибоард файла, которое может поменятсья в любой момент
    self.storyboard;
    UIStoryboard*currentStoryboard=[UIStoryboard storyboardWithName:@"Storyboard" bundle:nil];   //почему то теряется ссылка self.storyboard

    PSRColorSelectorViewController*colorController=[currentStoryboard instantiateViewControllerWithIdentifier:@"PSRColorSelectorViewController"];
    NSAssert(colorController,@"viewController не создан");
    
    colorController.delegate=self;
    [self.navigationController pushViewController:colorController animated:YES];
    
}

- (void)fontsAction {
    
    UIStoryboard*currentStoryboard=[UIStoryboard storyboardWithName:@"Storyboard" bundle:nil];   //почему то теряется ссылка self.storyboard
#warning а сделайте через performSegue
    PSRColorSelectorViewController*fontController=[currentStoryboard instantiateViewControllerWithIdentifier:@"PSRFontsViewController"];
    NSAssert(fontController,@"PSRFontsViewController не создан");
    
    fontController.delegate=self;
    [self.navigationController pushViewController:fontController animated:YES];
}


#pragma mark - PSRFontsViewControllerDelegate

-(void) changeFontWith:(UIFont*)font{

    self.textView.font=font;
}


#pragma mark - PSRColorSelectorViewControllerDelegate

-(void)colorChangedWithColor:(UIColor*) color{
    
    self.textView.textColor=color;
}

@end
