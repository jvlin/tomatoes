//
//  Movie.h
//  tomatoes
//
//  Created by Joey Lin on 1/11/14.
//  Copyright (c) 2014 codepath. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Movie : NSObject

@property (nonatomic, weak) NSString *title;
@property (nonatomic, weak) NSString *description;
@property (nonatomic, weak) NSDictionary *posters;
@property (nonatomic, weak) NSString *thumbnailImage;
@property (nonatomic, weak) NSString *profileImage;
@property (nonatomic, weak) NSString *cast;

- (id)initWithDictionary:(NSDictionary *)dictionary;
- (UIImage *)getThumbnailImageData;
- (UIImage *)getProfileImageData;

@end
