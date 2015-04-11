// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to JESABook.m instead.

#import "_JESABook.h"

const struct JESABookAttributes JESABookAttributes = {
	.authors = @"authors",
	.isFavorite = @"isFavorite",
	.title = @"title",
};

const struct JESABookRelationships JESABookRelationships = {
	.annotation = @"annotation",
	.booktag = @"booktag",
	.pdf = @"pdf",
	.photo = @"photo",
};

@implementation JESABookID
@end

@implementation _JESABook

+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription insertNewObjectForEntityForName:@"Book" inManagedObjectContext:moc_];
}

+ (NSString*)entityName {
	return @"Book";
}

+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription entityForName:@"Book" inManagedObjectContext:moc_];
}

- (JESABookID*)objectID {
	return (JESABookID*)[super objectID];
}

+ (NSSet*)keyPathsForValuesAffectingValueForKey:(NSString*)key {
	NSSet *keyPaths = [super keyPathsForValuesAffectingValueForKey:key];

	if ([key isEqualToString:@"isFavoriteValue"]) {
		NSSet *affectingKey = [NSSet setWithObject:@"isFavorite"];
		keyPaths = [keyPaths setByAddingObjectsFromSet:affectingKey];
		return keyPaths;
	}

	return keyPaths;
}

@dynamic authors;

@dynamic isFavorite;

- (BOOL)isFavoriteValue {
	NSNumber *result = [self isFavorite];
	return [result boolValue];
}

- (void)setIsFavoriteValue:(BOOL)value_ {
	[self setIsFavorite:@(value_)];
}

- (BOOL)primitiveIsFavoriteValue {
	NSNumber *result = [self primitiveIsFavorite];
	return [result boolValue];
}

- (void)setPrimitiveIsFavoriteValue:(BOOL)value_ {
	[self setPrimitiveIsFavorite:@(value_)];
}

@dynamic title;

@dynamic annotation;

- (NSMutableSet*)annotationSet {
	[self willAccessValueForKey:@"annotation"];

	NSMutableSet *result = (NSMutableSet*)[self mutableSetValueForKey:@"annotation"];

	[self didAccessValueForKey:@"annotation"];
	return result;
}

@dynamic booktag;

- (NSMutableSet*)booktagSet {
	[self willAccessValueForKey:@"booktag"];

	NSMutableSet *result = (NSMutableSet*)[self mutableSetValueForKey:@"booktag"];

	[self didAccessValueForKey:@"booktag"];
	return result;
}

@dynamic pdf;

@dynamic photo;

@end

