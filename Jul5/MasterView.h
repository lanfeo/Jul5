//
//  MasterView.h
//  Jul5
//
//  Created by Matthew Fong on 7/5/12.
//  Copyright (c) 2012 Goldman Sachs. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MasterView: UIView {
	//holds the two subviews we transtion between
	NSArray *views;
    
	//index in views of the currently displayed little view: 0 or 1
	NSUInteger index;
    UIViewAnimationOptions switchpage;
}

@end
