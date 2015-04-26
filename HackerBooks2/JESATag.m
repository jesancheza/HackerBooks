#import "JESATag.h"
#import "JESABook.h"

@interface JESATag ()

// Private interface goes here.

@end

@implementation JESATag

+(NSArray *) observableKeys{
    // Observo las propiedades de las relaciones
    return @[JESATagRelationships.book];
}

#pragma mark - Class Methods
+(instancetype) tagWithName:(NSString *) name
                    context:(NSManagedObjectContext *) context{
    
    
    
    return [[self alloc] initWithName:name
                              context:context];
}

#pragma mark - Init
-(instancetype) initWithName:(NSString *) name
                     context:(NSManagedObjectContext *) context{
    JESATag *tag = [JESATag insertInManagedObjectContext:context];
    
    tag.name = [self normalizeCase:name];
    
    return tag;
}

-(NSString*) normalizedName{
    return self.name;
}

#pragma mark - Utils
-(NSUInteger) countTag:(NSManagedObjectContext *) context{
    
    NSFetchRequest *req = [NSFetchRequest fetchRequestWithEntityName:[JESATag entityName]];
    
    NSError *error;
    NSArray *res = [context executeFetchRequest:req
                                          error:&error];
    if (res == nil) {
        return 0;
    }else{
        NSUInteger countTags = [res count];
        return countTags;
    }

}

-(NSString *) nameOfTagForSection:(NSUInteger) section
                          context:(NSManagedObjectContext *) context{
    
    NSFetchRequest *req = [NSFetchRequest fetchRequestWithEntityName:[JESATag entityName]];
    req.sortDescriptors = @[[NSSortDescriptor
                             sortDescriptorWithKey:JESATagAttributes.name
                             ascending:YES
                             selector:@selector(caseInsensitiveCompare:)]];
    
    NSError *error;
    NSMutableArray *res = [[context executeFetchRequest:req
                                                  error:&error] mutableCopy];
    
    // Ordenamos los tag manteniendo primero los favoritos
    res = [[res sortedArrayUsingSelector:@selector(compare:)] mutableCopy];
    
    if (res == nil) {
        return @"";
    }else{
        JESATag *tag = [res objectAtIndex:section];
        return tag.name;
    }

}

-(NSUInteger) numberBooksForTag:(NSUInteger) section
                        context:(NSManagedObjectContext *) context{
    
    NSFetchRequest *req = [NSFetchRequest fetchRequestWithEntityName:[JESATag entityName]];
    req.sortDescriptors = @[[NSSortDescriptor
                             sortDescriptorWithKey:JESATagAttributes.name
                             ascending:YES
                             selector:@selector(caseInsensitiveCompare:)]];
    
    NSError *error;
    NSArray *res = [context executeFetchRequest:req
                                          error:&error];
    
    // Ordenamos los tag manteniendo primero los favoritos
    res = [[res sortedArrayUsingSelector:@selector(compare:)] mutableCopy];
    
    if (res == nil) {
        return 0;
    }else{
        JESATag *tag = [res objectAtIndex:section];
        NSUInteger cantidad = [tag.book count];
        return cantidad;
    }
    
    return 0;
}

-(JESABook *) bookForTag:(NSUInteger) section
                 atIndex:(NSUInteger) index
                 context:(NSManagedObjectContext *) context{
    
    NSFetchRequest *req = [NSFetchRequest fetchRequestWithEntityName:[JESATag entityName]];
    req.sortDescriptors = @[[NSSortDescriptor
                             sortDescriptorWithKey:JESATagAttributes.name
                             ascending:YES
                             selector:@selector(caseInsensitiveCompare:)]];
    
    NSError *error;
    NSArray *res = [context executeFetchRequest:req
                                          error:&error];
    
    // Ordenamos los tag manteniendo primero los favoritos
    res = [[res sortedArrayUsingSelector:@selector(compare:)] mutableCopy];
    
    if (res == nil) {
        return nil;
    }else{
        JESATag *tag = [res objectAtIndex:section];
        NSArray *results = [tag.book allObjects];
        NSSortDescriptor *sortDescriptor = [[NSSortDescriptor alloc] initWithKey:@"title" ascending:YES];
        results = [results sortedArrayUsingDescriptors:@[sortDescriptor]];
        
        JESABook *book = nil;
        if (results) {
            book = [results objectAtIndex:index];
        }
        
        return book;
    }
}

-(NSString*) normalizeCase:(NSString*) aString{
    
    aString = [aString stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
    
    NSString *norm;
    
    if (aString.length <= 1) {
        norm = [aString capitalizedString];
    } else {
        norm = [NSString stringWithFormat:@"%@%@",[[aString substringToIndex:1] uppercaseString],[[aString substringFromIndex:1]lowercaseString]];
    }
    return norm;
}

#pragma mark - Comparison
- (NSComparisonResult)compare:(JESATag *)other{
    
    /* favorite always comes first */
    static NSString *fav = @"Favorite";
    
    if ([[self normalizedName] isEqualToString:[other normalizedName]]) {
        return NSOrderedSame;
    }else if ([[self normalizedName] isEqualToString:fav]){
        return NSOrderedAscending;
    }else if ([[other normalizedName] isEqualToString:fav]){
        return NSOrderedDescending;
    }else{
        return [self.name compare:other.normalizedName];
    }
}

#pragma mark - KVO
-(void) observeValueForKeyPath:(NSString *)keyPath
                      ofObject:(id)object
                        change:(NSDictionary *)change
                       context:(void *)context{
    
}

@end
