//
//  DetailsViewController.m
//  InstagramApp
//
//  Created by Norette Ingabire on 7/12/18.
//  Copyright © 2018 Norette Ingabire. All rights reserved.
//

#import "DetailsViewController.h"
#import "Parse.h"
#import "ParseUI.h"
#import "DateTools.h"

@interface DetailsViewController ()
@property (weak, nonatomic) IBOutlet UILabel *captionField;
@property (weak, nonatomic) IBOutlet UILabel *timestampField;
@property (weak, nonatomic) IBOutlet PFImageView *imageField;

@end

@implementation DetailsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.imageField.file= self.post.image;
    self.captionField.text = self.post.caption;
    self.timestampField.text = self.post.date;
    NSLog(@"Timestamp: %@", self.post.date);
    [self.captionField sizeToFit];
   [self.timestampField sizeToFit];
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

@end
