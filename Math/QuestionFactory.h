//
//  QuestionFactory.h
//  Math
//
//  Created by Mark Wong on 2022-05-12.
//

#import <Foundation/Foundation.h>
#import "Question.h"

NS_ASSUME_NONNULL_BEGIN

@interface QuestionFactory : NSObject

@property (nonatomic, readonly) NSArray *questionSubclassNames;

- (Question *) generateRandomQuestion;

@end

NS_ASSUME_NONNULL_END
