//
//  QuestionManager.h
//  Math
//
//  Created by Mark Wong on 2022-05-11.
//

#import <Foundation/Foundation.h>
#import "Question.h"

NS_ASSUME_NONNULL_BEGIN

@interface QuestionManager : NSObject

@property (nonatomic, readwrite) NSMutableArray *questions;
- (void) addQuestion: (Question *)q;
- (NSString *) timeOutput;

@end

NS_ASSUME_NONNULL_END
