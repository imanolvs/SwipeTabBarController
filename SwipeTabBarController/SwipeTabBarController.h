//
//  SwipeTabBarController.h
//  SwipeTabBarController
//
//  Created by Imanol Viana Sánchez on 14/4/16.
//  Copyright © 2016 Imanol Viana Sánchez. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SwipeTabBarController : UITabBarController

-   (void)setupSwipeGestureRecognizers:(BOOL)isAllowsCycling;

@end
