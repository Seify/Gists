//
//  GistDetailView.m
//  Gists
//
//  Created by Roman S on 28/01/2018.
//  Copyright © 2018 RS. All rights reserved.
//

#import "GistDetailView.h"
#import "GistDetailPresenter.h"
#import "GistListCell.h"
#import "UIImageView+WebCache.h"

@interface GistDetailView ()<GistDetailPresenterToViewOutput>
@property NSArray *data;
@end

@implementation GistDetailView

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.tableView registerNib:[UINib nibWithNibName:@"GistListCell" bundle:nil] forCellReuseIdentifier:@"GistListCell"];
    self.tableView.rowHeight = UITableViewAutomaticDimension;
    self.tableView.estimatedRowHeight = 122;
    [self.presenter didLoad];
}

#pragma mark - GistDetailPresenterToViewOutput

- (void)showData:(NSArray *)data {
    self.data = data;
    [self.tableView reloadData];
}

- (void)showError:(NSError *)error {
    UIAlertController * alert = [UIAlertController
                                 alertControllerWithTitle:@"Error"
                                 message:error.localizedDescription
                                 preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction* okButton = [UIAlertAction
                               actionWithTitle:@"OK"
                               style:UIAlertActionStyleDefault
                               handler:^(UIAlertAction * action) {
                                   [self dismissViewControllerAnimated:YES completion:nil];
                               }];
    
    [alert addAction:okButton];
    [self presentViewController:alert animated:YES completion:nil];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.data.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    GistListCell *cell = (GistListCell *)[tableView dequeueReusableCellWithIdentifier:@"GistListCell" forIndexPath:indexPath];
    GistListElement *element = self.data[indexPath.row];
    cell.topLabel.text = element.userName;
    cell.bottomLabel.text = element.gistName;
    NSURL *url = element.pathToImage ? [NSURL URLWithString:element.pathToImage] : nil;
    if (url) {
        [cell.photoView sd_setImageWithURL:url placeholderImage:[UIImage imageNamed:@"default_photo"]];
    }
    return cell;
}

@end
