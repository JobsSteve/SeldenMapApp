//
//  ModalView_Vertical.m
//  Selden Map App
//
//  Created by Corey Zanotti on 4/17/13.
//
//

#import "ModalView_Vertical.h"

@implementation ModalView_Vertical
@synthesize subtitleView = _subtitleView, textView = _textView;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}
-(id)initWithHeader:(NSString *)header body:(NSString *)body
{
    self = [super init];
    if (self){
        
        [self setFrame:CGRectMake(0, 0, 768, 1024)];
        [self setBackgroundColor:[UIColor clearColor]];
        //_magnifyiedView = [[ACMagnifyingView alloc]initWithFrame:CGRectMake(0,0,768,1024)];
        /*_imageView = [[UIImageView alloc]initWithImage:image];
        [_imageView setFrame:CGRectMake(453, 155, 273, 420)];
        _imageTapped = [[UITapGestureRecognizer alloc]initWithTarget:_delegate action:@selector(presentImagePopover:)];
        [_imageView addGestureRecognizer:_imageTapped];*/
        _textView = [[ModalTextView alloc]initWithFrame:CGRectMake(36,190, 340, 825)];
        [_textView setFontSize:[NSNumber numberWithInt:22.5]];
        [_textView setText:body];
        [_textView setFontColor:[UIColor whiteColor]];
        _subtitleView = [[ModalTextView alloc]initWithFrame:CGRectMake(36, 150, 340, 100)];
        [_subtitleView setFontSize:[NSNumber numberWithInt:25]];
        [_subtitleView setText:header];
        [_subtitleView setFontColor:[UIColor whiteColor]];
        [self addSubview:_subtitleView];
        /*_infoViewText = [[ModalTextView alloc]initWithFrame:CGRectMake(453,615, 273, 420)];
        [_infoViewText setFontColor:[UIColor whiteColor]];
        [_infoViewText setFontSize:[NSNumber numberWithInt:18]];
        [_infoViewText setText:infoText];*/
        //[self addSubview:_magnifyiedView];
        //[self addSubview:_imageView];
        [self addSubview:_textView];
        //[self addSubview:_infoViewText];
    }
    return self;
}
-(bool)isVertical
{
    return YES;
}

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    //[_textView setNeedsDisplayInRect:CGRectMake(36,150, 390, 825)];
    //[_infoViewText setNeedsDisplayInRect:CGRectMake(453,615, 273, 420)];

}

@end
