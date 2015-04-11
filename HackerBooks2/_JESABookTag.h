// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to JESABookTag.h instead.

@import CoreData;
#import "JESAModelBaseClass.h"

extern const struct JESABookTagRelationships {
	__unsafe_unretained NSString *book;
	__unsafe_unretained NSString *tag;
} JESABookTagRelationships;

@class JESABook;
@class JESATag;

@interface JESABookTagID : NSManagedObjectID {}
@end

@interface _JESABookTag : JESAModelBaseClass {}
+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_;
+ (NSString*)entityName;
+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_;
@property (nonatomic, readonly, strong) JESABookTagID* objectID;

@property (nonatomic, strong) JESABook *book;

//- (BOOL)validateBook:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) JESATag *tag;

//- (BOOL)validateTag:(id*)value_ error:(NSError**)error_;

@end

@interface _JESABookTag (CoreDataGeneratedPrimitiveAccessors)

- (JESABook*)primitiveBook;
- (void)setPrimitiveBook:(JESABook*)value;

- (JESATag*)primitiveTag;
- (void)setPrimitiveTag:(JESATag*)value;

@end
