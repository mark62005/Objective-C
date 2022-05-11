//
//  main.m
//  Lab2
//
//  Created by Mark Wong on 2022-05-10.
//

#import <Foundation/Foundation.h>
#import "Box.h"

int main(int argc, const char * argv[]) {
  @autoreleasepool {
    Box *box1 = [[Box alloc] initWithHeight:4.2 andWidth:3.3 andLength:6.7];
    NSLog(@"Volume = %.02f", [box1 getVolume]);
  }
  return 0;
}
