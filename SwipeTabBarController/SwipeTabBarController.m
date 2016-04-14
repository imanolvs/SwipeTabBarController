//
//  SwipeTabBarController.m
//  SwipeTabBarController
//
//  Created by Imanol Viana Sánchez on 14/4/16.
//  Copyright © 2016 Imanol Viana Sánchez. All rights reserved.
//

#import "SwipeTabBarController.h"

@implementation SwipeTabBarController

- (void)setupSwipeGestureRecognizers:(BOOL)isAllowsCycling {
    
    SEL swipeLeftAction = isAllowsCycling ? @selector(swipeLeftWithCyclingHandler:) : @selector(swipeLeftHandler:);
    UISwipeGestureRecognizer *leftSwipeGestureRecognizer = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:swipeLeftAction];
    leftSwipeGestureRecognizer.direction = UISwipeGestureRecognizerDirectionLeft;
    [self.tabBar addGestureRecognizer:leftSwipeGestureRecognizer];
    
    SEL swipeRightAction = isAllowsCycling ? @selector(swipeRightWithCyclingHandler:) : @selector(swipeRightHandler:);
    UISwipeGestureRecognizer *rightSwipeGestureRecognizer = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:swipeRightAction];
    rightSwipeGestureRecognizer.direction = UISwipeGestureRecognizerDirectionRight;
    [self.tabBar addGestureRecognizer:rightSwipeGestureRecognizer];
}

- (void)swipeLeftHandler:(UISwipeGestureRecognizer *)swipe {
    self.selectedIndex -= 1;
}

- (void)swipeRightHandler:(UISwipeGestureRecognizer *)swipe {
    self.selectedIndex += 1;
}

- (void)swipeLeftWithCyclingHandler:(UISwipeGestureRecognizer *)swipe {
    NSInteger nextIndex = self.selectedIndex - 1;
    self.selectedIndex = nextIndex >= 0 ? nextIndex : self.viewControllers.count - 1;
}

- (void)swipeRightWithCyclingHandler:(UISwipeGestureRecognizer *)swipe {
    NSInteger nextIndex = self.selectedIndex + 1;
    self.selectedIndex = nextIndex < self.viewControllers.count ? nextIndex : 0;
}

@end
