//
//  Contact.m
//  Lab5
//
//  Created by Mark Wong on 2022-05-12.
//

#import "Contact.h"

@implementation Contact { }

- (instancetype) initWithName: (NSString *) name andEmail: (NSString *) email {
  if (self == [super init]) {
    _name = name;
    _email = email;
  }
  return self;
}

@end
