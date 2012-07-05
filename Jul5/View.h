//
//  View.h
//  Jul5
//
//  Created by Matthew Fong on 7/4/12.
//  Copyright (c) 2012 Goldman Sachs. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface View : UIView {
    CGMutablePathRef path;
    UITextView *textView;
    CGRect border;
    UIButton *button;
}

@end
