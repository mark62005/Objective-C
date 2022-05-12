//
//  InputCollector.h
//  Lab5
//
//  Created by Mark Wong on 2022-05-12.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface InputCollector : NSObject

- (NSString *) inputForPrompt: (NSString *) promptString;

@end

NS_ASSUME_NONNULL_END
