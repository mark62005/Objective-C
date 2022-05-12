//
//  ContactList.m
//  Lab5
//
//  Created by Mark Wong on 2022-05-12.
//

#import "ContactList.h"
#import "Contact.h"

@implementation ContactList { }

- (instancetype) init {
  if (self == [super init]) {
    _contacts = [NSMutableArray new];
  }
  return self;
}

- (void) addContact: (Contact *) newContact {
  [_contacts addObject:newContact];
}

- (void) printContactDetailOf: (int) contactId {
  if (contactId >= 0 && contactId < [_contacts count]) {
    Contact *contact = [_contacts objectAtIndex:contactId];
    NSLog(@"%d: <%@> (%@)", contactId, [contact name], [contact email]);
  }
  else {
    NSLog(@"Contact not found.");
  }
}

- (void) printContacts {
  if ([_contacts count] > 0) {
    for (int i = 0; i < [_contacts count]; i++) {
      [self printContactDetailOf:i];
    }
  } else {
    // handle error
    NSLog(@"Something went wrong, please try again.");
  }
}

@end
