#import "_JESATag.h"

@interface JESATag : _JESATag {}

+(instancetype) tagWithName:(NSString *) name
                    context:(NSManagedObjectContext *) context;

@end
