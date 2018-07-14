//
//  CollectionViewController.m
//  InstagramApp
//
//  Created by Norette Ingabire on 7/13/18.
//  Copyright © 2018 Norette Ingabire. All rights reserved.
//

#import "CollectionViewController.h"
#import "postCollectionCell.h"
#import "Parse.h"
#import "postCell.h"

@interface CollectionViewController () <UICollectionViewDelegate, UICollectionViewDataSource>
@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;
@property(strong, nonatomic) NSArray *postsArray;


@end

@implementation CollectionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.collectionView.dataSource = self;
    self.collectionView.delegate = self;
    
    [self fetchPosts];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (void) fetchPosts {
    
    // construct query
    PFQuery *query = [PFQuery queryWithClassName:@"Post"];
    //[query whereKey:@"likesCount" greaterThan:@100];
    [query includeKey:@"author"];
    [query includeKey:@"createdAt"];
    [query orderByDescending:@"createdAt"];
    query.limit = 100;
    
    
    
    // fetch data asynchronously
    [query findObjectsInBackgroundWithBlock:^(NSArray *posts, NSError *error) {
        if (posts != nil) {
            // do something with the array of object returned by the call
            self.postsArray = posts;
            
            //reload the tableView
            [self.collectionView reloadData];
        }
        else {
            NSLog(@"%@", error.localizedDescription);
        }
    }];
}

- (nonnull __kindof UICollectionViewCell *)collectionView:(nonnull UICollectionView *)collectionView cellForItemAtIndexPath:(nonnull NSIndexPath *)indexPath {
    
    postCollectionCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"PostCollectionCell" forIndexPath:indexPath];
    
    Post *newPost = self.postsArray[indexPath.item];
    [cell configurePost:newPost];
    
    return cell;
}

- (NSInteger)collectionView:(nonnull UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    
    return self.postsArray.count;
}


@end
