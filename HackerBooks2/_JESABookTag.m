// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to JESABookTag.m instead.

#import "_JESABookTag.h"

const struct JESABookTagRelationships JESABookTagRelationships = {
	.book = @"book",
	.tag = @"tag",
};

@implementation JESABookTagID
@end

@implementation _JESABookTag

+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription insertNewObjectForEntityForName:@"BookTag" inManagedObjectContext:moc_];
}

+ (NSString*)entityName {
	return @"BookTag";
}

+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription entityForName:@"BookTag" inManagedObjectContext:moc_];
}

- (JESABookTagID*)objectID {
	return (JESABookTagID*)[super objectID];
}

+ (NSSet*)keyPathsForValuesAffectingValueForKey:(NSString*)key {
	NSSet *keyPaths = [super keyPathsForValuesAffectingValueForKey:key];

	return keyPaths;
}

@dynamic book;

@dynamic tag;

@end

