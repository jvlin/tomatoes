//
//  MovieListViewController.m
//  tomatoes
//
//  Created by Joey Lin on 1/10/14.
//  Copyright (c) 2014 codepath. All rights reserved.
//

#import "MovieListViewController.h"
#import "MovieViewController.h"
#import "MovieCell.h"
#import "Movie.h"
#import "UIImageView+AFNetworking.h"

@interface MovieListViewController ()

@property (nonatomic, strong) NSArray *movies;

@end

@implementation MovieListViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
        self.movies = [NSArray array];
    }
    return self;
}

- (id)initWithCoder:(NSCoder *)aDecoder
{ 
    self = [super initWithCoder:aDecoder];
    if (self) {
        NSString *url = @"http://api.rottentomatoes.com/api/public/v1.0/lists/dvds/top_rentals.json?apikey=g9au4hv6khv6wzvzgt55gpqs";
        
        NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:url]];
        [NSURLConnection sendAsynchronousRequest:request queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError) {
            id object = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
            NSLog(@"%@", object);
            
            self.movies = [object valueForKeyPath:@"movies"];
            
            [self.tableView reloadData];
        }];
    }
    
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.movies.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"MovieCell";
    MovieCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    // Configure the cell...
    NSDictionary *movie = [self.movies objectAtIndex:indexPath.row];
    
    Movie *movieObject = [[Movie alloc] initWithDictionary:movie];
    
    cell.movieTitleLabel.text = movieObject.title;
    cell.movieDescriptionLabel.text = movieObject.description;
    //NSLog(@"%@", [NSString stringWithFormat:@"%@", movieObject.thumbnailImage ]);
    
    //cell.posterImageView.image = [movieObject getThumbnailImageData];
    NSURL *imageURL = [NSURL URLWithString:movieObject.thumbnailImage];
    [cell.posterImageView setImageWithURL:imageURL];
    
    return cell;
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    UITableViewCell *selectedCell = (UITableViewCell *)sender;
    NSIndexPath *indexPath = [self.tableView indexPathForCell:selectedCell];
    Movie *movie = [[Movie alloc] initWithDictionary:self.movies[indexPath.row]];
    
    MovieViewController *movieViewController = (MovieViewController *)segue.destinationViewController;
    movieViewController.movie = movie;
}


@end
