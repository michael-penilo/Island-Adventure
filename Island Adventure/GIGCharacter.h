//
//  GIGCharacter.h
//  Island Adventure
//
//  Created by Michael Penilo on 9/09/2014.
//  Copyright (c) 2014 Get IT Going. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "GIGSupply.h"
#import "GIGTool.h"

@interface GIGCharacter : NSObject

//Properties the character has that can be affected by the action button.  These include a supply and tool that can be picked up when pressing the action button, thus these are imported from their respective classes.
@property (nonatomic) int health;
@property (nonatomic) int knowledge;
@property (strong, nonatomic) GIGSupply *supply;
@property (strong, nonatomic) GIGTool *tool;

@end
