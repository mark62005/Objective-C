//
//  ContactList.m
//  Lab5
//
//  Created by Mark Wong on 2022-05-12.
//

#import "ContactList.h"
#import "Contact.h"

@implementation ContactList

- (instancetype) init
{
  if (self == [super init]) {
    _contacts = [NSMutableDictionary new];
    _contactEmails = [NSMutableSet new];
  }
  return self;
}

- (void) addContact: (Contact *)newContact
{
  [_contacts setValue:newContact forKey:[newContact email]];
  [_contactEmails addObject:[newContact email]];
}

- (Contact *) getContactById: (int)contactId
{
  if (contactId >= 0 && contactId < [_contactEmails count]) {
    NSArray *emailArr = [_contactEmails allObjects];
    NSString *key = [emailArr objectAtIndex:contactId];
    return _contacts[key];
  }
  
  NSException *contactNotFoundException = [NSException
                                           exceptionWithName:@"ContactNotFoundException"
                                           reason:@"Contact Not Found"
                                           userInfo:nil];
  @throw contactNotFoundException;
}

//- (Contact *) getContactByKeyword: (NSString *)keyword
//{
//  if (contactId >= 0 && contactId < [_contacts count]) {
//    return [_contacts objectAtIndex:contactId];
//  }
//  
//  NSException *contactNotFoundException = [NSException
//                                           exceptionWithName:@"ContactNotFoundException"
//                                           reason:@"Contact Not Found"
//                                           userInfo:nil];
//  @throw contactNotFoundException;
//}

- (void) printContacts
{
  if ([_contacts count] > 0) {
    for (int i = 0; i < [_contacts count]; i++) {
      Contact *contact = [self getContactById:i];
      NSLog(@"%d: <%@ %@> (%@)", i, [contact firstName], [contact lastName], [contact email]);
    }
  } else {
    // handle error
    NSLog(@"Something went wrong, please try again.");
  }
}

@end
