//
//  Box.m
//  Lab2
//
//  Created by Mark Wong on 2022-05-10.
//

#import "Box.h"

@implementation Box { }

- (instancetype) initWithHeight: (CGFloat) height andWidth: (CGFloat) width andLength: (CGFloat) length
{
  self = [super init];
  if (self) {
    _height = height;
    _width = width;
    _length = length;
  }
  return self;
}

- (CGFloat) getVolume {
  return [self height] * [self width] * [self length];
}

- (NSInteger) numberOfTimesToFitIn: (Box *) box2 {
  if ([self getVolume] > [box2 getVolume]) {
    return [self getVolume] / [box2 getVolume];
  }
  return [box2 getVolume] / [self getVolume];
}

@end
