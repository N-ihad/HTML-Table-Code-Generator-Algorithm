//
//  main.m
//  Generate-HTML-table
//
//  Created by Nihad on 1/15/21.
//

#import <Foundation/Foundation.h>
#import "XYPoint.h"
#import "TableHTML.h"
#import "Rectangle.h"

XYPoint *findRightBottomMostPoint(NSMutableArray *rectangles);
TableHTML *paintTableCellsAccordingToRectangles(NSMutableArray *rectangles);
NSMutableArray *getRectanglesFromFile(void);

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        NSMutableArray *rectangles = getRectanglesFromFile();
        TableHTML *htmlTable = paintTableCellsAccordingToRectangles(rectangles);
        [htmlTable printHTMLCode];
    }
    return 0;
}



XYPoint *findRightBottomMostPoint(NSMutableArray *rectangles) {
    NSNumber *maxX = 0;
    NSNumber *maxY = 0;
    for (Rectangle *rect in rectangles) {
        if (rect.endXY.x.intValue>maxX.intValue) maxX = rect.endXY.x;
        if (rect.endXY.y.intValue>maxY.intValue) maxY = rect.endXY.y;
     }
    
    return [[XYPoint alloc] initWithX:maxX andY:maxY];
}

TableHTML *paintTableCellsAccordingToRectangles(NSMutableArray *rectangles) {
    XYPoint *rightBottomMostPoint = findRightBottomMostPoint(rectangles);
    TableHTML *htmlTable = [[TableHTML alloc]
                            initWithRowsNumber:rightBottomMostPoint.y.intValue
                            andColumnsNumber:rightBottomMostPoint.x.intValue];
    
    for (Rectangle *rect in rectangles) {
        [htmlTable paintCellsFromCell:rect.startXY toCell:rect.endXY];
     }
    
    return htmlTable;
}

NSMutableArray *getRectanglesFromFile() {
    NSString *filepath = [[NSBundle mainBundle] pathForResource:@"input" ofType:@"txt"];
    NSError *error;
    NSString *fileContents = [NSString stringWithContentsOfFile:filepath encoding:NSUTF8StringEncoding error:&error];

    if (error) NSLog(@"Error reading file: %@", error.localizedDescription);

    NSMutableArray *rectangles = [[NSMutableArray alloc] init];

    NSArray *listArray = [fileContents componentsSeparatedByString:@"\n"];
    for (int i=0; i<listArray.count-1; i++) {
        NSString *str = listArray[i];
        NSString *comma = @",";
        NSString *dash = @"-";
        NSString *_x1;
        NSString *_y1;
        NSString *_x2;
        NSString *_y2;

        NSScanner *scanner = [NSScanner scannerWithString:str];
        [scanner scanUpToString:comma intoString:&_x1];
        [scanner scanString:comma intoString:nil];
        [scanner scanUpToString:dash intoString:&_y1];
        [scanner scanString:dash intoString:nil];
        [scanner scanUpToString:comma intoString:&_x2];
        [scanner scanString:comma intoString:nil];
        _y2 = [str substringFromIndex:scanner.scanLocation];
        
        NSNumberFormatter *f = [[NSNumberFormatter alloc] init];
        f.numberStyle = NSNumberFormatterDecimalStyle;
        NSNumber *x1 = [f numberFromString:_x1];
        NSNumber *y1 = [f numberFromString:_y1];
        NSNumber *x2 = [f numberFromString:_x2];
        NSNumber *y2 = [f numberFromString:_y2];
        
        XYPoint *startXY = [[XYPoint alloc] initWithX:x1 andY:y1];
        XYPoint *endXY = [[XYPoint alloc] initWithX:x2 andY:y2];
        
        [rectangles addObject:[[Rectangle alloc] initWithStartXY:startXY andEndXY:endXY]];
    }
    
    return rectangles;
}
