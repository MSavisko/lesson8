//
//  HypnosisView.m
//  Hypnosister v.2.0
//
//  Created by Maksym Savisko on 10/29/15.
//  Copyright © 2015 Maksym Savisko. All rights reserved.
//

#import "HypnosisView.h"

@implementation HypnosisView

- (void) drawRect:(CGRect)rect {
    CGRect bounds = self.bounds;
    
    // Finding center
    CGPoint center;
    center.x = bounds.origin.x + bounds.size.width / 2.0;
    center.y = bounds.origin.y + bounds.size.height / 2.0;
    
    //float radius = (MIN(bounds.size.width, bounds.size.height) / 2.0);
    float maxRadius = hypot(bounds.size.width, bounds.size.height) / 2.0;
    UIBezierPath *path = [[UIBezierPath alloc]init];
    
    //Data for radius
    for (float currentRadius = maxRadius; currentRadius > 0; currentRadius -= 20) {
        
        [path moveToPoint:CGPointMake(center.x + currentRadius, center.y)];
        
        [path addArcWithCenter:center
                        radius:currentRadius
                    startAngle:0.0
                      endAngle:M_PI * 2.0
                     clockwise:YES];
    }
    
    //Configure line Width
    path.lineWidth = 10;
    //Configure color line
    [[UIColor lightGrayColor] setStroke];
    //Draw line
    [path stroke];
                
}

- (instancetype) initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor clearColor];
    }
    return self;
}

@end
