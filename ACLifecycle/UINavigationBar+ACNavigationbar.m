//
//  UINavigationBar+ACNavigationbar.m
//  ACLifecycle
//
//  Created by Edward Chiang on 2014/11/6.
//  Copyright (c) 2014年 Soleil Studio. All rights reserved.
//

#import "UINavigationBar+ACNavigationbar.h"

@implementation UINavigationBar (ACNavigationbar)

- (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event
{
  if (!self.clipsToBounds && !self.hidden && self.alpha > 0) {
    for (UIView *subview in self.subviews.reverseObjectEnumerator) {
      CGPoint subPoint = [subview convertPoint:point fromView:self];
      UIView *result = [subview hitTest:subPoint withEvent:event];
      if (result != nil) {
        return result;
      }
    }
  }
  
  return [super hitTest:point withEvent:event];
}

@end
