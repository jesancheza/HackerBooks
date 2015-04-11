// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to JESAAnnotation.m instead.

#import "_JESAAnnotation.h"

const struct JESAAnnotationAttributes JESAAnnotationAttributes = {
	.creationDate = @"creationDate",
	.modificationDate = @"modificationDate",
	.photoData = @"photoData",
	.text = @"text",
};

const struct JESAAnnotationRelationships JESAAnnotationRelationships = {
	.book = @"book",
	.localization = @"localization",
};

@implementation JESAAnnotationID
@end

@implementation _JESAAnnotation

+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription insertNewObjectForEntityForName:@"Annotation" inManagedObjectContext:moc_];
}

+ (NSString*)entityName {
	return @"Annotation";
}

+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription entityForName:@"Annotation" inManagedObjectContext:moc_];
}

- (JESAAnnotationID*)objectID {
	return (JESAAnnotationID*)[super objectID];
}

+ (NSSet*)keyPathsForValuesAffectingValueForKey:(NSString*)key {
	NSSet *keyPaths = [super keyPathsForValuesAffectingValueForKey:key];

	return keyPaths;
}

@dynamic creationDate;

@dynamic modificationDate;

@dynamic photoData;

@dynamic text;

@dynamic book;

@dynamic localization;

@end

