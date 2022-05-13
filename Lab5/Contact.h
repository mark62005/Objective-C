//
//  Contact.h
//  Lab5
//
//  Created by Mark Wong on 2022-05-12.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Contact : NSObject

@property (nonatomic) NSString *firstName;
@property (nonatomic) NSString *lastName;
@property (nonatomic) NSString *email;
@property (nonatomic) NSMutableDictionary *phoneNumbers;

- (instancetype) initWithFirstName: (NSString *)firstName andLastName: (NSString *)lastName andEmail: (NSString *) email;
- (instancetype) initWithFirstName: (NSString *)firstName andLastName: (NSString *)lastName andEmail: (NSString *) email andPhoneNumbers: (NSMutableDictionary *)phoneNumbers;
- (void) printDetails;

+ (BOOL) isPhoneFormat: (NSString *)input;
+ (BOOL) isEmailFormat: (NSString *)input;

@end

NS_ASSUME_NONNULL_END
