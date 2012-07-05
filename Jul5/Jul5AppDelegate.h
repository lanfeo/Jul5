//
//  Jul5AppDelegate.h
//  Jul5
//
//  Created by Matthew Fong on 7/4/12.
//  Copyright (c) 2012 Goldman Sachs. All rights reserved.
//

#import <UIKit/UIKit.h>
@class MasterView;
@class View;

@interface Jul5AppDelegate : UIResponder <UIApplicationDelegate> {
    MasterView *masterView;
    View *view;
	UIWindow *_window;
}

@property (strong, nonatomic) UIWindow *window;

@end
