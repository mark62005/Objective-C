//
//  main.m
//  Lab3
//
//  Created by Mark Wong on 2022-05-11.
//

#import <Foundation/Foundation.h>
#import "InputHandler.h"
#import "ScoreKeeper.h"
#import "QuestionManager.h"
#import "QuestionFactory.h"
#import "Question.h"

void printResults(BOOL isRightAnswer, ScoreKeeper *scoreKeeper, QuestionManager *questionManager) {
  printf(" \n");
  if (isRightAnswer) {
    [scoreKeeper setRightCount:[scoreKeeper rightCount] + 1];
    NSLog(@"Right!");
  } else {
    [scoreKeeper setWrongCount:[scoreKeeper wrongCount] + 1];
    NSLog(@"Wrong!");
  }
  
  NSLog(@"Score: %d right, %d wrong ---- %.2f%%", [scoreKeeper rightCount], [scoreKeeper wrongCount], [scoreKeeper getRightPercentage]);
  NSLog(@"%@", [questionManager timeOutput]);
}

int main(int argc, const char * argv[]) {
  @autoreleasepool {
    BOOL isGameOn = YES;
    ScoreKeeper *scoreKeeper = [[ScoreKeeper alloc] init];
    QuestionManager *questionManager = [[QuestionManager alloc] init];
    QuestionFactory *questionFactory = [[QuestionFactory alloc] init];
    
    NSLog(@"MATHS!");
    printf("\n");
    
    while (isGameOn) {
      Question *newQuestion = [questionFactory generateRandomQuestion];
      [questionManager addQuestion:newQuestion];
      
      NSString *userInput = [InputHandler getUserInput:[newQuestion question]];
      if ([[userInput lowercaseString] isEqualToString:@"quit"]) {
        isGameOn = NO;
        continue;
      }
      else {
        printResults([Question compare:[userInput intValue] with:[newQuestion answer]], scoreKeeper, questionManager);
      }
    }
  }
  return 0;
}
