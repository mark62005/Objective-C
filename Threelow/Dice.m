//
//  Dice.m
//  Threelow
//
//  Created by Mark Wong on 2022-05-12.
//

#import "Dice.h"

@implementation Dice

- (instancetype)init
{
  self = [super init];
  if (self) {
    [self roll];
    _isHeld = NO;
  }
  return self;
}

- (void)roll
{
  int newScore = arc4random_uniform(6) + 1;
  if (newScore == 3) {
    newScore = 0;
  }
  [self setScore:newScore];
}

@end
