//
//  InputCollector.m
//  Lab5
//
//  Created by Mark Wong on 2022-05-12.
//

#import "InputCollector.h"

@implementation InputCollector { }

- (NSString *) inputForPrompt: (NSString *) promptString {
  char inputChars[255];
  
  NSLog(@"%@", promptString);
  fgets(inputChars, 255, stdin);
  
  NSString *inputString = [NSString stringWithCString:inputChars encoding:NSUTF8StringEncoding];
  return [inputString stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
}

@end
