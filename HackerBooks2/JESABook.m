#import "JESABook.h"
#import "JESAPdf.h"
#import "JESAAnnotation.h"
#import "JESAPhoto.h"
#import "JESATag.h"

@interface JESABook ()

// Private interface goes here.

@end

@implementation JESABook

+(NSArray *) observableKeys{
    // Observo las propiedades de las relaciones
    return @[JESABookRelationships.photo, JESABookRelationships.annotation, JESABookRelationships.pdf, JESABookRelationships.tag];
}

#pragma mark - Class Methods
// Tries to recover the object from the archived URI representation (that probably
// comes from some NSUserDefaults). If the object doesn't exist anymore, returns
// nil.
+(instancetype) objectWithArchivedURIRepresentation:(NSData*)archivedURI
                                            context:(NSManagedObjectContext *) context{
    
    NSURL *uri = [NSKeyedUnarchiver unarchiveObjectWithData:archivedURI];
    if (uri == nil) {
        return nil;
    }
    
    
    NSManagedObjectID *nid = [context.persistentStoreCoordinator
                              managedObjectIDForURIRepresentation:uri];
    if (nid == nil) {
        return nil;
    }
    
    
    NSManagedObject *ob = [context objectWithID:nid];
    if (ob.isFault) {
        // Got it!
        return (JESABook *)ob;
    }else{
        // Might not exist anymore. Let's fetch it!
        NSFetchRequest *req = [NSFetchRequest fetchRequestWithEntityName:ob.entity.name];
        req.predicate = [NSPredicate predicateWithFormat:@"SELF = %@", ob];
        
        NSError *error;
        NSArray *res = [context executeFetchRequest:req
                                              error:&error];
        if (res == nil) {
            return nil;
        }else{
            return [res lastObject];
        }
    }
    
    
}

+(instancetype) bookWithTitle:(NSString *) title
                        photo:(JESAPhoto *) image
                         book:(JESAPdf *) bookPdf
                         tags:(NSSet *) tags
                      authors:(NSString *) authors
                   isFavorite:(NSNumber *) isFavorite
                      context:(NSManagedObjectContext *) context{
    
    return [[self alloc] initWithTitle:title photo:image
                                  book:bookPdf
                                  tags:tags
                               authors:authors
                            isFavorite:isFavorite
                               context:context];
}

+(instancetype) bookWithDictionary:(NSDictionary *) dic
                           context:(NSManagedObjectContext *) context{
    
    return [[self alloc] initWithDictionary:dic
                                    context:context];
}

#pragma mark - Init
-(instancetype) initWithTitle:(NSString *) title
                        photo:(JESAPhoto *) image
                         book:(JESAPdf *) bookPdf
                         tags:(NSSet *) tags
                      authors:(NSString *) authors
                   isFavorite:(NSNumber *) isFavorite
                      context:(NSManagedObjectContext *) context{
    
    JESABook *b = [JESABook insertInManagedObjectContext:context];
    
    b.title = title;
    b.isFavorite = isFavorite;
    b.authors = authors;
    b.photo = image;
    b.pdf = bookPdf;
    b.annotation = nil;
    b.tag = tags;
    
    return b;
}

-(instancetype) initWithDictionary:(NSDictionary *) dic
                           context:(NSManagedObjectContext *) context{
    JESABook *book = [NSEntityDescription insertNewObjectForEntityForName:[JESABook entityName]
                                                   inManagedObjectContext:context];
    
    book.title = [dic objectForKey:@"title"];
    book.authors = [dic objectForKey:@"authors"];
    
    // Creamos el pdf, solo la url
    JESAPdf *pdf = [JESAPdf pdfWithStringURL:[dic objectForKey:@"pdf_url"]
                                     context:context];
    book.pdf = pdf;
    
    JESAPhoto *photo = [JESAPhoto photoWithURL:[dic objectForKey:@"image_url"]
                                       context:context];
    
    book.photo = photo;
    
    // Creamos los tags
    NSArray *listaTags = [[dic objectForKey:@"tags"] componentsSeparatedByString:@","];
    for (NSString *tag in listaTags) {
        
        // Compruebo si el tag existe
        NSFetchRequest *req = [NSFetchRequest fetchRequestWithEntityName:[JESATag entityName]];
        req.sortDescriptors = @[[NSSortDescriptor sortDescriptorWithKey:JESATagAttributes.name
                                                              ascending:YES
                                                               selector:@selector(caseInsensitiveCompare:)]];
        
        req.predicate = [NSPredicate predicateWithFormat:@"name = %@",[self normalizeCase:tag]];
        
        NSError *error;
        NSArray *results = [context executeFetchRequest:req
                                                  error:&error];
        
        if ([results count] > 0) {
            [book addTagObject:[results lastObject]];
        }else{
            [book addTagObject:[JESATag tagWithName:tag
                                            context:context]];
        }
        
    }
    
    return book;
}

#pragma mark - KVO
-(void) observeValueForKeyPath:(NSString *)keyPath
                      ofObject:(id)object
                        change:(NSDictionary *)change
                       context:(void *)context{
    
}

#pragma mark - Utils
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

@end
