// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to JESAPdf.h instead.

@import CoreData;
#import "JESAModelBaseClass.h"

extern const struct JESAPdfAttributes {
	__unsafe_unretained NSString *pdfData;
	__unsafe_unretained NSString *url;
} JESAPdfAttributes;

extern const struct JESAPdfRelationships {
	__unsafe_unretained NSString *book;
} JESAPdfRelationships;

@class JESABook;

@interface JESAPdfID : NSManagedObjectID {}
@end

@interface _JESAPdf : JESAModelBaseClass {}
+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_;
+ (NSString*)entityName;
+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_;
@property (nonatomic, readonly, strong) JESAPdfID* objectID;

@property (nonatomic, strong) NSData* pdfData;

//- (BOOL)validatePdfData:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSString* url;

//- (BOOL)validateUrl:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) JESABook *book;

//- (BOOL)validateBook:(id*)value_ error:(NSError**)error_;

@end

@interface _JESAPdf (CoreDataGeneratedPrimitiveAccessors)

- (NSData*)primitivePdfData;
- (void)setPrimitivePdfData:(NSData*)value;

- (NSString*)primitiveUrl;
- (void)setPrimitiveUrl:(NSString*)value;

- (JESABook*)primitiveBook;
- (void)setPrimitiveBook:(JESABook*)value;

@end
