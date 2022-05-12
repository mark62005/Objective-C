//
//  ScoreKeeper.m
//  Math
//
//  Created by Mark Wong on 2022-05-11.
//

#import "ScoreKeeper.h"

@implementation ScoreKeeper { }

- (instancetype) init {
  if (self == [super init]) {
    _rightCount = 0;
    _wrongCount = 0;
  }
  return self;
}

- (float) getRightPercentage {
  return (float)_rightCount / (float)(_rightCount + _wrongCount) * 100;
}

@end
