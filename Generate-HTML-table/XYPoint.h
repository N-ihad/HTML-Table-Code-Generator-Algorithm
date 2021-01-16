//
//  XYPoint.h
//  Generate-HTML-table
//
//  Created by Nihad on 1/15/21.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface XYPoint : NSObject

@property (nonatomic, retain) NSNumber *x;
@property (nonatomic, retain) NSNumber *y;

-(instancetype) initWithX:(NSNumber*) x andY:(NSNumber*) y;

@end

NS_ASSUME_NONNULL_END
