//
//  Movie.m
//  tomatoes
//
//  Created by Joey Lin on 1/11/14.
//  Copyright (c) 2014 codepath. All rights reserved.
//

#import "Movie.h"

@interface Movie ()

@property (nonatomic, weak) NSDictionary * movieData;

@end

@implementation Movie

- (id)initWithDictionary:(NSDictionary *)dictionary {
    self = [super init];
    if (self) {
        self.movieData = dictionary;
        self.title = [dictionary objectForKey:@"title"];
        self.description = [dictionary objectForKey:@"synopsis"];
        NSDictionary *posters = [dictionary objectForKey:@"posters"];
        self.posters = posters;
        self.thumbnailImage = [posters objectForKey:@"thumbnail"];
        self.profileImage = [posters objectForKey:@"profile"];
        
        NSArray *abridgedCast = [dictionary objectForKey:@"abridged_cast"];
        NSMutableString *castList = [[NSMutableString alloc] init];
        
        for (int i = 0; i < 4 ; i++) {
            NSDictionary *cast = [abridgedCast objectAtIndex:i];
            NSString *castName = [cast objectForKey:@"name"];
            [castList appendString:castName];
            if (i <3) {
                [castList appendString:@", "];
            }
        }
        self.cast = castList;
        NSLog(@"%@", self.cast);
    }
    
    return self;
}

- (UIImage *)getProfileImageData {
    NSURL *imageURL = [NSURL URLWithString:self.profileImage];
    NSData *imageData = [NSData dataWithContentsOfURL:imageURL];
    return [UIImage imageWithData:imageData];
}

- (UIImage *)getThumbnailImageData {
    NSURL *imageURL = [NSURL URLWithString:self.thumbnailImage];
    NSData *imageData = [NSData dataWithContentsOfURL:imageURL];
    return [UIImage imageWithData:imageData];
}


@end
