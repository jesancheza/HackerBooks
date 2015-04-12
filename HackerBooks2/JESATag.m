#import "JESATag.h"

@interface JESATag ()

// Private interface goes here.

@end

@implementation JESATag

+(instancetype) tagWithName:(NSString *) name
                    context:(NSManagedObjectContext *) context{
    
    JESATag *t = [JESATag insertInManagedObjectContext:context];
    
    t.name = name;
    
    return t;
}


@end
