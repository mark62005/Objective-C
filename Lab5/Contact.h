//
//  Contact.h
//  Lab5
//
//  Created by Mark Wong on 2022-05-12.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Contact : NSObject

@property (nonatomic, readwrite) NSString *name;
@property (nonatomic, readwrite) NSString *email;

- (instancetype) initWithName: (NSString *) name andEmail: (NSString *) email;

@end

NS_ASSUME_NONNULL_END
