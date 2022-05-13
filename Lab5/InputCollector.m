//
//  InputCollector.m
//  Lab5
//
//  Created by Mark Wong on 2022-05-12.
//

#import "InputCollector.h"
#import "ContactList.h"
#import "Contact.h"

@implementation InputCollector

- (NSString *)inputForPrompt: (NSString *)promptString
{
  char inputChars[255];
  
  NSLog(@"%@", promptString);
  fgets(inputChars, 255, stdin);
  
  NSString *inputString = [NSString stringWithCString:inputChars encoding:NSUTF8StringEncoding];
  return [inputString stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
}

- (NSString *)handleRequiredFieldError: (NSString *)field forInput: (NSString *)userInput
{
  while ([userInput length] == 0) {
    NSLog(@"This field is required.");
    
    if ([field isEqualToString:@"first name"]) {
      userInput = [self inputForPrompt:@"Enter your first name: "];
    }
    else if ([field isEqualToString:@"email"]) {
      userInput = [self inputForPrompt:@"Enter your email: "];
    }
    else if ([field isEqualToString:@"phone number"]) {
      userInput = [self inputForPrompt:@"Enter your phone number: "];
    }
  }
  return userInput;
}

- (BOOL)isNotNumeric: (NSString *)userInput {
  NSRegularExpression *numericRegex = [NSRegularExpression regularExpressionWithPattern:@"^\\d+$" options:NSRegularExpressionCaseInsensitive error:nil];
  return [numericRegex numberOfMatchesInString:userInput options:0 range:NSMakeRange(0, [userInput length])] < 1;
}

- (NSString *)handleInputError: (NSString *)situation forInput: (NSString *)userInput
{
  if ([situation isEqualToString:@"y or n"]) {
    // input must be y / n
    NSRegularExpression *yesOrNoRegex = [NSRegularExpression regularExpressionWithPattern:@"^(y|n)$" options:NSRegularExpressionCaseInsensitive error:nil];
    
    while ([yesOrNoRegex numberOfMatchesInString:userInput options:0 range:NSMakeRange(0, [userInput length])] < 1) {
      printf(" \n");
      NSLog(@"Something went wrong, please enter y or n.");
      userInput = [self inputForPrompt:@"Do you want to add a phone number? (y/n)"];
    }
  }
  else if ([situation isEqualToString:@"phone option"]) {
    // input must be 0 / 1 / 2
    NSRegularExpression *phoneOptionRegex = [NSRegularExpression regularExpressionWithPattern:@"^(0|1|2)$" options:NSRegularExpressionCaseInsensitive error:nil];
    while ([phoneOptionRegex numberOfMatchesInString:userInput options:0 range:NSMakeRange(0, [userInput length])] < 1) {
      printf(" \n");
      NSLog(@"Something went wrong, please enter a number from 0-2.");
      userInput = [self inputForPrompt:@"Select the following option(0: Mobile, 1: Work, 2: Home): "];
    }
  }
  else if ([situation isEqualToString:@"phone number"]) {
    // phone number format (XXX-XXX-XXXX)
    while (![Contact isPhoneFormat:userInput]) {
      printf(" \n");
      NSLog(@"Something went wrong, please follow this format XXX-XXX-XXXX.");
      userInput = [self inputForPrompt:@"Enter your phone number (eg. XXX-XXX-XXXX): "];
    }
  }
  else if ([situation isEqualToString:@"email"]) {
    // email format (example@domain)
    while (![Contact isEmailFormat:userInput]) {
      printf(" \n");
      NSLog(@"Something went wrong, please follow this format example@domain.");
      userInput = [self inputForPrompt:@"Enter your email(eg. example@domain): "];
    }
  }
  else if ([situation isEqualToString:@"contact id"]) {
    // input must be numeric
    while ([self isNotNumeric:userInput]) {
      printf(" \n");
      NSLog(@"Something went wrong, please enter a number.");
      userInput = [self inputForPrompt:@"Enter contact id: "];
    }
  }
  return userInput;
}

- (NSString *)handleDuplicateEmail: (NSString *)emailInput in: (ContactList *)contactList
{
  while ([contactList isDuplicateEmail:emailInput]) {
    printf(" \n");
    NSLog(@"This email has been used, please try another one.");
    emailInput = [self inputForPrompt:@"Enter your email: "];
    emailInput = [self handleRequiredFieldError:@"email" forInput:emailInput];
    emailInput = [self handleInputError:@"email" forInput:emailInput];
  }
  return emailInput;
}

@end
