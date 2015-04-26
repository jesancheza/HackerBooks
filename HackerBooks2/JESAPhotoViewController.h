//
//  JESAPhotoViewController.h
//  HackerBooks2
//
//  Created by José Enrique Sanchez on 26/4/15.
//  Copyright (c) 2015 Devappify. All rights reserved.
//

@import UIKit;
@class JESAPhoto;

@interface JESAPhotoViewController : UIViewController <UIImagePickerControllerDelegate, UINavigationControllerDelegate>

@property (weak, nonatomic) IBOutlet UIImageView *photoView;

@property(nonatomic,strong) NSManagedObjectContext *context;
@property (nonatomic, strong) JESAPhoto *model;

-(id) initWithModel:(JESAPhoto *) model context:(NSManagedObjectContext *) context;

- (IBAction)takePicture:(id)sender;
- (IBAction)deletePhoto:(id)sender;

@end
