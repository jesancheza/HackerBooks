#import "_JESAPdf.h"

@interface JESAPdf : _JESAPdf {}

+(instancetype) pdfWithStringURL:(NSString *) url
                         context:(NSManagedObjectContext *) context;
@end
