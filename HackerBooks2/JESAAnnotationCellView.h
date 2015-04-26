//
//  JESAAnnotationCellView.h
//  HackerBooks2
//
//  Created by José Enrique Sanchez on 26/4/15.
//  Copyright (c) 2015 Devappify. All rights reserved.
//

@import UIKit;
@class JESAAnnotation;

@interface JESAAnnotationCellView : UICollectionViewCell

@property (nonatomic,weak) IBOutlet UIImageView *photoView;
@property (nonatomic,weak) IBOutlet UILabel *modificationDateView;

-(void) observeAnnotation:(JESAAnnotation *) annotation;

@end
