// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to JESATag.m instead.

#import "_JESATag.h"

const struct JESATagAttributes JESATagAttributes = {
	.name = @"name",
};

const struct JESATagRelationships JESATagRelationships = {
	.book = @"book",
};

@implementation JESATagID
@end

@implementation _JESATag

+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription insertNewObjectForEntityForName:@"Tag" inManagedObjectContext:moc_];
}

+ (NSString*)entityName {
	return @"Tag";
}

+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription entityForName:@"Tag" inManagedObjectContext:moc_];
}

- (JESATagID*)objectID {
	return (JESATagID*)[super objectID];
}

+ (NSSet*)keyPathsForValuesAffectingValueForKey:(NSString*)key {
	NSSet *keyPaths = [super keyPathsForValuesAffectingValueForKey:key];

	return keyPaths;
}

@dynamic name;

@dynamic book;

- (NSMutableSet*)bookSet {
	[self willAccessValueForKey:@"book"];

	NSMutableSet *result = (NSMutableSet*)[self mutableSetValueForKey:@"book"];

	[self didAccessValueForKey:@"book"];
	return result;
}

@end

