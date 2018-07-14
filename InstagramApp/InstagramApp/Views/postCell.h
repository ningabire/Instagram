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
@property (strong,nonatomic) Post *post;
@property (weak, nonatomic) IBOutlet UILabel *caption;
@property (weak, nonatomic) IBOutlet UIButton *likeButton;
@property (weak, nonatomic) IBOutlet UILabel *likeCount;
@property (weak, nonatomic) IBOutlet UIButton *commentButton;
@property (weak, nonatomic) IBOutlet UILabel *commentCount;
@property (weak, nonatomic) IBOutlet UILabel *likesString;

- (IBAction)didTapLike:(id)sender;
- (IBAction)didTapComment:(id)sender;


- (void) refreshData;
@end
