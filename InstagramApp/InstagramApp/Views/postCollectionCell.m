//
//  postCollectionCell.m
//  InstagramApp
//
//  Created by Norette Ingabire on 7/13/18.
//  Copyright © 2018 Norette Ingabire. All rights reserved.
//

#import "postCollectionCell.h"

@implementation postCollectionCell

- (void) configurePost:(Post *)post {
    self.post = post;
    self.postView.file = post [@"image"];
    [self.postView loadInBackground];
}

@end
