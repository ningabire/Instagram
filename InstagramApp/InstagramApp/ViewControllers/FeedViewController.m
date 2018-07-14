//
//  FeedViewController.m
//  InstagramApp
//
//  Created by Norette Ingabire on 7/11/18.
//  Copyright © 2018 Norette Ingabire. All rights reserved.
//

#import "FeedViewController.h"
#import "LoginViewController.h"
#import "AppDelegate.h"
#import "Parse.h"
#import "Post.h"
#import "postCell.h"
#import "DetailsViewController.h"
#import "ComposeViewController.h"
#import "DateTools.h"

@interface FeedViewController ()
- (IBAction)didTapLogout:(id)sender;
- (IBAction)didTapCamera:(id)sender;

@property (strong, nonatomic) IBOutlet UITableView *tableView;
//@property (weak, nonatomic) IBOutlet UILabel *caption;
@property (strong, nonatomic) NSArray *postsArray;
@property(strong, nonatomic) UIRefreshControl *refreshControl;
@property (strong, nonatomic) UIWindow *window;
@property (nonatomic, strong) NSMutableArray *posts;

@end

@implementation FeedViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
     // Do any additional setup after loading the view.
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.rowHeight = UITableViewAutomaticDimension;
    
    [self fetchPosts];
    
    // refresh control
    self.refreshControl = [[UIRefreshControl alloc] init];
    [self.refreshControl addTarget:self action:@selector(fetchPosts) forControlEvents:UIControlEventValueChanged];
    [self.tableView insertSubview:self.refreshControl atIndex:0];
    
   [self.tableView reloadData];
    
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
    postCell * cell = [tableView dequeueReusableCellWithIdentifier:@"postCell" forIndexPath:indexPath];
    
    Post *newPost = self.postsArray[indexPath.row];
    [cell setPost:newPost];
    
    return cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.postsArray.count;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)didTapLogout:(id)sender {
    NSLog(@"User logged out successfully");
  
    AppDelegate *appDelegate = (AppDelegate *)[UIApplication sharedApplication].delegate;
    
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    LoginViewController *loginViewController = [storyboard instantiateViewControllerWithIdentifier:@"LoginViewController"];
    appDelegate.window.rootViewController = loginViewController;
}

- (IBAction)didTapCamera:(id)sender {
    
    //segue to the next controller that allows to take pictures or import images from a photo Library
    //segue to the ComposeView Controller
    [self performSegueWithIdentifier:@"takePicture" sender:nil];
}

- (void) didPost: (Post *) post {
   
    //insert the post to the array of posts
    [self.posts insertObject:post atIndex:0];
    [self.tableView reloadData];
    NSLog(@"reloaded data in didPost");
}

- (void) fetchPosts {
    
    // construct query
    PFQuery *query = [PFQuery queryWithClassName:@"Post"];
    //[query whereKey:@"likesCount" greaterThan:@100];
     [query includeKey:@"author"];
    [query includeKey:@"createdAt"];
    [query orderByDescending:@"createdAt"];
    query.limit = 100;
    

    
    // fetch data asynchronously
    [query findObjectsInBackgroundWithBlock:^(NSArray *posts, NSError *error) {
        if (posts != nil) {
            // do something with the array of object returned by the call
            self.postsArray = posts;
            
            //reload the tableView
            [self.tableView reloadData];
            [self.refreshControl endRefreshing];
        }
        else {
            NSLog(@"%@", error.localizedDescription);
        }
    }];
}


 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
     if([segue.identifier isEqual:@"detailSegue"]){
     UITableViewCell *tappedCell = sender;
     NSIndexPath *indexPath = [self.tableView indexPathForCell:tappedCell];
    
     Post *post = self.postsArray[indexPath.row];
     DetailsViewController *detailsViewController = [segue destinationViewController];
     detailsViewController.post = post;
     }
 }

@end
