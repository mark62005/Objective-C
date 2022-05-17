//
//  GameController.h
//  Threelow
//
//  Created by Mark Wong on 2022-05-15.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface GameController : NSObject

@property (nonatomic, readonly) NSString *menu;
@property (nonatomic) NSInteger remainingRolls;
@property (nonatomic) NSInteger totalScore;
@property (nonatomic) NSArray *dices;
@property (nonatomic) NSMutableArray *heldDices;

- (void) rollDice;
- (void) holdDie: (NSInteger)dieIndex;
- (void) unholdDice;
- (void) endGame;

@end

NS_ASSUME_NONNULL_END
