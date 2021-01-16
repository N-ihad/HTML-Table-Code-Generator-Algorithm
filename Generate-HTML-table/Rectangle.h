//
//  Rectangle.h
//  Generate-HTML-table
//
//  Created by Nihad on 1/16/21.
//

#import <Foundation/Foundation.h>
#import "XYPoint.h"

NS_ASSUME_NONNULL_BEGIN

@interface Rectangle : NSObject

@property (nonatomic, retain) XYPoint *startXY;
@property (nonatomic, retain) XYPoint *endXY;

- (instancetype) initWithStartXY:(XYPoint *)startXY andEndXY:(XYPoint *)endXY;

@end

NS_ASSUME_NONNULL_END
