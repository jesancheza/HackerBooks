#import "_JESAPhoto.h"
@import UIKit;

@interface JESAPhoto : _JESAPhoto {}

@property(nonatomic, strong) UIImage *image;


+ (instancetype) photoWithURL:(NSString *) url
                      context:(NSManagedObjectContext *) context;

-(instancetype) initWithURL:(NSString *) url
                    context:(NSManagedObjectContext *) context;
@end
