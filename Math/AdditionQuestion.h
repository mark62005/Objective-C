//
//  AdditionQuestion.h
//  Lab3
//
//  Created by Mark Wong on 2022-05-11.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface AdditionQuestion : NSObject

@property (nonatomic, readonly) NSString *question;
@property (nonatomic, readonly) int answer;

- (instancetype) init;
  
@end

NS_ASSUME_NONNULL_END
