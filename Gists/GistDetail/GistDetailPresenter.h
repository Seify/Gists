//
//  GistDetailPresenter.h
//  Gists
//
//  Created by Roman S on 28/01/2018.
//  Copyright © 2018 RS. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "GistListElement.h"

@protocol GistDetailPresenterToViewOutput
- (void)showData:(NSArray *)data;
- (void)showError:(NSError *)error;
@end

@interface GistDetailPresenter : NSObject
- (instancetype)initWithGistListElement:(GistListElement *)element;
@property (weak) id<GistDetailPresenterToViewOutput> view;
@end