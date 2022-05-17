//
//  InputCollector.m
//  Threelow
//
//  Created by Mark Wong on 2022-05-15.
//

#import "InputCollector.h"
#import "GameController.h"
#import "Dice.h"

@implementation InputCollector

+ (NSString *)inputForPrompt: (NSString *)prompt
{
  char inputChars[255];
  
  NSLog(@"%@", prompt);
  fgets(inputChars, 255, stdin);
  
  NSString *inputStr = [NSString stringWithCString:inputChars encoding:NSUTF8StringEncoding];
  NSCharacterSet *whitespace = [NSCharacterSet whitespaceAndNewlineCharacterSet];
  return [[inputStr stringByTrimmingCharactersInSet:whitespace] lowercaseString];
}

+ (BOOL) validateDieNumberInput: (int)dieNumber forGameController: (GameController *)gc
{
  if (dieNumber < 1 || dieNumber > 5) {
    NSException *dieNumberOutOfRangeException = [NSException
                                                 exceptionWithName:@"dieNumberOutOfRangeException"
                                                 reason:@"Please enter a number of 1-5."
                                                 userInfo:nil];
    @throw dieNumberOutOfRangeException;
  }
  Dice *dieToHold = [[gc dices] objectAtIndex:dieNumber - 1];
  if ([dieToHold isHeld]) {
    NSException *dieHasBeenHeldException = [NSException
                                                 exceptionWithName:@"dieHasBeenHeldException"
                                                 reason:@"This die has been held, please try another one."
                                                 userInfo:nil];
    @throw dieHasBeenHeldException;
  }
  return YES;
}

@end
