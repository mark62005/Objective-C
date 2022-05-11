//
//  AdditionQuestion.m
//  Lab3
//
//  Created by Mark Wong on 2022-05-11.
//

#import "AdditionQuestion.h"

@implementation AdditionQuestion { }

- (instancetype) init {
  if (self = [super init]) {
    int int1 = arc4random_uniform(100);
    int int2 = arc4random_uniform(100);
    
    _question = [NSString stringWithFormat:@"%d + %d = ?", int1, int2];
    _answer = int1 + int2;
  }
  return self;
}

+ (void) compare: (NSInteger *) userInput with: (NSInteger *) answer {
  if (userInput == answer) {
    NSLog(@"Right!");
  } else {
    NSLog(@"Wrong!");
  }
}

@end
