//
//  MovieViewController.m
//  tomatoes
//
//  Created by Joey Lin on 1/10/14.
//  Copyright (c) 2014 codepath. All rights reserved.
//

#import "MovieViewController.h"
#import "Movie.h"

@interface MovieViewController ()

@property (weak, nonatomic) IBOutlet UIImageView *movieProfileImageView;
@property (weak, nonatomic) IBOutlet UILabel *movieTitleLabel;
@property (weak, nonatomic) IBOutlet UILabel *movieCastLabel;
@property (weak, nonatomic) IBOutlet UILabel *movieDescriptionLabel;

@end

@implementation MovieViewController



- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.navigationItem.title = self.movie.title;
    self.movieProfileImageView.image = [self.movie getProfileImageData];
    self.movieTitleLabel.text = self.movie.title;
    self.movieCastLabel.text = self.movie.cast;
    self.movieDescriptionLabel.text = self.movie.description;
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
