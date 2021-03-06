//
//  Dice.h
//  Threelow
//
//  Created by Mark Wong on 2022-05-12.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Dice : NSObject

@property (nonatomic) NSInteger score;
@property (nonatomic) BOOL isHeld;

- (void)roll;

@end

NS_ASSUME_NONNULL_END
