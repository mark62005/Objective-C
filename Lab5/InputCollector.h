//
//  InputCollector.h
//  Lab5
//
//  Created by Mark Wong on 2022-05-12.
//

#import <Foundation/Foundation.h>
#import "ContactList.h"

NS_ASSUME_NONNULL_BEGIN

@interface InputCollector : NSObject

- (NSString *)inputForPrompt: (NSString *)promptString;
- (NSString *)handleRequiredFieldError: (NSString *)field forInput: (NSString *) userInput;
- (NSString *)handleInputError: (NSString *)situation forInput: (NSString *) userInput;
- (NSString *)handleDuplicateEmail: (NSString *)emailInput in: (ContactList *)contactList;

@end

NS_ASSUME_NONNULL_END
