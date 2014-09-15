//
//  GIGTile.h
//  Island Adventure
//
//  Created by Michael Penilo on 9/09/2014.
//  Copyright (c) 2014 Get IT Going. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "GIGSupply.h"
#import "GIGTool.h"

@interface GIGTile : NSObject

//properties for each tile that get called when a character navigates onto it.
@property (strong, nonatomic) NSString *story;
@property (strong, nonatomic) UIImage *backgroundImage;
@property (strong, nonatomic) NSString *actionButtonName;
@property GIGSupply *supply;
@property GIGTool *tool;
@property (nonatomic) int healthEffect;

@end
