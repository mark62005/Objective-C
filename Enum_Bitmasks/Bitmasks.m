//
//  Bitmasks.m
//  Enum_Bitmasks
//
//  Created by Mark Wong on 2022-05-19.
//

#import "Bitmasks.h"

// bitwise operator
// - left shift <<
// - right shift >>

typedef NS_OPTIONS(char, Language) {
  English = 1,
  French = 1 << 1,
  Spanish = 1 << 2,
  Mandarin = 1 << 3,
};

Language support = English | French; // 3 bits
Language support2 = English | French | Spanish; // 7 bits

@implementation Bitmasks

void supportLanguage(Language l) {
  if (l & English) {
    NSLog(@"English is supported!");
  } else if (l & French) {
    NSLog(@"French is supported!");
  }
}

@end
