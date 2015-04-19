#import "_JESABook.h"
@import UIKit;

@interface JESABook : _JESABook {}

// Métodos de clase
+(instancetype) bookWithTitle:(NSString *) title
                        photo:(JESAPhoto *) image
                         book:(JESAPdf *) bookPdf
                         tags:(NSSet *) tags
                      authors:(NSString *) authors
                   isFavorite:(NSNumber *) isFavorite
                      context:(NSManagedObjectContext *) context;


@end
