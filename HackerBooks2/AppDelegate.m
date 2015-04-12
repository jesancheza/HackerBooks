//
//  AppDelegate.m
//  HackerBooks2
//
//  Created by José Enrique Sanchez on 11/4/15.
//  Copyright (c) 2015 Devappify. All rights reserved.
//

#import "AppDelegate.h"
#import "JESABook.h"
#import "AGTCoreDataStack.h"
#import "JESAPdf.h"
#import "JESATag.h"
#import "JESALibraryViewController.h"
#import "JESASandboxAndUserDefaultUtils.h"
#import "Settings.h"
#import "JESABookViewController.h"

@interface AppDelegate ()
@property (nonatomic, strong) AGTCoreDataStack *stack;
@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    
    // Creamos una instancia de stack
    self.stack = [AGTCoreDataStack coreDataStackWithModelName:@"Model"];
    
    // Comprobamos si es la primera vez que se carga al app
    JESASandboxAndUserDefaultUtils *utilsSandbox = [JESASandboxAndUserDefaultUtils new];
    
    if (![utilsSandbox isUserDefaultName:FIRST_TIME]) {
        
        [utilsSandbox saveInUserDefaultName:FIRST_TIME value:@"1"];
        
        [self downloadData];
    }
    
    // Un fetchRequest
    NSFetchRequest *req = [NSFetchRequest fetchRequestWithEntityName:[JESABook entityName]];
    req.sortDescriptors = @[[NSSortDescriptor
                             sortDescriptorWithKey:JESABookAttributes.title
                             ascending:YES
                             selector:@selector(caseInsensitiveCompare:)]];
    req.fetchBatchSize = 20;
    
    // FetchedResultsController
    NSFetchedResultsController *fc = [[NSFetchedResultsController alloc]initWithFetchRequest:req
                                                                        managedObjectContext:self.stack.context
                                                                          sectionNameKeyPath:nil
                                                                                   cacheName:nil];
    
    // Creamos los controladores en sus navigation controller
    JESALibraryViewController *lVC = [[JESALibraryViewController alloc] initWithFetchedResultsController:fc
                                                                                                   style:UITableViewStylePlain];
    
    UINavigationController *lNav = [[UINavigationController alloc] initWithRootViewController:lVC];
    
    JESABookViewController *bVC = [[JESABookViewController alloc]
                                   initWithModel:[fc objectAtIndexPath:[NSIndexPath indexPathForRow:0
                                                                                          inSection:0]]];
    UINavigationController *bNav = [[UINavigationController alloc] initWithRootViewController:bVC];
    
    // Creamos un combinador
    UISplitViewController *spltVC = [[UISplitViewController alloc] init];
    spltVC.viewControllers = @[lNav, bNav];
    
    self.window.rootViewController = spltVC;
    
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    [self.stack saveWithErrorBlock:^(NSError *error) {
        NSLog(@"Erorr al guardar: %@", error);
    }];
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    [self.stack saveWithErrorBlock:^(NSError *error) {
        NSLog(@"Erorr al guardar: %@", error);
    }];
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


-(void) downloadData{
    
    [self.stack zapAllData];
    
    // Descargo el JSON
    NSURL *urlJSON = [NSURL URLWithString:@"https://t.co/K9ziV0z3SJ"];
    
    NSData *data = [NSData dataWithContentsOfURL:urlJSON];
    
    // Recuperamos JSON
    NSError *err;
    NSArray * JSONObjects = [NSJSONSerialization JSONObjectWithData:data
                                                            options:NSJSONReadingMutableContainers
                                                              error:&err];
    
    if (JSONObjects != nil) {
        // Recorremos el JSON
        for (NSDictionary *dic in JSONObjects) {
            
            // Recumeramos la imagen
            NSURL *image = [NSURL URLWithString:[dic objectForKey:@"image_url"]];
            
            NSData *imageData = [NSData dataWithContentsOfURL:image];
            
            // Creamos el pdf, solo la url
            JESAPdf *pdf = [JESAPdf pdfWithStringURL:[dic objectForKey:@"pdf_url"]
                                             context:self.stack.context];
            
            // Creamos los tags
            NSMutableSet *tags;
            NSArray *listaTags = [self extractTagsFromJSON:[dic objectForKey:@"tags"]];
            for (NSString *tag in listaTags) {
                JESATag *tagObjc =  [JESATag tagWithName:tag
                                                 context:self.stack.context];
                
                if (tags != nil) {
                    [tags addObject:tagObjc];
                }else{
                    tags = [tags initWithObjects:tagObjc, nil];
                }
                
            }
            
            [JESABook bookWithTitle:[dic objectForKey:@"title"]
                              photo:imageData
                               book:pdf
                               tags:tags
                            authors:[dic objectForKey:@"authors"]
                         isFavorite:[NSNumber numberWithBool:NO]
                            context:self.stack.context];
            
            
        }
    }
    
    [self.stack saveWithErrorBlock:^(NSError *error) {
        NSLog(@"Erorr al guardar: %@", error);
    }];
    
}

#pragma mark - Utils
-(NSArray *) extractTagsFromJSON:(NSString *) tagsJSON{
    
    
    NSArray *tags = [tagsJSON componentsSeparatedByString:@","];
    
    return tags;
}


@end
