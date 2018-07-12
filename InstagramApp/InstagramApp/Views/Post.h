//
//  Post.h
//  InstagramApp
//
//  Created by Norette Ingabire on 7/11/18.
//  Copyright © 2018 Norette Ingabire. All rights reserved.
//

#import "PFObject.h"
#import "Parse/Parse.h"
#import "Foundation/Foundation.h"

@interface Post : PFObject<PFSubclassing>

@property (nonatomic, strong) NSString *postID;
@property (nonatomic, strong) NSString *userID;
@property (nonatomic, strong) PFUser *author;

@property (nonatomic, strong) NSString *caption;
@property (nonatomic, strong) PFFile *image;
@property (nonatomic, strong) NSNumber *likeCount;
@property (nonatomic, strong) NSNumber *commentCount;

+ (void) posterUserImage : (UIImage * _Nullable)image withCaption : (NSString * _Nullable)caption withCompletion: (PFBooleanResultBlock _Nullable)completion;

@end
