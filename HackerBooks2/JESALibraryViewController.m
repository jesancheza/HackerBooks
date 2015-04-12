//
//  JESALibraryViewController.m
//  HackerBooks2
//
//  Created by José Enrique Sanchez on 12/4/15.
//  Copyright (c) 2015 Devappify. All rights reserved.
//

#import "JESALibraryViewController.h"
#import "JESABook.h"

@interface JESALibraryViewController ()

@end

@implementation JESALibraryViewController

-(UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    // Averiguar cual es la libreta
    JESABook *b = [self.fetchedResultsController objectAtIndexPath:indexPath];
    
    // Crear una celda
    static NSString *cellID = @"bookCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1
                                      reuseIdentifier:cellID];
    }
    
    // Configurarla (sincronizar libreta y celda)
    cell.textLabel.text = b.title;
    cell.detailTextLabel.text = b.authors;
    cell.imageView.image = b.image;
    
    // Devolverla
    return cell;
    
}

@end
