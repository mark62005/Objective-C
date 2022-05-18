//
//  main.m
//  Lab7
//
//  Created by Mark Wong on 2022-05-18.
//

#import <Foundation/Foundation.h>
#import "NSString+PigLatin.h"

int main(int argc, const char * argv[]) {
  @autoreleasepool {
    NSString *words = @"Hello World";
    NSLog(@"%@", [words stringByPigLatinization]);
  }
  return 0;
}
