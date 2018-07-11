//
//  FeedViewController.m
//  Instagram
//
//  Created by Norette Ingabire on 7/9/18.
//  Copyright © 2018 Norette Ingabire. All rights reserved.
//

#import "FeedViewController.h"
#import "Parse/Parse.h"
#import "LoginViewController.h"
#import "AppDelegate.h"

@interface FeedViewController ()
- (IBAction)logout:(id)sender;
- (IBAction)camera:(id)sender;
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation FeedViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


/*#pragma mark - Navigation


 // In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    // Get the new view controller using [segue destinationViewController].
    UINavigationController *navigationController = [segue destinationViewController];
    LoginViewController *loginController = (LoginViewController*)navigationController.topViewController;

    
    // Pass the selected object to the new view controller.
}*/


- (IBAction)logout:(id)sender {
    [PFUser logOutInBackgroundWithBlock:^(NSError * _Nullable error) {
        // PFUser.current() will now be nil
    }];
    
    AppDelegate *appDelegate = (AppDelegate *) [UIApplication sharedApplication].delegate;
    
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    LoginViewController *loginViewController = [storyboard instantiateInitialViewController];
    //AppDelegate.window.= loginViewController;

    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)camera:(id)sender {
   
   // [self performSegueWithIdentifier:@"composeSegue" sender:nil];
}

/*- (nonnull UITableViewCell *)tableView:(nonnull UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    
}*/

/*- (NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 5;*/
//}

@end
