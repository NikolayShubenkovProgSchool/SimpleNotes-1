//
//  PSRFontsViewController.m
//  SimpleNotes
//
//  Created by Eugeniy Popov on 24.09.14.
//  Copyright (c) 2014 Daniil Korotin. All rights reserved.
//

#import "PSRFontsViewController.h"

@interface PSRFontsViewController ()

@end

@implementation PSRFontsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    

}


#pragma mark - UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
    NSArray*fontsFamily=[UIFont familyNames];
    NSString*familyName=[fontsFamily objectAtIndex:indexPath.section];
    NSArray*fontsInFamily=[UIFont fontNamesForFamilyName:familyName];
    
    NSString*fontName=[fontsInFamily objectAtIndex:indexPath.row];
    
    
    UIFont*font=[UIFont fontWithName:fontName size:15];
    
    [self.delegate changeFontWith:font];
    
    [self.navigationController popViewControllerAnimated:YES];
    
}


#pragma mark - UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return [[UIFont familyNames]count];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    NSArray*fontsFamily=[UIFont familyNames];
    NSString*familyName=[fontsFamily objectAtIndex:section];
    NSArray*fontsInFamily=[UIFont fontNamesForFamilyName:familyName];
    
    return [fontsInFamily count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString*identifier=@"Cell";
    UITableViewCell* cell=[tableView dequeueReusableCellWithIdentifier:identifier];
    
    if (!cell) {
        cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    
#warning не круто при каждом запросе ячеек сканировать все шрифты системы, лучше это сделать один раз в методе  viewDidLoad  
#warning также отсортируйте, пожалуйста шрифты каким-нибудь образом, например по алфавиту.
    NSArray*fontsFamily=[UIFont familyNames];
    NSString*familyName=[fontsFamily objectAtIndex:indexPath.section];
    NSArray*fontsInFamily=[UIFont fontNamesForFamilyName:familyName];
    
    NSString*fontName=[fontsInFamily objectAtIndex:indexPath.row];
    
    
    UIFont*font=[UIFont fontWithName:fontName size:15];
    
    cell.textLabel.text=fontName;
    cell.textLabel.font=font;
    

    return cell;
    
}


- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    
    NSArray*fontsFamily=[UIFont familyNames];
    NSString*familyName=[fontsFamily objectAtIndex:section];
    
    return familyName;
}

@end
