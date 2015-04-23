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
#import "JESABookViewController.h"
#import "JESAPhoto.h"
#import "Settings.h"

@interface JESALibraryViewController ()

@end

@implementation JESALibraryViewController

#pragma mark - View Lifecycle
- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"Library";
    
    // Registramos en nib
    UINib *cellNib = [UINib nibWithNibName:@"JESABookCellView"
                                    bundle:nil];
    
    [self.tableView registerNib:cellNib
         forCellReuseIdentifier:[JESABookCellView cellId]];
    
    // Alta en notificaciones
    [self setupNotifications];
}

-(void) dealloc{
    [self tearDownNotifications];
}

#pragma mark - Table view data source
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
    cell.photoView.image = b.photo.image;
    
    // Devolverla
    return cell;
    
}

-(void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    JESABook *book = [self.fetchedResultsController objectAtIndexPath:indexPath];
    
    // Mandamos el mensaje al delegado si lo entiende
    if ([self.delegate respondsToSelector:@selector(libraryViewController:didSelectBook:)]) {
        [self.delegate libraryViewController:self
                               didSelectBook:book];
    }
}

#pragma mark - TableView Delegate
-(CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return [JESABookCellView cellHeight];
}

#pragma mark - JESALibraryTableViewControllerDelegate
-(void) libraryViewController:(JESALibraryViewController *) uVC
                didSelectBook:(JESABook *) book{
    // Creamos un bookVC
    JESABookViewController *bookVC = [[JESABookViewController alloc] initWithModel:book];
    
    // Hago un push
    [self.navigationController pushViewController:bookVC
                                         animated:YES];
}

#pragma mark -  Notifications
-(void) setupNotifications{
    
    NSNotificationCenter *nc = [NSNotificationCenter defaultCenter];
    
    [nc addObserver:self
           selector:@selector(notifyThatImageDidChange:)
               name:IMAGE_DID_CHANGE_NOTIFICATION
             object:nil];
    
}

-(void) tearDownNotifications{
    
    NSNotificationCenter *nc = [NSNotificationCenter defaultCenter];
    [nc removeObserver:self];
}

//IMAGE_DID_CHANGE_NOTIFICATION
-(void)notifyThatImageDidChange:(NSNotification*) notification{
    
    [self.tableView reloadData];
}

@end
