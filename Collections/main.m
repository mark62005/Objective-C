//
//  main.m
//  Collections
//
//  Created by Mark Wong on 2022-05-11.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
  @autoreleasepool {
    
    // Arrays (NSMutableArray, NSArray)
    NSArray *myArr = [[NSArray alloc] initWithObjects:@"Monday", @"Tuesday", @"Wednesday", nil];
    NSString *first = [myArr objectAtIndex:0];
    NSInteger i = [myArr indexOfObject:@"Tuesday"];
    NSLog(@"%ld", i);
    NSLog(@"%@", first);
    
    NSMutableArray *mutArr = [[NSMutableArray alloc] init];
    NSMutableArray *mut = [NSMutableArray new];
    NSMutableArray *mut2 = [NSMutableArray array];
    [mutArr addObject:@"Vancouver"];
    [mutArr addObject:@"Burnaby"];
    [mutArr addObject:@"Surrey"];
    [mutArr addObject:@"Richmond"];
    
    // C-Style Array (unmutable)
    int arr[10];
    arr[0] = 1;
    
    // Sets (NSMutableSet, NSSet)
    NSSet *mySet = [[NSSet alloc] initWithObjects:@"one", @"two", @"three", nil];
    NSLog(@"%ld", [mySet count]);
    
    if ([mySet containsObject:@"one"]) {
      NSLog(@"YES");
    }
    
    NSMutableSet *mutSet = [NSMutableSet new];
    [mutSet addObject:@"one"];
    [mutSet addObject:@"two"];
    [mutSet addObject:@"three"];
    
    // Dictionaries (NSMutableDictionary, NSDictionary)
    NSDictionary *myDict = [[NSDictionary alloc] initWithObjectsAndKeys:@"Canada", @"ca", @"USA", @"us", nil];
    NSLog(@"%@", myDict[@"ca"]);
    
    
    // 0 - 100;
    int rand = arc4random_uniform(100);
    NSLog(@"%d", rand);
  }
  return 0;
}
