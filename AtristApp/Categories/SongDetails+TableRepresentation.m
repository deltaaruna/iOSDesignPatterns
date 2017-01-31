//
//  SongDetails+TableRepresentation.m
//  AtristApp
//
//  Created by pqj647 on 1/30/17.
//  Copyright © 2017 pqj647. All rights reserved.
//

#import "SongDetails+TableRepresentation.h"

@implementation SongDetails (TableRepresentation)

- (NSArray*)getDataArray {
    [self extractTime];
    return [NSArray arrayWithObjects:self.title, self.album, self.artist, self.imageUrl, [self extractTime], self.duration, nil ];
}

- (NSString*)getCellTitle:(NSUInteger)index {
    switch (index) {
        case 0:
            return @"Title";
            break;
        case 1:
            return @"Album";
            break;
        case 2:
            return @"Artist";
            break;
        case 3:
            return @"Album image";
            break;
        case 4:
            return @"Time";
            break;
        case 5:
            return @"Duration";
            break;
        default:
            break;
    }
    
    return nil;
}

- (NSString*)extractTime {
    NSDateFormatter *dateFormat = [[NSDateFormatter alloc] init];
    [dateFormat setDateFormat:@"yyyy-MM-dd'T'HH:mm:ss+HH:mm"];
    NSDate *date = [dateFormat dateFromString:@"2016-12-20T14:41:44+11:00"];
    
    dateFormat.timeStyle = NSDateFormatterShortStyle;
    dateFormat.dateStyle = NSDateFormatterNoStyle;
    return  [dateFormat stringFromDate:date];
}

@end
