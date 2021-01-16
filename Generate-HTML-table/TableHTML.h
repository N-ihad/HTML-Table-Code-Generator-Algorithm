//
//  TableHTML.h
//  Generate-HTML-table
//
//  Created by Nihad on 1/15/21.
//

#import <Foundation/Foundation.h>
#import "XYPoint.h"

NS_ASSUME_NONNULL_BEGIN

@interface TableHTML : NSObject

@property (nonatomic, retain) NSMutableArray *matrix;

+(NSString*) emptyCell;
+(NSString*) generateRandomHexColour;

-(instancetype) initWithRowsNumber:(NSUInteger) n andColumnsNumber:(NSUInteger) m;
-(NSMutableString*) cellAtRow:(NSUInteger) i andColumn:(NSUInteger) j;
-(void) paintCellsFromCell:(XYPoint*) fromCell toCell:(XYPoint*) toCell;
-(void) printHTMLCode;
-(NSString*) getHTMLCode;
-(void) writeHTMLCodeToFile;

@end

NS_ASSUME_NONNULL_END
