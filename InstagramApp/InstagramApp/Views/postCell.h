//
//  postCell.h
//  InstagramApp
//
//  Created by Norette Ingabire on 7/11/18.
//  Copyright © 2018 Norette Ingabire. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Post.h"
#import "ParseUI.h"

@interface postCell : UITableViewCell
@property (weak, nonatomic) IBOutlet PFImageView *postedImage;
@property (weak, nonatomic) IBOutlet UITextView *caption;
@property (strong,nonatomic) Post *post;

@end
