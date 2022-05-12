//
//  DivisionQuestion.m
//  Math
//
//  Created by Mark Wong on 2022-05-11.
//

#import "DivisionQuestion.h"

@implementation DivisionQuestion

- (instancetype) init {
  if (self = [super init]) {
    [self generateQuestion];
  }
  return self;
}

- (void) generateQuestion {
  [super setQuestion:[NSString stringWithFormat:@"%d / %d = ?", [super leftValue], [super rightValue]]];
  [super setAnswer:([super leftValue] / [super rightValue])];
}

@end
