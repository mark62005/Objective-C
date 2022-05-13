//
//  Contact.m
//  Lab5
//
//  Created by Mark Wong on 2022-05-12.
//

#import "Contact.h"

@implementation Contact

- (instancetype) initWithFirstName: (NSString *)firstName andLastName: (NSString *)lastName andEmail: (NSString *) email;
{
  if (self == [super init]) {
    _firstName = firstName;
    _lastName = lastName;
    _email = email;
    _phoneNumbers = nil;
  }
  return self;
}

- (instancetype) initWithFirstName: (NSString *)firstName andLastName: (NSString *)lastName andEmail: (NSString *) email andPhoneNumbers: (NSMutableDictionary *)phoneNumbers;
{
  if (self == [super init]) {
    _firstName = firstName;
    _lastName = lastName;
    _email = email;
    _phoneNumbers = phoneNumbers;
  }
  return self;
}

- (void) printDetails
{
  NSLog(@"\nFirst Name: %@ \nLast Name: %@ \nEmail: %@ \nMobile: %@ \nWork: %@ \nHome: %@ ",
        _firstName,
        (_lastName == nil || [_lastName isEqualToString:@""]) ? @"None" : _lastName,
        _email,
        ([_phoneNumbers objectForKey:@"Mobile"] == nil || [[_phoneNumbers objectForKey:@"Mobile"] isEqualToString:@""]) ? @"None" : [_phoneNumbers objectForKey:@"Mobile"],
        ([_phoneNumbers objectForKey:@"Work"] == nil || [[_phoneNumbers objectForKey:@"Work"] isEqualToString:@""]) ? @"None" : [_phoneNumbers objectForKey:@"Work"],
        ([_phoneNumbers objectForKey:@"Home"] == nil || [[_phoneNumbers objectForKey:@"Home"] isEqualToString:@""]) ? @"None" : [_phoneNumbers objectForKey:@"Home"]
  );
  printf(" \n");
}

+ (BOOL) isPhoneFormat: (NSString *)input
{
  NSRegularExpression *regex = [NSRegularExpression regularExpressionWithPattern:@"^\\d{3}\\-\\d{3}\\-\\d{4}$" options:NSRegularExpressionCaseInsensitive error:nil];
  return [regex numberOfMatchesInString:input options:0 range:NSMakeRange(0, [input length])] > 0;
}

+ (BOOL) isEmailFormat: (NSString *)input
{
  NSRegularExpression *regex = [NSRegularExpression regularExpressionWithPattern:@"^[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.(.+)$" options:NSRegularExpressionCaseInsensitive error:nil];
  return [regex numberOfMatchesInString:input options:0 range:NSMakeRange(0, [input length])] > 0;
}

@end
