#import "JESABook.h"
#import "JESAPdf.h"
#import "JESAAnnotation.h"

@interface JESABook ()

// Private interface goes here.

@end

@implementation JESABook

#pragma mark - Class Methods
+(instancetype) bookWithTitle:(NSString *) title
                        photo:(NSData *) image
                         book:(JESAPdf *) bookPdf
                         tags:(NSSet *) tags
                      authors:(NSString *) authors
                   isFavorite:(NSNumber *) isFavorite
                      context:(NSManagedObjectContext *) context{
    JESABook *b = [self insertInManagedObjectContext:context];
    
    b.title = title;
    b.isFavorite = isFavorite;
    b.authors = authors;
    b.photoData = image;
    b.pdf = bookPdf;
    b.annotation = nil;
    b.tag = tags;
    
    return b;
}

@end
