//
//  main.m
//  Threelow
//
//  Created by Mark Wong on 2022-05-12.
//

#import <Foundation/Foundation.h>
#import "InputCollector.h"
#import "GameController.h"
#import "Dice.h"

NSString *getDieSymbol(Dice *die) {
  NSString *symbol = @"";
  
  if ([die score] == 1) {
    symbol = @"⚀";
  }
  else if ([die score] == 2) {
    symbol = @"⚁";
  }
  else if ([die score] == 0) {
    symbol = @"⚂";
  }
  else if ([die score] == 4) {
    symbol = @"⚃";
  }
  else if ([die score] == 5) {
    symbol = @"⚄";
  }
  else {
    symbol = @"⚅";
  }
  
  if ([die isHeld]) {
    return [NSString stringWithFormat:@"[%@]", symbol];
  }
  return symbol;
}

int printCurrentStatus(GameController *gc) {
  Dice *dice1 = [[gc dices] objectAtIndex:0];
  Dice *dice2 = [[gc dices] objectAtIndex:1];
  Dice *dice3 = [[gc dices] objectAtIndex:2];
  Dice *dice4 = [[gc dices] objectAtIndex:3];
  Dice *dice5 = [[gc dices] objectAtIndex:4];
  
  NSLog(@"Remaining Rolls: %ld   ", [gc remainingRolls]);
  NSLog(@"-----------------------");
  NSLog(@"--   Current Dice    --");
  NSLog(@" %@  %@  %@  %@  %@", getDieSymbol(dice1), getDieSymbol(dice2), getDieSymbol(dice3), getDieSymbol(dice4), getDieSymbol(dice5));
  NSLog(@"                       ");
  NSLog(@"--    Total Score    --");
  NSLog(@"Score: %ld             ", [gc totalScore]);
  NSLog(@"-----------------------");
  
  return 0;
}

int holdDie(GameController *gc) {
  int dieNumberInput = (int)[[InputCollector inputForPrompt:@"Enter the number of die:\n"] intValue];
  @try {
    
    [InputCollector validateDieNumberInput:dieNumberInput forGameController:gc];
    [gc holdDie:dieNumberInput - 1];
    printCurrentStatus(gc);
    
  } @catch (NSException *e) {
    NSLog(@"%@", [e reason]);
    holdDie(gc);
  }
  return 0;
}

int printResults(GameController *gc) {
  NSLog(@"GAME OVER");
  printCurrentStatus(gc);
  return 0;
}

int main(int argc, const char * argv[]) {
  @autoreleasepool {
    GameController *gc = [[GameController alloc] init];
    
    while ([gc remainingRolls] > 0) {
      NSString *userInput = [[InputCollector inputForPrompt:[gc menu]] lowercaseString];
      if ([userInput isEqualToString:@"roll"]) {
        [gc rollDice];
        NSLog(@"Remaining Rolls: %ld", [gc remainingRolls]);
        printCurrentStatus(gc);
      }
      else if ([userInput isEqualToString:@"hold"]) {
        holdDie(gc);
      }
      else if ([userInput isEqualToString:@"unhold"]) {
        [gc unholdDice];
        printCurrentStatus(gc);
      }
      else if ([userInput isEqualToString:@"done"]) {
        break;
      }
      else if ([userInput isEqualToString:@"display"]) {
        printCurrentStatus(gc);
      }
      else {
        NSLog(@"Something went wrong, please try again.");
      }
    }
    printResults(gc);
  }
  return 0;
}
