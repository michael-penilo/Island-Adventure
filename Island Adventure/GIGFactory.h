//
//  GIGFactory.h
//  Island Adventure
//
//  Created by Michael Penilo on 9/09/2014.
//  Copyright (c) 2014 Get IT Going. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "GIGCharacter.h"
#import "GIGCrevisse.h"

@interface GIGFactory : NSObject

-(NSArray *) tiles;
-(GIGCharacter *) character;
-(GIGCrevisse *) crevisse;

@end
