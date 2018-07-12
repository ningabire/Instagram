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

@interface FeedViewController ()
- (IBAction)didTapLogout:(id)sender;
- (IBAction)didTapCamera:(id)sender;
@property (strong, nonatomic) IBOutlet UITableView *tableView;
- (IBAction)didTapPhotoLibrary:(id)sender;
- (IBAction)didTapPhoto:(id)sender;


@property (strong, nonatomic) UIWindow *window;

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

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

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

@end
