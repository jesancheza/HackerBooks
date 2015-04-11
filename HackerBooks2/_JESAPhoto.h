// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to JESAPhoto.h instead.

@import CoreData;
#import "JESAModelBaseClass.h"

extern const struct JESAPhotoAttributes {
	__unsafe_unretained NSString *photoData;
} JESAPhotoAttributes;

extern const struct JESAPhotoRelationships {
	__unsafe_unretained NSString *book;
} JESAPhotoRelationships;

@class JESABook;

@interface JESAPhotoID : NSManagedObjectID {}
@end

@interface _JESAPhoto : JESAModelBaseClass {}
+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_;
+ (NSString*)entityName;
+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_;
@property (nonatomic, readonly, strong) JESAPhotoID* objectID;

@property (nonatomic, strong) NSData* photoData;

//- (BOOL)validatePhotoData:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) JESABook *book;

//- (BOOL)validateBook:(id*)value_ error:(NSError**)error_;

@end

@interface _JESAPhoto (CoreDataGeneratedPrimitiveAccessors)

- (NSData*)primitivePhotoData;
- (void)setPrimitivePhotoData:(NSData*)value;

- (JESABook*)primitiveBook;
- (void)setPrimitiveBook:(JESABook*)value;

@end
