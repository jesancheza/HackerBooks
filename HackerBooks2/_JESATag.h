// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to JESATag.h instead.

@import CoreData;
#import "JESAModelBaseClass.h"

extern const struct JESATagAttributes {
	__unsafe_unretained NSString *name;
} JESATagAttributes;

extern const struct JESATagRelationships {
	__unsafe_unretained NSString *booktag;
} JESATagRelationships;

@class JESABookTag;

@interface JESATagID : NSManagedObjectID {}
@end

@interface _JESATag : JESAModelBaseClass {}
+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_;
+ (NSString*)entityName;
+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_;
@property (nonatomic, readonly, strong) JESATagID* objectID;

@property (nonatomic, strong) NSString* name;

//- (BOOL)validateName:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSSet *booktag;

- (NSMutableSet*)booktagSet;

@end

@interface _JESATag (BooktagCoreDataGeneratedAccessors)
- (void)addBooktag:(NSSet*)value_;
- (void)removeBooktag:(NSSet*)value_;
- (void)addBooktagObject:(JESABookTag*)value_;
- (void)removeBooktagObject:(JESABookTag*)value_;

@end

@interface _JESATag (CoreDataGeneratedPrimitiveAccessors)

- (NSString*)primitiveName;
- (void)setPrimitiveName:(NSString*)value;

- (NSMutableSet*)primitiveBooktag;
- (void)setPrimitiveBooktag:(NSMutableSet*)value;

@end
