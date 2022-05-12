//
//  AdditionQuestion.h
//  Lab3
//
//  Created by Mark Wong on 2022-05-11.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Question : NSObject

@property (nonatomic, readonly) int rightValue;
@property (nonatomic, readonly) int leftValue;
@property (nonatomic, readwrite) NSString *question;
@property (nonatomic, readwrite) NSInteger answer;
@property (nonatomic, readonly) NSDate *startTime;
@property (nonatomic, readwrite) NSDate *endTime;

- (void) generateQuestion;
- (NSTimeInterval) timeToAnswer;
+ (BOOL) compare: (NSInteger) userInput with: (NSInteger) answer;
  
@end

NS_ASSUME_NONNULL_END
