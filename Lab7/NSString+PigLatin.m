//
//  NSString+PigLatin.m
//  Lab7
//
//  Created by Mark Wong on 2022-05-18.
//

#import "NSString+PigLatin.h"

@implementation NSString (PigLatin)

- (NSString *)stringByPigLatinization
{
  NSCharacterSet *punctuations = [NSCharacterSet punctuationCharacterSet];
  NSArray *clusters = @[@"Ch", @"Sh", @"Sm", @"St", @"Th", @"Ps", @"Ph", @"Pl", @"Gl"];
  NSCharacterSet *vowels = [NSCharacterSet characterSetWithCharactersInString:@"aeiou"];
  
  NSString *pigLatinWord = @"";
  NSString *results = @"";
  
  NSArray *words = [self componentsSeparatedByCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
  for (NSString *word in words) {
    NSRange firstVowel = [word rangeOfCharacterFromSet:vowels];
    if (firstVowel.location == 0) {
      pigLatinWord = [word stringByAppendingString:@"yay"];
    } else {
      pigLatinWord = [word substringFromIndex:firstVowel.location];
      pigLatinWord = [pigLatinWord stringByAppendingString:[word substringToIndex:firstVowel.location]];
      pigLatinWord = [pigLatinWord stringByAppendingString:@"ay"];
      pigLatinWord = [pigLatinWord capitalizedString];
    }
    
    results = [results stringByAppendingString:pigLatinWord];
    results = [results stringByAppendingString:@" "];
  }
  return results;
}

@end
