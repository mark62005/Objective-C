//
//  ContactList.h
//  Lab5
//
//  Created by Mark Wong on 2022-05-12.
//

#import <Foundation/Foundation.h>
#import "Contact.h"

NS_ASSUME_NONNULL_BEGIN

@interface ContactList : NSObject

@property (nonatomic) NSMutableDictionary *contacts;
@property (nonatomic) NSMutableSet *contactEmails;

- (void) addContact: (Contact *) newContact;
- (Contact *) getContactById: (int)contactId;
- (BOOL) isDuplicateEmail: (NSString *)newEmail;
- (void) printContacts;

@end

NS_ASSUME_NONNULL_END
