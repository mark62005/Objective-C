//
//  main.m
//  Lab3
//
//  Created by Mark Wong on 2022-05-11.
//

#import <Foundation/Foundation.h>
#import "InputHandler.h"
#import "ScoreKeeper.h"
#import "AdditionQuestion.h"

void printResults(int input, int answer, ScoreKeeper *scoreKeeper) {
  printf(" \n");
  if (input == answer) {
    [scoreKeeper setRightCount:[scoreKeeper rightCount] + 1];
    NSLog(@"Right!");
  } else {
    [scoreKeeper setWrongCount:[scoreKeeper wrongCount] + 1];
    NSLog(@"Wrong!");
  }
  
  NSLog(@"Score: %d right, %d wrong ---- %.2f%%", [scoreKeeper rightCount], [scoreKeeper wrongCount], [scoreKeeper getRightPercentage]);
}

int main(int argc, const char * argv[]) {
  @autoreleasepool {
    BOOL isGameOn = YES;
    ScoreKeeper *scoreKeeper = [[ScoreKeeper alloc] init];
    
    NSLog(@"MATHS!");
    printf("\n");
    
    while (isGameOn) {
      AdditionQuestion *newAQ = [[AdditionQuestion alloc] init];
      NSString *userInput = [InputHandler getUserInput:[newAQ question]];
      
      if ([[userInput lowercaseString] isEqualToString:@"quit"]) {
        isGameOn = NO;
        continue;
      }
      else {
        printResults([userInput intValue], [newAQ answer], scoreKeeper);
      }
    }
  }
  return 0;
}
