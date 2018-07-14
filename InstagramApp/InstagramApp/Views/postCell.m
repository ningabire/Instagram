//
//  postCell.m
//  InstagramApp
//
//  Created by Norette Ingabire on 7/11/18.
//  Copyright © 2018 Norette Ingabire. All rights reserved.
//

#import "postCell.h"

@implementation postCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void) setPost:(Post *)post {
    _post = post;
    self.postedImage.file = post[@"image"];
    [self.postedImage loadInBackground];
    self.caption.text = post.caption;
}

- (IBAction)didTapLike:(id)sender {
    if (!self.post.liked) {
        NSLog(@"Selected :%d", self.likeButton.selected);
        self.post.liked = YES;
        self.post.likeCount += 1;
        self.likeButton.selected = YES;
        NSLog(@"Selected after liking: %d", self.likeButton.selected);
    }
    
    else {
        self.post.liked = NO;
        self.post.likeCount -= 1;
        self.likeButton.selected = NO;
    }
    
    [self refreshData];
}

- (IBAction)didTapComment:(id)sender {
}

- (void) refreshData {
    NSString *numberOfLikes = [NSString stringWithFormat:@"%i", self.post.likeCount];
    
    self.likeCount.text = numberOfLikes;
}
@end
