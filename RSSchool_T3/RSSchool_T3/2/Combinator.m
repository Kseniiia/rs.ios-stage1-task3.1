#import "Combinator.h"

@implementation Combinator
- (NSUInteger)factorial:(NSUInteger)n {
    if (n == 1) {
        return 1;
    }
    return n * [self factorial:n - 1];
}

- (NSUInteger)binomialCoefficient:(NSUInteger)n k:(NSUInteger)k {
    return [self factorial:n] / ([self factorial:k] * [self factorial:n - k]);
}

- (NSNumber*)chechChooseFromArray:(NSArray <NSNumber*>*)array {
    NSUInteger c = [[array objectAtIndex:0] unsignedIntegerValue];
    NSUInteger n = [[array objectAtIndex:1] unsignedIntegerValue];
    
    for (NSUInteger k = 1; k <= n / 2; k++) {
        if ([self binomialCoefficient:n k:k] == c) {
            return [NSNumber numberWithUnsignedInteger:k];
        }
    }
    
    return nil;
}
@end
