//
//  Box.h
//  Lab2
//
//  Created by Mark Wong on 2022-05-10.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Box : NSObject

@property (nonatomic) CGFloat height;
@property (nonatomic) CGFloat width;
@property (nonatomic) CGFloat length;

- (instancetype) initWithHeight: (CGFloat) height andWidth: (CGFloat) width andLength: (CGFloat) length;
- (CGFloat) getVolume;

@end

NS_ASSUME_NONNULL_END
