//
//  ComposeViewController.h
//  InstagramApp
//
//  Created by Norette Ingabire on 7/12/18.
//  Copyright © 2018 Norette Ingabire. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Post.h"

@protocol composeViewControllerDelegate
- (void) didPost :(Post *)post;
@end

@interface ComposeViewController : UIViewController

@property(nonatomic, weak)id<composeViewControllerDelegate> didPostdelegate;

@end
