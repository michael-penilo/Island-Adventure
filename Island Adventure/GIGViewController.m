//
//  GIGViewController.m
//  Island Adventure
//
//  Created by Michael Penilo on 9/09/2014.
//  Copyright (c) 2014 Get IT Going. All rights reserved.
//

#import "GIGViewController.h"
#import "GIGFactory.h"
#import "GIGTile.h"

@interface GIGViewController ()

@end

@implementation GIGViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    //Run the 4 by 3 grid for the navigation, as well as the initial character and the final challenge.
    GIGFactory *factory = [[GIGFactory alloc] init];
    self.tiles = [factory tiles];
    self.character = [factory character];
    self.crevisse = [factory crevisse];
    
    //This makes the character start at the first tile.
    self.currentPoint = CGPointMake(0, 0);
    
    //This makes the initial stats for the character as set out in the factory get loaded up.
    [self updateCharacterStatsForSupply:nil withTool:nil withHealthEffect:0];
    
    //This updates the information displayed for the tile the character lands on.
    [self updateTile];
    
    //This updates whether the navigation buttons are visible or not so out of bounds areas are inaccessible.
    [self updateButtons];
    
    //This hides the reset button at the start of the game.
    self.resetButton.hidden = YES;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//Updating relevant data when the player presses the action button.
- (IBAction)actionButtonPressed:(UIButton *)sender {
    
    //This checks the current tile coordinate.
    GIGTile *tile = [[self.tiles objectAtIndex:self.currentPoint.x] objectAtIndex:self.currentPoint.y];
    
    //This checks if the tile landed on is the final challenge tile and reduces the boss health accordingly.
    if (tile.healthEffect == -15)
    {
        self.crevisse.health = self.crevisse.health - self.character.knowledge;
    }
    //This updates the character stats.
    [self updateCharacterStatsForSupply:tile.supply withTool:tile.tool withHealthEffect:tile.healthEffect];
    
    //This displays the updated character stats.
    [self updateTile];
    
    //Winner or loser messages, plus the game automatically resets itself as well.
    if (self.character.health <= 0)
    {
        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Starved Message" message:@"You have died of hunger. Please restart the game." delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [alertView show];
        [self viewDidLoad];
    }
    else if (self.crevisse.health <=0)
    {
        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Victory Message" message:@"You have successfully climbed to safety." delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil];
        [alertView show];
        [self viewDidLoad];
    }
}

//The following four methods move the character to a new tile depending on whether the press north, south, east or west.
- (IBAction)northButtonPressed:(UIButton *)sender {
    self.currentPoint = CGPointMake(self.currentPoint.x, self.currentPoint.y + 1);
    [self updateTile];
    [self updateButtons];
}

- (IBAction)southButtonPressed:(UIButton *)sender {
    self.currentPoint = CGPointMake(self.currentPoint.x, self.currentPoint.y - 1);
    [self updateTile];
    [self updateButtons];
}

- (IBAction)eastButtonPressed:(UIButton *)sender {
    self.currentPoint = CGPointMake(self.currentPoint.x + 1, self.currentPoint.y);
    [self updateTile];
    [self updateButtons];
}

- (IBAction)westButtonPressed:(UIButton *)sender {
    self.currentPoint = CGPointMake(self.currentPoint.x - 1, self.currentPoint.y);
    [self updateTile];
    [self updateButtons];
}

//This resets the game when pressed by the player.
- (IBAction)resetButtonPressed:(UIButton *)sender {
    [self viewDidLoad];
}

//This updates the information displayed for the tile the character lands on.
-(void)updateTile
{
    GIGTile *tileModel = [[self.tiles objectAtIndex:self.currentPoint.x] objectAtIndex:self.currentPoint.y];
    
    self.storyLabel.text = tileModel.story;
    self.backgroundImageView.image = tileModel.backgroundImage;
    self.healthLabel.text = [NSString stringWithFormat:@"%i", self.character.health];
    self.knowledgeLabel.text = [NSString stringWithFormat:@"%i", self.character.knowledge];
    self.toolLabel.text = self.character.tool.name;
    self.supplyLabel.text = self.character.supply.name;
    [self.actionButton setTitle:tileModel.actionButtonName forState:UIControlStateNormal];
    self.resetButton.hidden = NO;
}

//This updates whether the navigation buttons are visible or not so out of bounds areas are inaccessible.
-(void)updateButtons
{
    //Check the current tile coordinate.
    GIGTile *tile = [[self.tiles objectAtIndex:self.currentPoint.x] objectAtIndex:self.currentPoint.y];
    //If the current tile is the final challenge, this will hide all navigation buttons so the player cannot back out.
    if (tile.healthEffect == -15)
    {
        self.northButton.hidden = YES;
        self.southButton.hidden = YES;
        self.eastButton.hidden = YES;
        self.westButton.hidden = YES;
    }
    else
    {
    self.northButton.hidden = [self tileExistsAtPoint:CGPointMake(self.currentPoint.x, self.currentPoint.y + 1)];
    self.southButton.hidden = [self tileExistsAtPoint:CGPointMake(self.currentPoint.x, self.currentPoint.y - 1)];
    self.eastButton.hidden = [self tileExistsAtPoint:CGPointMake(self.currentPoint.x + 1, self.currentPoint.y)];
    self.westButton.hidden = [self tileExistsAtPoint:CGPointMake(self.currentPoint.x - 1, self.currentPoint.y)];
    }
}

//Checks whether a tile exists at coordinates surrounding the current tile the player is on.
-(BOOL)tileExistsAtPoint:(CGPoint)point
{
    if (point.x >=0 && point.y >=0 && point.x < [self.tiles count] && point.y < [[self.tiles objectAtIndex:point.x] count]){
        return NO;
    }
    else {
        return YES;
    }
}

//This updates the supply, tool, and health effect stats for the character depending on the properties that exist on the current tile.
-(void)updateCharacterStatsForSupply: (GIGSupply *)supply withTool: (GIGTool *)tool withHealthEffect: (int)healthEffect
{
    if (supply != nil){
        self.character.health = self.character.health - self.character.supply.health + supply.health;
        self.character.supply = supply;
    }
    else if (tool != nil){
        self.character.knowledge = self.character.knowledge - self.character.tool.knowledge + tool.knowledge;
        self.character.tool = tool;
    }
    else if (healthEffect != 0){
        self.character.health = self.character.health + healthEffect;
    }
    else {
        self.character.health = self.character.health + self.character.supply.health;
        self.character.knowledge = self.character.knowledge + self.character.tool.knowledge;
    }
}

@end
