//
//  postCollectionCell.h
//  InstagramApp
//
//  Created by Norette Ingabire on 7/13/18.
//  Copyright © 2018 Norette Ingabire. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ParseUI.h"
#import "Post.h"

@interface postCollectionCell : UICollectionViewCell
@property (weak, nonatomic) IBOutlet PFImageView *postView;
@property (strong,nonatomic) Post *post;

//- (void) setPost:(Post *)post;

- (void) configurePost:(Post *)post;

@end
