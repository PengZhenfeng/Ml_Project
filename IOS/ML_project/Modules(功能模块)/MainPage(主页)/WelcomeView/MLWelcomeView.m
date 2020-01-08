//
//  MLWelcomeView.m
//  ML_project
//
//  Created by Angzeng on 2019/12/5.
//  Copyright © 2019 Angzeng. All rights reserved.
//

#import "MLWelcomeView.h"
#import "FontAndColorMacros.h"
#import "UtilsMacros.h"

@interface MLWelcomeView()

@end

@implementation MLWelcomeView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self setUI];
    }
    return self;
}

- (void)setUI {
    self.backgroundColor = MLColor_DarkGray;
    self.layer.cornerRadius = 1*MLpx;
}

@end
