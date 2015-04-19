// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to JESABook.h instead.

@import CoreData;
#import "JESAModelBaseClass.h"

extern const struct JESABookAttributes {
	__unsafe_unretained NSString *authors;
	__unsafe_unretained NSString *isFavorite;
	__unsafe_unretained NSString *title;
} JESABookAttributes;

extern const struct JESABookRelationships {
	__unsafe_unretained NSString *annotation;
	__unsafe_unretained NSString *pdf;
	__unsafe_unretained NSString *photo;
	__unsafe_unretained NSString *tag;
} JESABookRelationships;

@class JESAAnnotation;
@class JESAPdf;
@class JESAPhoto;
@class JESATag;

@interface JESABookID : NSManagedObjectID {}
@end

@interface _JESABook : JESAModelBaseClass {}
+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_;
+ (NSString*)entityName;
+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_;
@property (nonatomic, readonly, strong) JESABookID* objectID;

@property (nonatomic, strong) NSString* authors;

//- (BOOL)validateAuthors:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSNumber* isFavorite;

@property (atomic) BOOL isFavoriteValue;
- (BOOL)isFavoriteValue;
- (void)setIsFavoriteValue:(BOOL)value_;

//- (BOOL)validateIsFavorite:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSString* title;

//- (BOOL)validateTitle:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSSet *annotation;

- (NSMutableSet*)annotationSet;

@property (nonatomic, strong) JESAPdf *pdf;

//- (BOOL)validatePdf:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) JESAPhoto *photo;

//- (BOOL)validatePhoto:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSSet *tag;

- (NSMutableSet*)tagSet;

@end

@interface _JESABook (AnnotationCoreDataGeneratedAccessors)
- (void)addAnnotation:(NSSet*)value_;
- (void)removeAnnotation:(NSSet*)value_;
- (void)addAnnotationObject:(JESAAnnotation*)value_;
- (void)removeAnnotationObject:(JESAAnnotation*)value_;

@end

@interface _JESABook (TagCoreDataGeneratedAccessors)
- (void)addTag:(NSSet*)value_;
- (void)removeTag:(NSSet*)value_;
- (void)addTagObject:(JESATag*)value_;
- (void)removeTagObject:(JESATag*)value_;

@end

@interface _JESABook (CoreDataGeneratedPrimitiveAccessors)

- (NSString*)primitiveAuthors;
- (void)setPrimitiveAuthors:(NSString*)value;

- (NSNumber*)primitiveIsFavorite;
- (void)setPrimitiveIsFavorite:(NSNumber*)value;

- (BOOL)primitiveIsFavoriteValue;
- (void)setPrimitiveIsFavoriteValue:(BOOL)value_;

- (NSString*)primitiveTitle;
- (void)setPrimitiveTitle:(NSString*)value;

- (NSMutableSet*)primitiveAnnotation;
- (void)setPrimitiveAnnotation:(NSMutableSet*)value;

- (JESAPdf*)primitivePdf;
- (void)setPrimitivePdf:(JESAPdf*)value;

- (JESAPhoto*)primitivePhoto;
- (void)setPrimitivePhoto:(JESAPhoto*)value;

- (NSMutableSet*)primitiveTag;
- (void)setPrimitiveTag:(NSMutableSet*)value;

@end
