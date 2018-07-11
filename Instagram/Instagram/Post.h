//
//  Post.h
//  Instagram
//
//  Created by Norette Ingabire on 7/10/18.
//  Copyright © 2018 Norette Ingabire. All rights reserved.
//

#import "PFObject.h"
#import "Parse/Parse.h"

@interface Post : PFObject<PFSubclassing>

@property (nonatomic, strong) NSString *postID;
@property (nonatomic, strong) NSString *userID;
@property (nonatomic, strong) PFUser *author;

@property (nonatomic, strong) NSString *caption;
@property (nonatomic, strong) PFFile *image;
@property (nonatomic, strong) NSNumber *likeCount;
@property (nonatomic, strong) NSNumber *commentCount;

@property (nonatomic, strong) NSString *description;
//@property (nonatomic, strong) UIImage *image;

+ (void) posterUserImage : ( UIImage * _Nullable) image withCaption : ( NSString * _Nullable) caption withCompletion: (PFBooleanResultBlock _Nullable)completion;

@end
