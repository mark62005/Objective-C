//
//  main.m
//  Lab1
//
//  Created by Mark Wong on 2022-05-09.
//

#import <Foundation/Foundation.h>

NSString *menu = @"Choose one of the following options:\n1. Uppercase\n2. Lowercase\n3. Numberize\n4. Canadianize\n5. Respond\n6. De-Space-It\n7. Done\n\n";

NSString *getUserInput(NSString *prompt) {
  // 255 unit long array of characters
  char inputChars[255];
  
  NSLog(@"%@", prompt);
  fgets(inputChars, 255, stdin);
    
  // convert char array (C String) to a NSString object
  NSString *inputString = [NSString stringWithUTF8String:inputChars];
  NSCharacterSet *whiteSpaces = [NSCharacterSet whitespaceAndNewlineCharacterSet];
  return [inputString stringByTrimmingCharactersInSet:whiteSpaces];
}

int handleOperations(int operation, NSString *userInput) {
  if (operation == 1) {
    NSLog(@"%@", [userInput uppercaseString]);
  }
  else if (operation == 2) {
    NSLog(@"%@", [userInput lowercaseString]);
  }
  else if (operation == 3) {
    NSInteger intValue = [userInput integerValue];
    
    if (intValue) {
      NSLog(@"%ld", intValue);
    } else {
      NSLog(@"Input Cannot Be Converted to Integer.");
    }
  }
  else if (operation == 4) {
    NSString *newString = [userInput stringByAppendingString:@", eh?"];
    NSLog(@"%@", newString);
  }
  else if (operation == 5) {
    if ([userInput hasSuffix:@"?"]) {
      NSLog(@"I don't know.");
    } else if ([userInput hasSuffix:@"!"]) {
      NSLog(@"Whoa, calm down!");
    }
  }
  else if (operation == 6) {
    NSLog(@"%@", [userInput stringByReplacingOccurrencesOfString:@" " withString:@"-"]);
  }
  else if (operation == 7) {
    NSLog(@"Next String!");
    return 7;
  }
  else {
    NSLog(@"Something went wrong! Please try again.");
  }
  return 0;
}

int main(int argc, const char * argv[]) {
  @autoreleasepool {
    NSString *inputString = getUserInput(@"\nEnter your String: ('q' to quit)");
    
    while (![inputString isEqualToString:@"q"]) {
      int operation = 0;
      while (operation != 7) {
        NSString *operationString = getUserInput(menu);
        operation = [operationString intValue];
        
        if (handleOperations(operation, inputString) == 7) {
          inputString = getUserInput(@"\nEnter your String: ('q' to quit)");
        }
      }
    }
    NSLog(@"Bye!");
  }
  return 0;
}
