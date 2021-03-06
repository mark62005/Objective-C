//
//  main.m
//  Inheritance
//
//  Created by Mark Wong on 2022-05-12.
//

#import <Foundation/Foundation.h>
#import "Person.h"
#import "Employee.h"

int main(int argc, const char * argv[]) {
  @autoreleasepool {
    Person *p = [[Person alloc] initWithName:@"Hello" andAge:30];
    [p printInfo];
    
    Employee *e = [[Employee alloc] initWithName:@"Hello" andAge:30 andPosition:@"Software Engineer"];
    [e printInfo];
  }
  return 0;
}
