//
//  ViewController.m
//  task2
//
//  Created by Anton Lookin on 12/16/15.
//  Copyright © 2015 geekub. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (weak, nonatomic) IBOutlet UILabel *paragraphLabel;
@property (nonatomic, strong) NSMutableAttributedString *content;
@property (nonatomic, getter = isClear) BOOL clear;

@end

@implementation ViewController

- (void)viewDidLoad {
	[super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    [self initNewParahraph];
    self.paragraphLabel.attributedText = self.content;

}

- (void)didReceiveMemoryWarning {
	[super didReceiveMemoryWarning];
	// Dispose of any resources that can be recreated.
}

//Init New Paragraph
- (void)initNewParahraph {
    NSString * l1 = @"Paragraph \n";
    self.content = [[NSMutableAttributedString alloc]initWithString:l1
                                                         attributes:@{NSFontAttributeName: [UIFont fontWithName:@"HelveticaNeue" size:17],NSForegroundColorAttributeName: [UIColor colorWithRed:0.251 green:0.000 blue:0.502 alpha:1]}];
    self.clear = NO;
}

//Add New Paragraph
- (void)addNewParagraph {
    if (self.clear == YES) {
        [self initNewParahraph];
    }
    
    else {
    NSString * l2 = @"Curabitur dignissim ligula ex, eu ultricies urna sodales eget. Nullam vitae lacus eu sem egestas tempus sit amet sit amet mi. Nulla eu feugiat erat. \n";
    //NSString * l2 = @"Paragraph \n";
    NSMutableAttributedString * content2 = [[NSMutableAttributedString alloc]initWithString:l2
                                                                                 attributes:@{NSFontAttributeName: [UIFont fontWithName:[self randomFonts] size:[self randomSize]],NSForegroundColorAttributeName: [self randomColor]}];
        
    [content2 addAttribute:NSParagraphStyleAttributeName value:[self randomParagraphStyle] range:NSMakeRange(0,1)];
        
    [self.content appendAttributedString:content2];
    self.clear = NO;
    }
    self.paragraphLabel.attributedText = self.content;
}

//Random Font
- (NSString *) randomFonts {
    NSArray *array = [[NSArray  alloc]initWithArray:[UIFont familyNames]];
    return [array objectAtIndex:arc4random() % [array count]];
}

//Random Font Size
- (int) randomSize {
    int number = arc4random_uniform(36) + 8;
    return number;
}

//Random Color
- (UIColor *) randomColor {
    CGFloat hue = ( arc4random() % 256 / 256.0 );
    CGFloat saturation = ( arc4random() % 128 / 256.0 ) + 0.5;
    CGFloat brightness = ( arc4random() % 128 / 256.0 ) + 0.5;
    UIColor *color = [UIColor colorWithHue:hue saturation:saturation brightness:brightness alpha:1];
    return color;
}

//Random Paragraph Style
- (NSMutableParagraphStyle *) randomParagraphStyle {
    NSMutableParagraphStyle * para = [[NSMutableParagraphStyle alloc]init];
    para.alignment = arc4random_uniform(5); // NSTextAlignment 0 - 4
    para.paragraphSpacingBefore = arc4random() % 3 + 0.5;
    
    //Random line Break Mode, Not Work ;(
    NSArray * array = @[@"NSLineBreakByWordWrapping", @"NSLineBreakByCharWrapping", @"NSLineBreakByClipping", @"NSLineBreakByTruncatingHead", @"NSLineBreakByTruncatingTail", @"NSLineBreakByTruncatingMiddle"];
    NSInteger number = arc4random() % [array count];
    if (number == 0) {
        para.lineBreakMode = NSLineBreakByWordWrapping;
    }
    if (number == 1) {
        para.lineBreakMode = NSLineBreakByCharWrapping;
    }
    if (number == 2) {
        para.lineBreakMode = NSLineBreakByClipping;
    }
    if (number == 3) {
        para.lineBreakMode = NSLineBreakByTruncatingHead;
    }
    if (number == 4) {
        para.lineBreakMode = NSLineBreakByTruncatingTail;
    }
    if (number == 5) {
        para.lineBreakMode = NSLineBreakByTruncatingMiddle;
    };

    return para;
}


//Clear Button
- (IBAction)clearAction:(id)sender {
    if (self) {
        self.content = nil;
        self.paragraphLabel.attributedText = self.content;
    }
    self.clear = YES;
}

//Add Button
- (IBAction)addAction:(id)sender {
    //Add method, that add a new paragraph
    [self addNewParagraph];
}

@end
