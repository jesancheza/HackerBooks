#import "JESAPdf.h"

@interface JESAPdf ()

// Private interface goes here.

@end

@implementation JESAPdf

+(instancetype) pdfWithStringURL:(NSString *) url
                         context:(NSManagedObjectContext *) context{
    
    JESAPdf *pdf = [JESAPdf insertInManagedObjectContext:context];
    
    pdf.url = url;
    pdf.pdfData = nil;
    
    return pdf;
}

@end
