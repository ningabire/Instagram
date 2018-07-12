//
//  FeedViewController.h
//  InstagramApp
//
//  Created by Norette Ingabire on 7/11/18.
//  Copyright © 2018 Norette Ingabire. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol captureImageDelegate

- (void) loadCamera;
- (void) loadPhotoLibrary ;

@end

@interface FeedViewController : UIViewController <UITableViewDelegate, UITableViewDataSource, UIImagePickerControllerDelegate, UINavigationControllerDelegate>

@property (weak, nonatomic) id<captureImageDelegate> delegate;

@end
