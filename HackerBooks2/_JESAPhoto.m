// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to JESAPhoto.m instead.

#import "_JESAPhoto.h"

const struct JESAPhotoAttributes JESAPhotoAttributes = {
	.photoData = @"photoData",
	.url = @"url",
};

const struct JESAPhotoRelationships JESAPhotoRelationships = {
	.annotation = @"annotation",
	.book = @"book",
};

@implementation JESAPhotoID
@end

@implementation _JESAPhoto

+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription insertNewObjectForEntityForName:@"Photo" inManagedObjectContext:moc_];
}

+ (NSString*)entityName {
	return @"Photo";
}

+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription entityForName:@"Photo" inManagedObjectContext:moc_];
}

- (JESAPhotoID*)objectID {
	return (JESAPhotoID*)[super objectID];
}

+ (NSSet*)keyPathsForValuesAffectingValueForKey:(NSString*)key {
	NSSet *keyPaths = [super keyPathsForValuesAffectingValueForKey:key];

	return keyPaths;
}

@dynamic photoData;

@dynamic url;

@dynamic annotation;

- (NSMutableSet*)annotationSet {
	[self willAccessValueForKey:@"annotation"];

	NSMutableSet *result = (NSMutableSet*)[self mutableSetValueForKey:@"annotation"];

	[self didAccessValueForKey:@"annotation"];
	return result;
}

@dynamic book;

@end

