#import "_JESATag.h"

@interface JESATag : _JESATag {}

+(instancetype) tagWithName:(NSString *) name
                    context:(NSManagedObjectContext *) context;

-(instancetype) initWithName:(NSString *) name
                     context:(NSManagedObjectContext *) context;

-(NSUInteger) countTag:(NSManagedObjectContext *) context;
-(NSString *) nameOfTagForSection:(NSUInteger) section
                          context:(NSManagedObjectContext *) context;
-(NSUInteger) numberBooksForTag:(NSUInteger) section
                        context:(NSManagedObjectContext *) context;
-(JESABook *) bookForTag:(NSUInteger) section
                 atIndex:(NSUInteger) index
                 context:(NSManagedObjectContext *) context;

@end
