//
//  JESAModelBaseClass.m
//  HackerBooks 2
//
//  Created by José Enrique Sanchez on 11/4/15.
//  Copyright (c) 2015 Devappify. All rights reserved.
//

#import "JESAModelBaseClass.h"

@implementation JESAModelBaseClass

#pragma marks - Class Methods
+(NSArray *) observableKeys{
    return @[];
}

#pragma mark - Life cycle
-(void) awakeFromInsert{
    [super awakeFromInsert];
    
    // Sólo se produce una vez en la vida del objeto
    [self setupKVO];
}

-(void) awakeFromFetch{
    [super awakeFromFetch];
    
    // Se produce n veces a lo largo de la vida del objeto
    [self setupKVO];
}

-(void) willTurnIntoFault{
    [super willTurnIntoFault];
    
    // Se produce cuando el objeto se vacía convirtiendose en
    // un fault.
    // Baja en todas las notificaciones
    
    [self tearDownKVO];
}

#pragma mark - KVO
-(void) setupKVO{
    
    // Observamos todas las propiedades excepto modificationDate
    
    for (NSString *key in [[self class] observableKeys]) {
        [self addObserver:self
               forKeyPath:key
                  options:NSKeyValueObservingOptionOld |
         NSKeyValueObservingOptionNew
                  context:NULL];
    }
    
}

-(void) tearDownKVO{
    
    // Me doy de baja de todas las notificaciones
    for (NSString *key in [[self class] observableKeys]) {
        [self removeObserver:self
                  forKeyPath:key];
    }
    
}

@end
