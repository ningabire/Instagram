//
//  ComposeViewController.m
//  InstagramApp
//
//  Created by Norette Ingabire on 7/12/18.
//  Copyright © 2018 Norette Ingabire. All rights reserved.
//

#import "ComposeViewController.h"
#import "FeedViewController.h"
#import "Post.h"
#import "ParseUI.h"

@interface ComposeViewController () <captureImageDelegate>

- (IBAction)didTapCancel:(id)sender;
- (IBAction)didTapShare:(id)sender;
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UITextView *captionField;
- (IBAction)didTapPhotoLibrary:(id)sender;
- (IBAction)didTapPhoto:(id)sender;

@end

@implementation ComposeViewController

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

- (IBAction)didTapCancel:(id)sender {
    
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)didTapShare:(id)sender {
    
    // share Image
    [Post posterUserImage:self.imageView.image withCaption:self.captionField.text withCompletion: ^(BOOL succeeded, NSError *error) {
        if (error) {
            NSLog(@"Failed to post picture : %@", error.localizedDescription);
        }
        
        else {
            NSLog(@"Successfully posted picture");
           // [self imagePickerController:<#(UIImagePickerController *)#> didFinishPickingMediaWithInfo:<#(NSDictionary<NSString *,id> *)#>]
            [self dismissViewControllerAnimated:YES completion:nil];
        }
    }];
}



- (void)loadCamera {
    
    // Do any additional setup after loading the view.
    UIImagePickerController *imagePickerVC = [UIImagePickerController new];
    imagePickerVC.delegate = self;
    imagePickerVC.allowsEditing = YES;
    imagePickerVC.sourceType = UIImagePickerControllerSourceTypeCamera;
    
    [self presentViewController:imagePickerVC animated:YES completion:nil];
    NSLog(@"loaded camera");
}

- (void)loadPhotoLibrary {
    
    // Do any additional setup after loading the view.
    UIImagePickerController *imagePickerVC = [UIImagePickerController new];
    imagePickerVC.delegate= self;
    imagePickerVC.allowsEditing = YES;
    imagePickerVC.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    
    [self presentViewController:imagePickerVC animated:YES completion:nil];
    NSLog(@"loaded photo library");
}


- (IBAction)didTapPhotoLibrary:(id)sender {
    [self loadPhotoLibrary];
}

- (IBAction)didTapPhoto:(id)sender {
    [self loadCamera];
}

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info {
    
    // Get the image captured by the UIImagePickerController
    UIImage *originalImage = info[UIImagePickerControllerOriginalImage];
    UIImage *editedImage = info[UIImagePickerControllerEditedImage];
    
    
    // Do something with the images (based on your use case)
    
    UIImage *resizedImage = [self resizeImage:editedImage withSize:editedImage.size];
    self.imageView.image = resizedImage;
    
    // Dismiss UIImagePickerController to go back to your original view controller
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (UIImage *)resizeImage:(UIImage *)image withSize:(CGSize)size {
    UIImageView *resizeImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, size.width, size.height)];
    
    resizeImageView.contentMode = UIViewContentModeScaleAspectFill;
    resizeImageView.image = image;
    
    UIGraphicsBeginImageContext(size);
    [resizeImageView.layer renderInContext:UIGraphicsGetCurrentContext()];
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return newImage;
}
@end
