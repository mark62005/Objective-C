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
  NSMutableDictionary *phoneNumbers1 = [[NSMutableDictionary alloc] initWithObjectsAndKeys:@"123-123-1234", @"Mobile", @"111-111-1111", @"Home", nil];
  Contact *mark = [[Contact alloc] initWithFirstName:@"Mark" andLastName:@"Wong" andEmail:@"mark@email.com" andPhoneNumbers:phoneNumbers1];
  Contact *thomas = [[Contact alloc] initWithFirstName:@"Thomas" andLastName:@"Wong" andEmail:@"thomas@email.com"];
  Contact *cathy = [[Contact alloc] initWithFirstName:@"Cathy" andLastName:@"Wong" andEmail:@"cathy@email.com"];
  Contact *cyn = [[Contact alloc] initWithFirstName:@"Cyn" andLastName:@"Wong" andEmail:@"cyn@email.com"];
  
  [contactList addContact:mark];
  [contactList addContact:thomas];
  [contactList addContact:cathy];
  [contactList addContact:cyn];
  NSLog(@"Sample data has been added successfully.");
  return 0;
}

NSString *validateEmail(ContactList *contactList, InputCollector *inputCollector, NSString *emailInput) {
  emailInput = [inputCollector handleRequiredFieldError:@"email" forInput:emailInput];
  emailInput = [inputCollector handleInputError:@"email" forInput:emailInput];
  emailInput = [inputCollector handleDuplicateEmail:emailInput in:contactList];
  return emailInput;
}

int addNewContact(ContactList *contactList, InputCollector *inputCollector) {
  NSString *firstNameInput = [inputCollector inputForPrompt:@"Enter your first name: "];
  // required field
  firstNameInput = [inputCollector handleRequiredFieldError:@"first name" forInput:firstNameInput];
  
  NSString *lastNameInput = [inputCollector inputForPrompt:@"Enter your last name: "];
  NSString *emailInput = [inputCollector inputForPrompt:@"Enter your email address: "];
  emailInput = validateEmail(contactList, inputCollector, emailInput);
  
  NSMutableDictionary *phoneNumbers = [NSMutableDictionary new];
  NSString *addPhoneNumberInput = [inputCollector inputForPrompt:@"Do you want to add a phone number? (y/n)"];
  
  // Input must be y / n
  addPhoneNumberInput = [inputCollector handleInputError:@"y or n" forInput:addPhoneNumberInput];
  // if input is y, then add a new phone number
  while ([[addPhoneNumberInput lowercaseString] isEqualToString:@"y"]) {
    NSString *phoneOptionInput = [inputCollector inputForPrompt:@"Select the following option(0: Mobile, 1: Work, 2: Home): "];
    // input must be 0-2
    phoneOptionInput = [inputCollector handleInputError:@"phone option" forInput:phoneOptionInput];
    
    NSString *phoneNumberInput = [inputCollector inputForPrompt:@"Enter your phone number (eg. XXX-XXX-XXXX): "];
    if (![phoneNumberInput isEqualToString:@""]) {
      // input must follow XXX-XXX-XXXX
      phoneNumberInput = [inputCollector handleInputError:@"phone number" forInput:phoneNumberInput];
      printf(" \n");
    }
    
    NSArray *phoneTypes = [[NSArray alloc] initWithObjects:@"Mobile", @"Work", @"Home", nil];
    [phoneNumbers setValue:phoneNumberInput forKey:[phoneTypes objectAtIndex:[phoneOptionInput intValue]]];
    
    addPhoneNumberInput = [inputCollector inputForPrompt:@"Do you want to add a phone number? (y/n)"];
    // Input must be y / n
    addPhoneNumberInput = [inputCollector handleInputError:@"y or n" forInput:addPhoneNumberInput];
  }
  
  Contact *newContact = [[Contact alloc] initWithFirstName:firstNameInput andLastName:lastNameInput andEmail:emailInput andPhoneNumbers: phoneNumbers];
  [contactList addContact:newContact];
  return 0;
}

BOOL isNumeric(NSString *userInput) {
  NSRegularExpression *numericRegex = [NSRegularExpression regularExpressionWithPattern:@"^\\d+$" options:NSRegularExpressionCaseInsensitive error:nil];
  return [numericRegex numberOfMatchesInString:userInput options:0 range:NSMakeRange(0, [userInput length])] > 0;
}

int showContactDetail(ContactList *contactList, InputCollector *inputCollector) {
  NSString *idInput = [inputCollector inputForPrompt:@"Enter contact id: "];
  idInput = [inputCollector handleInputError:@"contact id" forInput:idInput];
  printf(" \n");
  
  @try {
    Contact *contact = [contactList getContactById:(int)[idInput integerValue]];
    [contact printDetails];
  }
  @catch(NSException *e) {
    NSLog(@"%@", [e reason]);
  }
  return 0;
}

int searchContact(ContactList *contactList, InputCollector *inputCollector) {
  NSString *keywordInput = [inputCollector inputForPrompt:@"Enter your keyword: "];
  return 0;
}

int main(int argc, const char * argv[]) {
  @autoreleasepool {
    NSString *menu = @"\nWhat would you like to do next? \nnew - Create a new contact \nlist - List all contacts \nshow - Display details along with an index \nfind - Find contact with a keyword \nquit - Exit Application";
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
      else if ([userInput isEqualToString:@"find"]) {
        searchContact(contactList, inputCollector);
      }
      else {
        printf(" \n");
        NSLog(@"Something went wrong, please try again.");
      }
    }
  }
  return 0;
}
