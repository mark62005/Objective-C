//
//  AdditionQuestion.m
//  Lab3
//
//  Created by Mark Wong on 2022-05-11.
//

#import "Question.h"

@implementation Question { }

- (instancetype) init {
  if (self = [super init]) {
    _rightValue = arc4random_uniform(100);
    _leftValue = arc4random_uniform(100);
    
//    _question = [NSString stringWithFormat:@"%d + %d = ?", int1, int2];
//    _answer = int1 + int2;
    
    _startTime = [NSDate date];
  }
  return self;
}

// Override getter
- (NSInteger) answer {
  _endTime = [NSDate date];
  return _answer;
}

- (void) generateQuestion { }

- (NSTimeInterval) timeToAnswer {
  return [_endTime timeIntervalSinceDate:_startTime];
}

+ (BOOL) compare: (NSInteger) userInput with: (NSInteger) answer {
  if (userInput == answer) {
    return YES;
  }
  return NO;
}

@end
