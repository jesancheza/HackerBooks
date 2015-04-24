//
//  JESASimplePdfViewController.h
//  HackerBooks2
//
//  Created by José Enrique Sanchez on 24/4/15.
//  Copyright (c) 2015 Devappify. All rights reserved.
//

@import UIKit;
@class JESABook;

@interface JESASimplePdfViewController : UIViewController <UIWebViewDelegate>

@property(nonatomic, weak) IBOutlet UIWebView *browser;
@property(nonatomic, weak) IBOutlet UIActivityIndicatorView *activityView;

@property(nonatomic, strong) JESABook *model;

-(id) initWithModel:(JESABook *)model;

@end
