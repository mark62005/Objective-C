//
//  InputHandler.m
//  Math
//
//  Created by Mark Wong on 2022-05-11.
//

#import "InputHandler.h"

@implementation InputHandler { }

+ (NSString *) getUserInput: (NSString *)prompt {
  char inputChars[255];
  
  NSLog(@"%@", prompt);
  fgets(inputChars, 255, stdin);
  
  NSString *inputString = [NSString stringWithCString:inputChars encoding:NSUTF8StringEncoding];
  NSCharacterSet *whiteSpaces = [NSCharacterSet whitespaceAndNewlineCharacterSet];
  return [inputString stringByTrimmingCharactersInSet:whiteSpaces];
}

@end
