//
//  XYPoint.m
//  Generate-HTML-table
//
//  Created by Nihad on 1/15/21.
//

#import "XYPoint.h"

@implementation XYPoint

@synthesize x;
@synthesize y;

- (instancetype)init {
    self = [super init];
    if (self) {
        self.x = [[NSNumber alloc] initWithDouble:0];
        self.y = [[NSNumber alloc] initWithDouble:0];
    }
    return self;
}

- (instancetype) initWithX:(NSNumber *)x andY:(NSNumber *)y {
    self = [super init];
    if (self) {
        self.x = x;
        self.y = y;
    }
    return self;
}

@end
