//
//  GIGFactory.m
//  Island Adventure
//
//  Created by Michael Penilo on 9/09/2014.
//  Copyright (c) 2014 Get IT Going. All rights reserved.
//

#import "GIGFactory.h"
#import "GIGTile.h"

@implementation GIGFactory

//Array for navigating a 3 by 4 grid. X axis consists of 4 arrays, y axis is 3 tiles within each x axis array.
-(NSArray *) tiles
{
    GIGTile *tile1 = [[GIGTile alloc] init];
    tile1.story = @"You find yourself marooned on a beautiful deserted island. You see a canteen with some fresh water left in it. Take it and head into the forest.";
    tile1.backgroundImage = [UIImage imageNamed:@"beach.jpg"];
    GIGSupply *canteen = [[GIGSupply alloc] init];
    canteen.name = @"Canteen";
    canteen.health = 5;
    tile1.supply = canteen;
    tile1.actionButtonName = @"Take canteen";
        
    GIGTile *tile2 = [[GIGTile alloc] init];
    tile2.story =@"There is a sturdy branch lying across your path. It may come in handy as a tool.";
    tile2.backgroundImage = [UIImage imageNamed:@"branch.jpg"];
    GIGTool *branch = [[GIGTool alloc] init];
    branch.name = @"Branch";
    branch.knowledge = 4;
    tile2.tool = branch;
    tile2.actionButtonName = @"Take branch";
    
    GIGTile *tile3 = [[GIGTile alloc] init];
    tile3.story = @"You find a beautiful freshwater cascade. A nourishing health boost.";
    tile3.backgroundImage = [UIImage imageNamed:@"water.jpg"];
    GIGSupply *water = [[GIGSupply alloc] init];
    water.name = @"Water";
    water.health = 7;
    tile3.supply = water;
    tile3.actionButtonName = @"Take water";

    NSArray *column1 = [[NSArray alloc] initWithObjects:tile1, tile2, tile3, nil];
    
    GIGTile *tile4 = [[GIGTile alloc] init];
    tile4.story = @"You now see some interesting looking fruit. Do you eat some?";
    tile4.backgroundImage = [UIImage imageNamed:@"fruit.jpg"];
    tile4.healthEffect = 5;
    tile4.actionButtonName = @"Eat fruit";

    GIGTile *tile5 = [[GIGTile alloc] init];
    tile5.story = @"Rocks litter your path. One of these wisely chosen could come in very handy.";
    tile5.backgroundImage = [UIImage imageNamed:@"rock.jpg"];
    GIGTool *rock = [[GIGTool alloc] init];
    rock.name = @"Rock";
    rock.knowledge = 6;
    tile5.tool = rock;
    tile5.actionButtonName = @"Take rock";

    GIGTile *tile6 = [[GIGTile alloc] init];
    tile6.story = @"A local animal comes bounding toward you with glee. It will help you find sources of nourishment.";
    tile6.backgroundImage = [UIImage imageNamed:@"animal2.jpg"];
    GIGSupply *animal = [[GIGSupply alloc] init];
    animal.name = @"Animal";
    animal.health = 10;
    tile6.supply = animal;
    tile6.actionButtonName = @"Take animal";

    NSArray *column2 = [[NSArray alloc] initWithObjects:tile4, tile5, tile6, nil];
    
    GIGTile *tile7 = [[GIGTile alloc] init];
    tile7.story = @"A rope hangs from a nearby tree. Another useful tool.";
    tile7.backgroundImage = [UIImage imageNamed:@"rope.jpg"];
    GIGTool *rope = [[GIGTool alloc] init];
    rope.name = @"Rope";
    rope.knowledge = 10;
    tile7.tool = rope;
    tile7.actionButtonName = @"Take rope";

    GIGTile *tile8 = [[GIGTile alloc] init];
    tile8.story = @"An intimidating animal crosses your path. Stand your ground or retreat.";
    tile8.backgroundImage = [UIImage imageNamed:@"animal1.jpg"];
    tile8.healthEffect = -5;
    tile8.actionButtonName = @"Stand ground";

    GIGTile *tile9 = [[GIGTile alloc] init];
    tile9.story = @"Some strange looking mushrooms. Do you risk tasting it?";
    tile9.backgroundImage = [UIImage imageNamed:@"mushroom.jpg"];
    tile9.healthEffect = -5;
    tile9.actionButtonName = @"Eat mushrooms";

    NSArray *column3 = [[NSArray alloc] initWithObjects:tile7, tile8, tile9, nil];
    
    GIGTile *tile10 = [[GIGTile alloc] init];
    tile10.story = @"You are famished and there are berries growing here. Do you wan to eat some?";
    tile10.backgroundImage = [UIImage imageNamed:@"berries.jpg"];
    tile10.healthEffect = 10;
    tile10.actionButtonName = @"Eat berries";

    GIGTile *tile11 = [[GIGTile alloc] init];
    tile11.story = @"You find an abandoned shelter. Rest here for a while.";
    tile11.backgroundImage = [UIImage imageNamed:@"shelter.jpg"];
    tile11.healthEffect = 15;
    tile11.actionButtonName = @"Rest up";

    GIGTile *tile12 = [[GIGTile alloc] init];
    tile12.story = @"You fall into a crevisse. You must get out before you starve.";
    tile12.backgroundImage = [UIImage imageNamed:@"crevisse.jpg"];
    tile12.healthEffect = -15;
    tile12.actionButtonName = @"Climb out";

    NSArray *column4 = [[NSArray alloc] initWithObjects:tile10, tile11, tile12, nil];
    
    NSArray *tiles = [[NSArray alloc] initWithObjects:column1, column2, column3, column4, nil];
    
    return tiles;
}

//Creation of a character with initial supply and tool. This gets called on viewDidLoad.
-(GIGCharacter *) character
{
    GIGCharacter *character = [[GIGCharacter alloc] init];
    character.health = 100;
    
    GIGSupply *supply = [[GIGSupply alloc] init];
    supply.name = @"Hat";
    supply.health = 2;
    character.supply = supply;
    
    GIGTool *tool = [[GIGTool alloc] init];
    tool.name = @"Hands";
    tool.knowledge = 2;
    character.tool = tool;
    
    return character;
}

//Final Challenge for the character is falling into a crevisse and attempting to climb out before starving to death.
-(GIGCrevisse *) crevisse
{
    GIGCrevisse *crevisse = [[GIGCrevisse alloc] init];
    crevisse.health = 65;
    
    return crevisse;
}

@end
