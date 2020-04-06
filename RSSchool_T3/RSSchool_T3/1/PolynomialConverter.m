#import "PolynomialConverter.h"

@implementation PolynomialConverter
- (NSString*)convertToStringFrom:(NSArray <NSNumber*>*)numbers {
    
    NSUInteger count = numbers.count;
    if (count == 0) {
        return nil;
    }
    
    NSMutableString *string = [[NSMutableString alloc] init];
    
    for (NSUInteger i = 0; i < count; i++) {
        NSInteger num = [[numbers objectAtIndex:i] integerValue];
        if (num != 0) {
            if (num < 0) {
                [string appendString:@" - "];
            } else if (i != 0) {
                [string appendString:@" + "];
            }
            num = labs(num);
            if (num != 1) {
                [string appendString:[NSString stringWithFormat:@"%ld", num]];
            }
            NSUInteger degree = count - 1 - i;
            if (degree > 0) {
                [string appendString:@"x"];
                if (degree > 1) {
                    [string appendString:@"^"];
                    [string appendString:[NSString stringWithFormat:@"%lu", degree]];
                }
            }
        }
    }
    
    return string;
}
@end
