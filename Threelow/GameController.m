//
//  GameController.m
//  Threelow
//
//  Created by Mark Wong on 2022-05-15.
//

#import "GameController.h"
#import "Dice.h"

@implementation GameController

- (instancetype)init
{
  self = [super init];
  if (self) {
    Dice *dice1 = [[Dice alloc] init];
    Dice *dice2 = [[Dice alloc] init];
    Dice *dice3 = [[Dice alloc] init];
    Dice *dice4 = [[Dice alloc] init];
    Dice *dice5 = [[Dice alloc] init];
    _dices = [[NSArray alloc] initWithObjects:dice1, dice2, dice3, dice4, dice5, nil];
    _heldDices = [NSMutableArray new];
    _menu = @"\n'roll' to roll the dice \n'hold' to hold a dice \n'unhold' to un-hold all dice \n'done' to end the game \n'display' to show current status\n";
    _remainingRolls = 5;
    _totalScore = 0;
  }
  return self;
}

- (void) rollDice
{
  for (int i = 0; i < 5; i++) {
    Dice *dice = [_dices objectAtIndex:i];
    if (![dice isHeld]) {
      [dice roll];
      NSLog(@"dice%d: %d", i + 1, (int)[dice score]);
    } else {
      NSLog(@"dice%d has been held.", i + 1);
    }
  }
  [self setRemainingRolls:_remainingRolls - 1];
}

- (void) holdDie: (NSInteger)dieIndex
{
  Dice *dieToHold = [_dices objectAtIndex:dieIndex];
  [dieToHold setIsHeld:YES];
  [_heldDices addObject:dieToHold];
  
  int newTotal = 0;
  for (id die in _heldDices) {
    newTotal += [die score];
  }
  [self setTotalScore:newTotal];
}

- (void) unholdDice
{
  for (id die in _dices) {
    if ([die isHeld]) {
      [die setIsHeld:NO];
    }
  }
  [self setHeldDices:[NSMutableArray new]];
}

- (void) endGame
{
  [self setRemainingRolls:0];
}

@end
