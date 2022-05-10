//
//  main.m
//  ObjectiveCCourse
//
//  Created by Mark Wong on 2022-05-09.
//

#import <Foundation/Foundation.h>

typedef int num;

int main(int argc, const char * argv[]) {
  @autoreleasepool {
    // C
    printf("Hello, World!\n");
    bool flag1 = true; // false
    float f1 = 3.14f;
    long long l = 100000;
    
    int8_t i1 = 127;
    int16_t i2 = 127;
    int32_t i3 = 127;
    int64_t i4 = 127;
    
    // Objective-C
    NSLog(@"Hello, World!");
    
    // Bool
    // iOS --> 64 bits
    // else
    // typedef signed char BOOL; --> 8 bits
    BOOL flag2 = YES; // NO
    
    // Float
    CGFloat f2 = 3.14;
    
    // Integer
    NSInteger i5 = 10;
    NSUInteger i6 = 10; // unsigned -> positive only
    
    // in Objective-C (NSString)
    // similar to Java String
    NSString *name = @"Mark";
    
    NSUInteger len = [name length];
    
    NSComparisonResult i = [name compare:@"Hello"];
    if (i == 0) {
      // do something
    } else if (i < 0) {
      
    } else {
      
    }
    
    NSString *upper = [name uppercaseString];
    NSLog(@"Hello, %@", upper);
    
//    // in C (C String)
//    // nothing but an array of characters
//    char *s1 = "Mark";
//    char s2[] = "Mark";
//    char s3[8] = "Mark";
//    char s4[8] = {'M', 'a', 'r', 'k', '\0'};
//
//    // print the memory address
//    printf("%p %p\n", s4, &s4[0]);
  }
  return 0;
}
