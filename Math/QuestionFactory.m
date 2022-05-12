//
//  QuestionFactory.m
//  Math
//
//  Created by Mark Wong on 2022-05-12.
//

#import "QuestionFactory.h"
#import "Question.h"

@implementation QuestionFactory { }

- (instancetype) init {
  if (self == [super init]) {
    _questionSubclassNames = [[NSArray alloc] initWithObjects:@"AdditionQuestion", @"SubtractionQuestion", @"MultiplicationQuestion", @"DivisionQuestion", nil];
  }
  return self;
}

- (Question *) generateRandomQuestion {
  int randomIndex = arc4random_uniform((int)[_questionSubclassNames count]);
  NSString *className = [_questionSubclassNames objectAtIndex:randomIndex];
  return [[NSClassFromString(className) alloc] init];
}

@end
