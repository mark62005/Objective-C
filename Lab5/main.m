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

int addSampleContacts(ContactList *contactList) {
  Contact *mark = [[Contact alloc] initWithName:@"Mark" andEmail:@"mark@email.com"];
  Contact *thomas = [[Contact alloc] initWithName:@"Thomas" andEmail:@"thomas@email.com"];
  Contact *cathy = [[Contact alloc] initWithName:@"Cathy" andEmail:@"cathy@email.com"];
  Contact *cyn = [[Contact alloc] initWithName:@"Cyn" andEmail:@"cyn@email.com"];
  
  [contactList addContact:mark];
  [contactList addContact:thomas];
  [contactList addContact:cathy];
  [contactList addContact:cyn];
  NSLog(@"Sample data has been added successfully.");
  return 0;
}

int addNewContact(ContactList *contactList, InputCollector *inputCollector) {
  NSString *nameInput = [inputCollector inputForPrompt:@"Enter contact name: "];
  NSString *emailInput = [inputCollector inputForPrompt:@"Enter contact email: "];
  Contact *newContact = [[Contact alloc] initWithName:nameInput andEmail:emailInput];
  
  [contactList addContact:newContact];
  return 0;
}

int showContactDetail(ContactList *contactList, InputCollector *inputCollector) {
  NSString *idInput = [inputCollector inputForPrompt:@"Enter contact id: "];
  [contactList printContactDetailOf:[idInput intValue]];
  return 0;
}

int main(int argc, const char * argv[]) {
  @autoreleasepool {
    NSString *menu = @"\nThe menu: \nWhat would you like to do next? \nnew - Create a new contact \nlist - List all contacts \nshow - Show the detail with contact id \nquit - Exit Application \n>_";
    InputCollector *inputCollector = [[InputCollector alloc] init];
    ContactList *contactList = [[ContactList alloc] init];
    
    addSampleContacts(contactList);
    while (YES) {
      NSString *userInput = [[inputCollector inputForPrompt:menu] lowercaseString];
      
      if ([userInput isEqualToString:@"quit"]) {
        NSLog(@"Bye!");
        break;
      }
      else if ([userInput isEqualToString:@"new"]) {
        addNewContact(contactList, inputCollector);
      }
      else if ([userInput isEqualToString:@"list"]) {
        [contactList printContacts];
      }
      else if ([userInput isEqualToString:@"show"]) {
        showContactDetail(contactList, inputCollector);
      }
      else {
        NSLog(@"Something went wrong, please try again.");
      }
    }
  }
  return 0;
}
