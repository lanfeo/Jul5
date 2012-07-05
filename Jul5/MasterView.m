//
//  MasterView.m
//  Jul5
//
//  Created by Matthew Fong on 7/5/12.
//  Copyright (c) 2012 Goldman Sachs. All rights reserved.
//

#import "MasterView.h"
#import "View.h"
#import "OtherView.h"

@implementation MasterView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        //Don't bother with a background color--
		//this BigView is entirely occupied by a LittleView.
		
		views = [NSArray arrayWithObjects:
                 [[View alloc] initWithFrame: self.bounds],
                 [[OtherView alloc] initWithFrame: self.bounds],
                 nil
                 ];
        
		index = 0;	//LittleView0 is the one that's initially visible.
		[self addSubview: [views objectAtIndex: index]];

    }
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
