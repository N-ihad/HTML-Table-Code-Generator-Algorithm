//
//  TableHTML.m
//  Generate-HTML-table
//
//  Created by Nihad on 1/15/21.
//

#import "TableHTML.h"

#ifdef DEBUG
    #define NSLog(FORMAT, ...) fprintf(stderr,"%s", [[NSString stringWithFormat:FORMAT, ##__VA_ARGS__] UTF8String]);
#else
    #define NSLog(...) {}
#endif

@implementation TableHTML

@synthesize matrix;

+ (NSString *)emptyCell {
    static NSString *cell = nil;
    if (cell == nil) {
        cell = [[NSString alloc] initWithFormat:@"<td style=%cbackground-color: white; width: 1px; height: 1px;%c> </td>", 34, 34];
    }
    return cell;
}

+ (NSString *)generateRandomHexColour {
    unsigned int baseInt = arc4random() % 16777216;
    NSString *hex = [NSString stringWithFormat:@"%06X", baseInt];
    NSString *randomHexColour = [[NSString alloc] initWithFormat:@"<td style=%cbackground-color: #%@; width: 1px; height: 1px;%c> </td>", 34, hex, 34];
    return randomHexColour;
}


- (instancetype)init {
    self = [super init];
    if (self) {
        self.matrix = [[NSMutableArray alloc] init];
    }
    return self;
}

- (instancetype) initWithRowsNumber:(NSUInteger)n andColumnsNumber:(NSUInteger)m {
    self = [super init];
    if (self) {
        self.matrix = [[NSMutableArray alloc] init];
        
        for (int i = 0; i < n; i++) {
            NSMutableArray *row = [[NSMutableArray alloc] initWithCapacity:m];
            for (int i = 0; i < m; i++) {
                [row addObject: [[NSMutableString alloc] initWithString:TableHTML.emptyCell]];
            }
            self.matrix[i] = row;
        }
    }
    return self;
}

- (NSMutableString*) cellAtRow:(NSUInteger) i andColumn:(NSUInteger) j {
    return [self.matrix[i] objectAtIndex:j];
}

-(void) paintCellsFromCell:(XYPoint*) fromCell toCell:(XYPoint*) toCell {
    NSString *hex = TableHTML.generateRandomHexColour;
    for (int i = fromCell.y.intValue; i < toCell.y.intValue; i++) {
        for (int j = fromCell.x.intValue; j < toCell.x.intValue; j++) {
            NSMutableString *cell = [self cellAtRow:i andColumn:j];
            [cell setString:hex];
        }
    }
}

-(void) printHTMLCode {
    NSLog(@"\n<table border=%c1%c>\n", 34, 34);
    for (int i = 0; i < self.matrix.count; i++) {
        NSLog(@"<tr>\n");
        for (int j = 0; j < [self.matrix[i] count]; j++) {
            NSLog(@"%@\n", [matrix[i] objectAtIndex:j]);
        }
        NSLog(@"</tr>\n");
    }
    NSLog(@"</table>\n\n");
}

-(NSString*) getHTMLCode {
    NSMutableString * htmlCode = [[NSMutableString alloc] init];
    [htmlCode appendString:[[NSString alloc] initWithFormat:@"\n<table border=%c1%c>\n", 34, 34]];
    for (int i = 0; i < self.matrix.count; i++) {
        [htmlCode appendString:@"<tr>\n"];
        for (int j = 0; j < [self.matrix[i] count]; j++) {
            [htmlCode appendString:[[NSString alloc] initWithFormat:@"%@\n", [matrix[i] objectAtIndex:j]]];
        }
        [htmlCode appendString:@"</tr>\n"];
    }
    [htmlCode appendString:@"</table>\n\n"];
    return htmlCode;
}

-(void) writeHTMLCodeToFile {
    FILE *f = fopen("output.txt", "w");
    if (f == NULL) { printf("Error opening file!\n"); exit(1); }
    
    fprintf(f, "<table border=\"1\">\n");
    for (int i = 0; i < self.matrix.count; i++) {
        fprintf(f, "<tr>\n");
        for (int j = 0; j < [self.matrix[i] count]; j++) {
            fprintf(f, "%s\n", [[matrix[i] objectAtIndex:j] UTF8String]);
        }
        fprintf(f, "</tr>\n");
    }
    fprintf(f, "</table>");
    fclose(f);
}

@end
