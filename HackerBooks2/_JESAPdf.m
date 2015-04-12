// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to JESAPdf.m instead.

#import "_JESAPdf.h"

const struct JESAPdfAttributes JESAPdfAttributes = {
	.pdfData = @"pdfData",
	.url = @"url",
};

const struct JESAPdfRelationships JESAPdfRelationships = {
	.book = @"book",
};

@implementation JESAPdfID
@end

@implementation _JESAPdf

+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription insertNewObjectForEntityForName:@"Pdf" inManagedObjectContext:moc_];
}

+ (NSString*)entityName {
	return @"Pdf";
}

+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription entityForName:@"Pdf" inManagedObjectContext:moc_];
}

- (JESAPdfID*)objectID {
	return (JESAPdfID*)[super objectID];
}

+ (NSSet*)keyPathsForValuesAffectingValueForKey:(NSString*)key {
	NSSet *keyPaths = [super keyPathsForValuesAffectingValueForKey:key];

	return keyPaths;
}

@dynamic pdfData;

@dynamic url;

@dynamic book;

@end

