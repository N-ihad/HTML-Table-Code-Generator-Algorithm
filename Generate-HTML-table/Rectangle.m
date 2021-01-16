//
//  Rectangle.m
//  Generate-HTML-table
//
//  Created by Nihad on 1/16/21.
//

#import "Rectangle.h"
#import "XYPoint.h"

@implementation Rectangle

@synthesize startXY;
@synthesize endXY;

- (instancetype)init {
    self = [super init];
    if (self) {
        self.startXY = [[XYPoint alloc] initWithX:[[NSNumber alloc] initWithDouble:0] andY:[[NSNumber alloc] initWithDouble:0]];
        self.endXY = [[XYPoint alloc] initWithX:[[NSNumber alloc] initWithDouble:0] andY:[[NSNumber alloc] initWithDouble:0]];
    }
    return self;
}

- (instancetype) initWithStartXY:(XYPoint *)startXY andEndXY:(XYPoint *)endXY {
    self = [super init];
    if (self) {
        self.startXY = startXY;
        self.endXY = endXY;
    }
    return self;
}

@end
