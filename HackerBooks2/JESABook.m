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
        
        req.predicate = [NSPredicate predicateWithFormat:@"name = %@",tag];
        
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

#pragma mark - KVO
-(void) observeValueForKeyPath:(NSString *)keyPath
                      ofObject:(id)object
                        change:(NSDictionary *)change
                       context:(void *)context{
    
}

@end
