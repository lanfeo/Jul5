//
//  View.m
//  Jul5
//
//  Created by Matthew Fong on 7/4/12.
//  Copyright (c) 2012 Goldman Sachs. All rights reserved.
//

#import "View.h"

@implementation View

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Text Box Initialization code
        border = CGRectMake(0, 40, self.bounds.size.width, self.bounds.size.height - 40);
        // Can we init a textview with a dynamically sized frame?
		textView = [[UITextView alloc] initWithFrame: border];
		textView.backgroundColor = [UIColor clearColor];
		textView.textColor = [UIColor blackColor];
		textView.font = [UIFont fontWithName: @"Helvetica" size: 16];
		textView.editable = YES;
		
		textView.text =
        @"Type here..."
        ;
        
		[self addSubview: textView];
        // Initialization code
		self.backgroundColor = [UIColor whiteColor];
		path = CGPathCreateMutable();	//born empty
        
        // Copy and pasted button code, need to customize
        button = [UIButton buttonWithType: UIButtonTypeRoundedRect];
        
		//Center the button in the view.
		CGRect b = self.bounds;
		CGSize s = CGSizeMake(200, 40);	//size of button
         
		button.frame = CGRectMake(
                                  b.origin.x + (b.size.width - s.width) / 2,
                                  0,
                                  s.width,
                                  s.height
                                  );
        
		[button setTitleColor: [UIColor redColor] forState: UIControlStateNormal];
		[button setTitle: @"Switch to Draw" forState: UIControlStateNormal];
        
		[button addTarget: self
                   action: @selector(touchUpInside:)
         forControlEvents: UIControlEventTouchUpInside
         ];
        
        typeMode = YES;
        
		[self addSubview: button];

    }
    return self;
}


- (void) touchUpInside: (id) sender {
	//The sender is the button that was pressed.
    
	NSLog(@"The \"%@\" button was pressed.",
		  [sender titleForState: UIControlStateNormal]);
    
    if (typeMode) {
        [button setTitle: @"Switch to Type" forState:UIControlStateNormal];
        textView.editable = false;
        [textView setHidden:YES];
    }
    else {
        [button setTitle: @"Switch to Draw" forState:UIControlStateNormal];
        textView.editable = true;
        [textView setHidden:NO];
    }
    typeMode = !typeMode;
}


- (void) touchesBegan: (NSSet *) touches withEvent: (UIEvent *) event {
	CGPoint p = [[touches anyObject] locationInView: self];
	CGPathMoveToPoint(path, NULL, p.x, p.y);
}


- (void) touchesMoved: (NSSet *) touches withEvent: (UIEvent *) event {
	CGPoint p = [[touches anyObject] locationInView: self];
	CGPathAddLineToPoint(path, NULL, p.x, p.y);
	[self setNeedsDisplay];	//Trigger a call to drawRect:.
}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/
- (void) drawRect: (CGRect) rect
{
	// Drawing code
	CGContextRef c = UIGraphicsGetCurrentContext();
	CGContextBeginPath(c);
	CGContextAddPath(c, path);
	CGContextSetRGBStrokeColor(c, 0, 0, 0, 1);	//black
	CGContextStrokePath(c);
}


@end
