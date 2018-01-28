//
//  GistDetailAssembler.h
//  Gists
//
//  Created by Roman S on 28/01/2018.
//  Copyright © 2018 RS. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GistListElement.h"

@interface GistDetailAssembler : NSObject
+ (UIViewController *)assembleWithGist:(GistListElement *)element;
@end
