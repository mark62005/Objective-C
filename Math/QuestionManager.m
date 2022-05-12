//
//  QuestionManager.m
//  Math
//
//  Created by Mark Wong on 2022-05-11.
//

#import "QuestionManager.h"
#import "Question.h"

@implementation QuestionManager { }

- (instancetype) init {
  if (self == [super init]) {
    _questions = [NSMutableArray new];
  }
  return self;
}

- (void) addQuestion: (Question *)q {
  [_questions addObject:q];
}

- (NSTimeInterval) getTotalTime {
  double totalTime = 0;
  for (id question in _questions) {
    totalTime += [question timeToAnswer];
  }
  return totalTime;
}

- (NSString *) timeOutput {
  double totalTime = [self getTotalTime];
  
  double avgTime = totalTime / [_questions count];
  return [NSString stringWithFormat:@"total time: %ds, average time: %ds", (int)totalTime, (int)avgTime]; 
}

@end
