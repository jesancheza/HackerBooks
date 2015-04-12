// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to JESATag.h instead.

@import CoreData;
#import "JESAModelBaseClass.h"

extern const struct JESATagAttributes {
	__unsafe_unretained NSString *name;
} JESATagAttributes;

extern const struct JESATagRelationships {
	__unsafe_unretained NSString *book;
} JESATagRelationships;

@class JESABook;

@interface JESATagID : NSManagedObjectID {}
@end

@interface _JESATag : JESAModelBaseClass {}
+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_;
+ (NSString*)entityName;
+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_;
@property (nonatomic, readonly, strong) JESATagID* objectID;

@property (nonatomic, strong) NSString* name;

//- (BOOL)validateName:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSSet *book;

- (NSMutableSet*)bookSet;

@end

@interface _JESATag (BookCoreDataGeneratedAccessors)
- (void)addBook:(NSSet*)value_;
- (void)removeBook:(NSSet*)value_;
- (void)addBookObject:(JESABook*)value_;
- (void)removeBookObject:(JESABook*)value_;

@end

@interface _JESATag (CoreDataGeneratedPrimitiveAccessors)

- (NSString*)primitiveName;
- (void)setPrimitiveName:(NSString*)value;

- (NSMutableSet*)primitiveBook;
- (void)setPrimitiveBook:(NSMutableSet*)value;

@end
