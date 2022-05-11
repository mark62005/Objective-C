//
//  main.m
//  Lab3
//
//  Created by Mark Wong on 2022-05-11.
//

#import <Foundation/Foundation.h>
#import "InputHandler.h"
#import "AdditionQuestion.h"

int main(int argc, const char * argv[]) {
  @autoreleasepool {
    BOOL isGameOn = YES;
    
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
        printf(" \n");
        if ([userInput intValue] == [newAQ answer]) {
          NSLog(@"Right!");
        } else {
          NSLog(@"Wrong!");
        }
      }
    }
  }
  return 0;
}
