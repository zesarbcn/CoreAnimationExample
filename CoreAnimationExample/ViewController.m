//
//  ViewController.m
//  CoreAnimationExample
//
//  Created by Cesar Perez Laguna on 12/09/14.
//  Copyright (c) 2014 Cesar Perez Laguna. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    //Create scene
    [self createMyScene];
}

-(void)createMyScene
{
    CGRect screenRect = [[UIScreen mainScreen] bounds];
    
    CATransformLayer *container = [CATransformLayer layer];
    container.frame = CGRectMake(0, 0, screenRect.size.width, screenRect.size.height);
    [self.view.layer addSublayer:container];
    
    CGPoint sqPosition = CGPointMake(screenRect.size.width/2, screenRect.size.height/2);
    CGSize sqSize = CGSizeMake(100, 100);
    
    // Squares
    CALayer *purpleSquare = [self addSquareToLayer:container
                                            size:sqSize
                                        position:sqPosition
                                           color:[UIColor purpleColor]];
    CALayer *redSquare = [self addSquareToLayer:container
                                              size:sqSize
                                          position:sqPosition
                                             color:[UIColor redColor]];
    CALayer *orangeSquare = [self addSquareToLayer:container
                                              size:sqSize
                                          position:sqPosition
                                             color:[UIColor orangeColor]];
    CALayer *yellowSquare = [self addSquareToLayer:container
                                              size:sqSize
                                          position:sqPosition
                                             color:[UIColor yellowColor]];
    
    
    [CATransaction setDisableActions:YES];
    
    // Transformations
    CATransform3D t = CATransform3DIdentity;
    
    t = CATransform3DIdentity;
    t = CATransform3DTranslate(t, 0, 0, 0);
    purpleSquare.transform = t;
    
    t = CATransform3DIdentity;
    t = CATransform3DTranslate(t, 0, 0, -40);
    redSquare.transform = t;
    
    t = CATransform3DIdentity;
    t = CATransform3DTranslate(t, 0, 0, -80);
    orangeSquare.transform = t;
    
    t = CATransform3DIdentity;
    t = CATransform3DTranslate(t, 0, 0, -120);
    yellowSquare.transform = t;
    
    /*
    // Fade animation
    CABasicAnimation* anim = [CABasicAnimation animationWithKeyPath:@"opacity"];
    anim.fromValue = [NSNumber numberWithFloat:1.0];
    anim.toValue = [NSNumber numberWithFloat:0.0];
    anim.duration = 1.0;
    [container addAnimation:anim forKey:@"opacity"];
    
    // Change the actual data value in the layer to the final value.
    container.opacity = 0.0;
    */
    
    // Animation
    t = CATransform3DIdentity;
    t.m34 = 1.0/-500;
    t = CATransform3DRotate(t, 45.0f * M_PI / 180.0f, 1, 0, 0);
    
    CABasicAnimation* anim = [CABasicAnimation animationWithKeyPath:@"transform"];
    anim.fromValue = [NSValue valueWithCATransform3D:CATransform3DIdentity];
    anim.toValue = [NSValue valueWithCATransform3D:t];
    anim.duration = 2.8;
    [container addAnimation:anim forKey:@"transform"];
    container.transform = t;
    
}

-(CALayer*)addSquareToLayer:(CALayer*)parent size:(CGSize)size position:(CGPoint)point color:(UIColor*)color
{
    CALayer *square = [CALayer layer];
    
    square.frame = CGRectMake(0, 0, size.width, size.height);
    square.position = point;
    //square.anchorPoint = CGPointMake(0.5, 0.5);
    square.opacity = 0.6;
    square.backgroundColor = [color CGColor];
    square.borderColor = [[UIColor colorWithWhite:1.0 alpha:0.5]CGColor];
    square.borderWidth = 3;
    square.cornerRadius = 10;
    square.shadowColor = [[UIColor blackColor] CGColor];
    square.shadowOffset= CGSizeMake(5.0f, 5.0f);
    square.shadowOpacity=0.5f;
    square.shadowRadius = 2.0f;
    
    [parent addSublayer:square];
    
    return square;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
