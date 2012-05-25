//
//  PCPopoverController.h
//  PCPopoverControllerTests
//
//  Created by Patrick Perini on 5/16/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>

@interface PCPopoverController : UIPopoverController

@property (readonly) UIColor *tintColor;

- (id)initWithContentViewController:(UIViewController *)viewController andTintColor: (UIColor *)tintColor;

@end
