//
//  main.m
//  Lab5
//
//  Created by Mark Wong on 2022-05-12.
//

#import <Foundation/Foundation.h>
#import "InputCollector.h"
#import "ContactList.h"
#import "Contact.h"

int main(int argc, const char * argv[]) {
  @autoreleasepool {
    NSString *menu = @"\nThe menu: \nWhat would you like to do next? \nnew - Create a new contact \nlist - List all contacts \nquit - Exit Application \n>_";
    InputCollector *inputCollector = [[InputCollector alloc] init];
    ContactList *contactList = [[ContactList alloc] init];
    
    while (YES) {
      NSString *userInput = [[inputCollector inputForPrompt:menu] lowercaseString];
      
      if ([userInput isEqualToString:@"quit"]) {
        NSLog(@"Bye!");
        break;
      }
      else if ([userInput isEqualToString:@"new"]) {
        NSString *nameInput = [inputCollector inputForPrompt:@"Enter contact name: "];
        NSString *emailInput = [inputCollector inputForPrompt:@"Enter contact email: "];
        Contact *newContact = [[Contact alloc] initWithName:nameInput andEmail:emailInput];
        
        [contactList addContact:newContact];
      }
      else if ([userInput isEqualToString:@"list"]) {
        [contactList printContacts];
      }
      else {
        NSLog(@"Something went wrong, please try again.");
      }
    }
  }
  return 0;
}
