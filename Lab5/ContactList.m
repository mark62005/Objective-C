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

- (void) printContacts {
  if ([_contacts count] > 0) {
    for (int i = 0; i < [_contacts count]; i++) {
      Contact *contact = [_contacts objectAtIndex:i];
      NSLog(@"%d: <%@> (%@)", i, [contact name], [contact email]);
    }
  } else {
    // handle error
    NSLog(@"Something went wrong, please try again.");
  }
}

@end
