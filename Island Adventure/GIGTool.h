//
//  GIGTool.h
//  Island Adventure
//
//  Created by Michael Penilo on 9/09/2014.
//  Copyright (c) 2014 Get IT Going. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GIGTool : NSObject

//Properties for a tool a character picks up when landing on a tile and pressing the action button.
@property (strong, nonatomic) NSString *name;
@property (nonatomic) int knowledge;

@end
