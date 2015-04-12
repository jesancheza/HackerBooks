#import "_JESABook.h"
@import UIKit;

@interface JESABook : _JESABook {}

@property(nonatomic, strong) UIImage *image;

// Métodos de clase
+(instancetype) bookWithTitle:(NSString *) title
                        photo:(NSData *) image
                         book:(JESAPdf *) bookPdf
                         tags:(NSSet *) tags
                      authors:(NSString *) authors
                   isFavorite:(NSNumber *) isFavorite
                      context:(NSManagedObjectContext *) context;


@end
