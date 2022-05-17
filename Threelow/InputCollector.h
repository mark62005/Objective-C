//
//  InputCollector.h
//  Threelow
//
//  Created by Mark Wong on 2022-05-15.
//

#import <Foundation/Foundation.h>
#import "GameController.h"

NS_ASSUME_NONNULL_BEGIN

@interface InputCollector : NSObject

+ (NSString *)inputForPrompt: (NSString *)prompt;
+ (BOOL) validateDieNumberInput: (int)dieNumber forGameController: (GameController *)gc;

@end

NS_ASSUME_NONNULL_END
