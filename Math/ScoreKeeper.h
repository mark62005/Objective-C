//
//  ScoreKeeper.h
//  Math
//
//  Created by Mark Wong on 2022-05-11.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface ScoreKeeper : NSObject

@property (nonatomic, readwrite) int rightCount;
@property (nonatomic, readwrite) int wrongCount;

- (instancetype) init;
- (float) getRightPercentage;
  
@end

NS_ASSUME_NONNULL_END
