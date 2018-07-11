//
//  ComposeViewController.m
//  Instagram
//
//  Created by Norette Ingabire on 7/10/18.
//  Copyright © 2018 Norette Ingabire. All rights reserved.
//

#import "ComposeViewController.h"
#import "Post.h"
#import "Parse.h"
#import "ParseUI.h"

//@protocol ComposeViewControllerDelegate;


@interface ComposeViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UITextView *caption;
//@property (nonatomic, weak) id<ComposeViewControllerDelegate> delegate;
- (IBAction)cancel:(id)sender;
- (IBAction)share:(id)sender;

@end

@implementation ComposeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
   
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

- (IBAction)cancel:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)share:(id)sender {
    [Post posterUserImage:self.imageView.image withCaption:self.caption.text withCompletion: ^(BOOL succeeded, NSError *error) {
        if (error) {
            NSLog(@"Failed to post picture : %@", error.localizedDescription);
        }
        
        else {
            NSLog(@"Successfully posted picture");
            [self dismissViewControllerAnimated:YES completion:nil];
        }
    }];
}


- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info {
    
    // Get the image captured by the UIImagePickerController
    UIImage *originalImage = info[UIImagePickerControllerOriginalImage];
    UIImage *editedImage = info[UIImagePickerControllerEditedImage];
   
    
    // Do something with the images (based on your use case)
     self.imageView.image= editedImage;
    
    // Dismiss UIImagePickerController to go back to your original view controller
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void) loadCamera {
    // Do any additional setup after loading the view.
    UIImagePickerController *imagePickerVC = [UIImagePickerController new];
    imagePickerVC.delegate = self;
    imagePickerVC.allowsEditing = YES;
    imagePickerVC.sourceType = UIImagePickerControllerSourceTypeCamera;
    
    [self presentViewController:imagePickerVC animated:YES completion:nil];
}
-(void) photoLibrary {
    // Do any additional setup after loading the view.
    UIImagePickerController *imagePickerVC = [UIImagePickerController new];
    imagePickerVC.delegate = self;
    imagePickerVC.allowsEditing = YES;
    imagePickerVC.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    
    [self presentViewController:imagePickerVC animated:YES completion:nil];
}

@end
