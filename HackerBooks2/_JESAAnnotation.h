// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to JESAAnnotation.h instead.

@import CoreData;
#import "JESAModelBaseClass.h"

extern const struct JESAAnnotationAttributes {
	__unsafe_unretained NSString *creationDate;
	__unsafe_unretained NSString *modificationDate;
	__unsafe_unretained NSString *text;
} JESAAnnotationAttributes;

extern const struct JESAAnnotationRelationships {
	__unsafe_unretained NSString *book;
	__unsafe_unretained NSString *localization;
	__unsafe_unretained NSString *photo;
} JESAAnnotationRelationships;

@class JESABook;
@class JESALocalization;
@class JESAPhoto;

@interface JESAAnnotationID : NSManagedObjectID {}
@end

@interface _JESAAnnotation : JESAModelBaseClass {}
+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_;
+ (NSString*)entityName;
+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_;
@property (nonatomic, readonly, strong) JESAAnnotationID* objectID;

@property (nonatomic, strong) NSDate* creationDate;

//- (BOOL)validateCreationDate:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSDate* modificationDate;

//- (BOOL)validateModificationDate:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSString* text;

//- (BOOL)validateText:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) JESABook *book;

//- (BOOL)validateBook:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) JESALocalization *localization;

//- (BOOL)validateLocalization:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) JESAPhoto *photo;

//- (BOOL)validatePhoto:(id*)value_ error:(NSError**)error_;

@end

@interface _JESAAnnotation (CoreDataGeneratedPrimitiveAccessors)

- (NSDate*)primitiveCreationDate;
- (void)setPrimitiveCreationDate:(NSDate*)value;

- (NSDate*)primitiveModificationDate;
- (void)setPrimitiveModificationDate:(NSDate*)value;

- (NSString*)primitiveText;
- (void)setPrimitiveText:(NSString*)value;

- (JESABook*)primitiveBook;
- (void)setPrimitiveBook:(JESABook*)value;

- (JESALocalization*)primitiveLocalization;
- (void)setPrimitiveLocalization:(JESALocalization*)value;

- (JESAPhoto*)primitivePhoto;
- (void)setPrimitivePhoto:(JESAPhoto*)value;

@end
