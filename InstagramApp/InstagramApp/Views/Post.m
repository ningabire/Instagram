//
//  Post.m
//  InstagramApp
//
//  Created by Norette Ingabire on 7/11/18.
//  Copyright © 2018 Norette Ingabire. All rights reserved.
//

#import "Post.h"

@implementation Post

@dynamic postID;
@dynamic userID;
@dynamic description;
@dynamic image;
@dynamic date;

+ (nonnull NSString *) parseClassName {
    return @"Post";
}

+ (void) posterUserImage : ( UIImage * _Nullable) image withCaption : ( NSString * _Nullable) caption withCompletion: (PFBooleanResultBlock _Nullable)completion {
    
    Post *newPost = [Post new];
    newPost.postID = @"postID";
    newPost.userID = @"userID";
    newPost.image = [self getPFFileFromImage:image];
    newPost.author = [PFUser currentUser];
    newPost.caption = caption;
    newPost.likeCount = @(0);
    newPost.commentCount = @(0);
    newPost.date = @"createdAt";
    
    [newPost saveInBackgroundWithBlock: completion];
}

+ (PFFile *)getPFFileFromImage: (UIImage * _Nullable)image {
    
    // check if image is not nil
    if (!image) {
        return nil;
    }
    
    NSData *imageData = UIImagePNGRepresentation(image);
    // get image data and check if that is not nil
    if (!imageData) {
        return nil;
    }
    
    return [PFFile fileWithName:@"image.png" data:imageData];
}

@end
