//
//  main.m
//  Enum_Bitmasks
//
//  Created by Mark Wong on 2022-05-19.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(int, VideoGameType) {
  VideoGameTypeRPG,
  VideoGameTypeStrategy,
  VideoGameTypeAction,
  VideoGameTypeFPS
};

int main(int argc, const char * argv[]) {
  @autoreleasepool {
    VideoGameType type = VideoGameTypeAction;
    NSLog(@"%d", type);
    NSLog(@"sizeof(type) = %ld", sizeof(type));
    NSLog(@"sizeof(int) = %ld", sizeof(int));
    switch (type) {
      case VideoGameTypeRPG:
        NSLog(@"RPG");
        break;
      case VideoGameTypeStrategy:
        NSLog(@"Strategy");
        break;
      case VideoGameTypeAction:
        NSLog(@"Action");
        break;
      case VideoGameTypeFPS:
        NSLog(@"FPS");
    }
  }
  return 0;
}
