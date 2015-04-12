//
//  JESALibraryViewController.m
//  HackerBooks2
//
//  Created by José Enrique Sanchez on 12/4/15.
//  Copyright (c) 2015 Devappify. All rights reserved.
//

#import "JESALibraryViewController.h"
#import "JESABook.h"
#import "JESABookCellView.h"

@interface JESALibraryViewController ()

@end

@implementation JESALibraryViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"Library";
    
    // Registramos en nib
    UINib *cellNib = [UINib nibWithNibName:@"JESABookCellView"
                                    bundle:nil];
    
    [self.tableView registerNib:cellNib
         forCellReuseIdentifier:[JESABookCellView cellId]];
}

-(UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    // Averiguar cual es la libreta
    JESABook *b = [self.fetchedResultsController objectAtIndexPath:indexPath];
    
    // Crear una celda
    JESABookCellView *cell = [tableView dequeueReusableCellWithIdentifier:[JESABookCellView cellId]];
    
    /*if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1
                                      reuseIdentifier:cellID];
    }*/
    
    // Sincronizamos library -> Celda
    cell.titleView.text = b.title;
    cell.authorsView.text = b.authors;
    cell.photoView.image = b.image;
    
    // Devolverla
    return cell;
    
}

@end
