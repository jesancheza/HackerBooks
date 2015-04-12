//
//  JESABookViewController.h
//  HackerBooks2
//
//  Created by José Enrique Sanchez on 13/4/15.
//  Copyright (c) 2015 Devappify. All rights reserved.
//

@import UIKit;
@class JESABook;

@interface JESABookViewController : UIViewController
@property (weak, nonatomic) IBOutlet UIImageView *photoView;
@property (weak, nonatomic) IBOutlet UILabel *titleView;
@property (weak, nonatomic) IBOutlet UILabel *authorsView;

@property(nonatomic,strong) JESABook *model;

-(id) initWithModel:(JESABook *) model;

@end
