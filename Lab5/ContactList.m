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

- (BOOL) isDuplicateEmail: (NSString *)newEmail
{
  return [_contactEmails containsObject:newEmail];
}

- (NSMutableSet *) getContactsByKeyword: (NSString *)keyword
{
  NSMutableSet *results = [NSMutableSet new];
  for (Contact *contact in [_contacts allValues]) {
    NSString *firstName = [[contact firstName] lowercaseString];
    NSString *lastName = [[contact lastName] lowercaseString];
    NSString *email = [[contact email] lowercaseString];
    if ([firstName containsString:keyword] || [lastName containsString:keyword] || [email containsString:keyword]) {
      [results addObject:contact];
    }
  }
  if ([results count] > 0) {
    return results;
  }
  
  NSException *contactNotFoundException = [NSException
                                           exceptionWithName:@"ContactNotFoundException"
                                           reason:@"Contact Not Found"
                                           userInfo:nil];
  @throw contactNotFoundException;
}

- (void) printContacts
{
  if ([_contacts count] > 0) {
    int i = 0;
    for (Contact *contact in [_contacts allValues]) {
      NSLog(@"%d: <%@ %@> (%@)", i, [contact firstName], [contact lastName], [contact email]);
      i++;
    }
  } else {
    // handle error
    NSLog(@"Something went wrong, please try again.");
  }
}

@end
