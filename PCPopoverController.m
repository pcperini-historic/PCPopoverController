//
//  PCPopoverController.m
//  PCPopoverControllerTests
//
//  Created by Patrick Perini on 5/16/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "PCPopoverController.h"

#pragma mark - Internal Constants
CGFloat const contentInset = 10.0;
CGFloat const capInset = 25.0;
CGFloat const arrowHeight = 15.0;
CGFloat const arrowBase = 24.0;

@interface PCPopoverControllerBackgroundView : UIPopoverBackgroundView
{
    UIImageView *borderImageView;
    UIImageView *arrowImageView;
}

+ (UIColor *)currentTintColor;
+ (void)setCurrentTintColor: (UIColor *)tintColor;

@end

@implementation PCPopoverControllerBackgroundView

#pragma mark - Internal Class Variables
static UIColor *currentTintColor;

#pragma mark - Initializers
- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame: frame];
    if (!self)
        return nil;
    
    UIGraphicsBeginImageContext(CGSizeMake(60, 60));
    
    UIBezierPath *borderPath = [UIBezierPath bezierPathWithRoundedRect: CGRectMake(0, 0, 60, 60)
                                                          cornerRadius: 8];
    [currentTintColor setFill];
    [borderPath fill];
    
    UIImage *borderImage = UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();
    
    UIEdgeInsets capInsets = UIEdgeInsetsMake(capInset, capInset, capInset, capInset);
    borderImageView = [[UIImageView alloc] initWithImage: [borderImage resizableImageWithCapInsets: capInsets]];
    
    borderImageView.layer.shadowColor = [UIColor blackColor].CGColor;
    borderImageView.layer.shadowOpacity = .4;
    borderImageView.layer.shadowRadius = 2;
    borderImageView.layer.shadowOffset = CGSizeMake(0, 2);
    
    UIGraphicsBeginImageContext(CGSizeMake(25, 25));
    
    UIBezierPath *arrowPath = [UIBezierPath bezierPath];
    [arrowPath moveToPoint: CGPointMake(12.5, 0)];
    [arrowPath addLineToPoint: CGPointMake(25, 25)];
    [arrowPath addLineToPoint: CGPointMake(0, 25)];
    [arrowPath addLineToPoint: CGPointMake(12.5, 0)];
    
    [currentTintColor setFill];
    [arrowPath fill];
    
    UIImage *arrowImage = UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();
    
    arrowImageView = [[UIImageView alloc] initWithImage: arrowImage];
    
    arrowImageView.layer.shadowColor = [UIColor blackColor].CGColor;
    arrowImageView.layer.shadowOpacity = .4;
    arrowImageView.layer.shadowRadius = 2;
    arrowImageView.layer.shadowOffset = CGSizeMake(0, 1);
    arrowImageView.layer.masksToBounds = YES;
    
    [self addSubview: borderImageView];
    [self addSubview: arrowImageView];
    
    return self;
}

#pragma mark - Class Accessors and Mutators
+ (UIColor *)currentTintColor
{
    return currentTintColor;
}

+ (void)setCurrentTintColor:(UIColor *)tintColor
{
    currentTintColor = tintColor;
}

#pragma mark - Class Handlers
+ (UIEdgeInsets)contentViewInsets
{
    return UIEdgeInsetsMake(contentInset, contentInset, contentInset, contentInset);
}

+ (CGFloat)arrowHeight
{
    return arrowHeight;
}

+ (CGFloat)arrowBase
{
    return arrowBase;
}

#pragma mark - View Handlers
@synthesize arrowOffset;
@synthesize arrowDirection;

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    CGFloat height = CGRectGetHeight(self.frame);
    CGFloat width = CGRectGetWidth(self.frame);
    CGFloat left = 0;
    CGFloat top = 0;
    CGFloat coordinate = 0;
    CGAffineTransform rotation = CGAffineTransformIdentity;
    
    switch (arrowDirection)
    {
        case UIPopoverArrowDirectionUp:
        {
            top += arrowHeight;
            height -= arrowHeight;
            coordinate = ((CGRectGetWidth(self.frame) / 2.0) + arrowOffset) - (arrowBase / 2.0);
            arrowImageView.frame = CGRectMake(coordinate, 0, arrowBase, arrowHeight);
            break;
        }
            
        case UIPopoverArrowDirectionDown:
        {
            height -= arrowHeight;
            coordinate = ((CGRectGetWidth(self.frame) / 2.0) + arrowOffset) - (arrowBase / 2.0);
            arrowImageView.frame = CGRectMake(coordinate, height, arrowBase, arrowHeight);
            rotation = CGAffineTransformMakeRotation(M_PI);
            break;
        }
            
        case UIPopoverArrowDirectionLeft:
        {
            left += arrowBase - ceil((arrowBase - arrowHeight) / 2.0);
            width -= arrowBase;
            coordinate = ((CGRectGetHeight(self.frame) / 2.0) + arrowOffset) - (arrowHeight / 2.0);
            arrowImageView.frame = CGRectMake(0, coordinate, arrowBase, arrowHeight);
            rotation = CGAffineTransformMakeRotation(-M_PI_2);
            break;
        }
            
        case UIPopoverArrowDirectionRight:
        {
            left += ceil((arrowBase - arrowHeight) / 2.0);
            width -= arrowBase;
            coordinate = ((CGRectGetHeight(self.frame) / 2.0) + arrowOffset) - (arrowHeight / 2.0);
            arrowImageView.frame = CGRectMake(width, coordinate, arrowBase, arrowHeight);
            rotation = CGAffineTransformMakeRotation(M_PI_2);
            break;
        }
    }
    
    borderImageView.frame = CGRectMake(left, top, width, height);
    [arrowImageView setTransform: rotation];
}

@end

@implementation PCPopoverController

#pragma mark - Properties
@synthesize tintColor;

#pragma mark - Initializers
- (id)initWithContentViewController:(UIViewController *)viewController
{
    self = [self initWithContentViewController: viewController
                                  andTintColor: [UIColor blackColor]];
    return self;
}

- (id)initWithContentViewController:(UIViewController *)viewController andTintColor:(UIColor *)aTintColor
{
    self = [super initWithContentViewController: viewController];
    if (!self)
        return nil;
    
    [super setPopoverBackgroundViewClass: [PCPopoverControllerBackgroundView class]];
    tintColor = aTintColor;
    
    return self;
}

#pragma mark - Overriders
- (void)setPopoverBackgroundViewClass:(Class)popoverBackgroundViewClass {}

- (void)presentPopoverFromRect:(CGRect)rect inView:(UIView *)view permittedArrowDirections:(UIPopoverArrowDirection)arrowDirections animated:(BOOL)animated
{
    @synchronized(self)
    {
        [[PCPopoverControllerBackgroundView class] setCurrentTintColor: tintColor];
        [super presentPopoverFromRect: rect inView: view permittedArrowDirections: arrowDirections animated: animated];
    }
}

- (void)presentPopoverFromBarButtonItem:(UIBarButtonItem *)item permittedArrowDirections:(UIPopoverArrowDirection)arrowDirections animated:(BOOL)animated
{
    @synchronized(self)
    {
        [[PCPopoverControllerBackgroundView class] setCurrentTintColor: tintColor];
        [super presentPopoverFromBarButtonItem: item permittedArrowDirections: arrowDirections animated: animated];
    }
}

@end