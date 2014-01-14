//
//  ModalView_Vertical.m
//  Selden Map App
//
//  Created by Corey Zanotti on 4/17/13.
//
//

#import "ModalView_Wide.h"

@implementation ModalView_Wide
@synthesize subtitleView = _subtitleView, textView = _textView, bannerImage = _bannerImage;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setFrame:CGRectMake(0, 0, 668, 924)];
        [self setBackgroundColor:[UIColor clearColor]];
        //_magnifyiedView = [[ACMagnifyingView alloc]initWithFrame:CGRectMake(0,0,768,1024)];
        /*_imageView = [[UIImageView alloc]initWithImage:image];
         [_imageView setFrame:CGRectMake(453, 155, 273, 420)];
         _imageTapped = [[UITapGestureRecognizer alloc]initWithTarget:_delegate action:@selector(presentImagePopover:)];
         [_imageView addGestureRecognizer:_imageTapped];*/
        _textView = [[ModalTextView alloc]initWithFrame:CGRectMake(36,450, 600, 350)];
        [_textView setFontSize:[NSNumber numberWithInt:22.5]];
        [_textView setText:@"From the Han Dynasty onward, emperors sponsored expeditions and Chinese scholars debated about the source of the Yellow River (Huang He). Before the Yangzi River became the locus of trade, the Yellow River was “the river” (河), the main artery of the empire and a symbol of its unification. Some speculated that it emerged from the magical Kun Lun Mountain. Sima Qian’s great history Shiji (史記, ca. 91 BCE) reported an expedition by Zhang Qian that called such origins into question. On the Selden Map, it is shown next to the Star Constellation Sea (星宿海), following a map from a 1607 Chinese encyclopedia.\n\n The classical geographers were correct in that the river does actually originate in the Banyan Har Mountains on the Tibetan Plateau. But the Selden Map suggests a link with a western ocean, a literal rather than celestial sea, even adding the word “water” (水) to the identification of the Yellow River."];
        [_textView setFontColor:[UIColor whiteColor]];
        _subtitleView = [[ModalTextView alloc]initWithFrame:CGRectMake(36, 400, 600,100 )];
        [_subtitleView setFontSize:[NSNumber numberWithInt:25]];
        [_subtitleView setText:@"The Magical Mystery River"];
        [_subtitleView setFontColor:[UIColor whiteColor]];
        
        _bannerImage = [[UIImageView alloc] initWithFrame:CGRectMake(36, 0, 588, 350)];
        [_bannerImage setImage:[[UIImage alloc]initWithContentsOfFile:[[NSBundle mainBundle]pathForResource:@"yellowRiver_img_2" ofType:@"png"]]];
        [self addSubview:_bannerImage];
        [self addSubview:_subtitleView];
        /*_infoViewText = [[ModalTextView alloc]initWithFrame:CGRectMake(453,615, 273, 420)];
         [_infoViewText setFontColor:[UIColor whiteColor]];
         [_infoViewText setFontSize:[NSNumber numberWithInt:18]];
         [_infoViewText setText:infoText];*/
        //[self addSubview:_magnifyiedView];
        //[self addSubview:_imageView];
        [self addSubview:_textView];
        

    }
    return self;
}
-(id)initWithHeader:(NSString *)header body:(NSString *)body
{
    self = [super init];
    if (self){
        
        [self setFrame:CGRectMake(0, 0, 668, 924)];
        [self setBackgroundColor:[UIColor clearColor]];
        //_magnifyiedView = [[ACMagnifyingView alloc]initWithFrame:CGRectMake(0,0,768,1024)];
        /*_imageView = [[UIImageView alloc]initWithImage:image];
         [_imageView setFrame:CGRectMake(453, 155, 273, 420)];
         _imageTapped = [[UITapGestureRecognizer alloc]initWithTarget:_delegate action:@selector(presentImagePopover:)];
         [_imageView addGestureRecognizer:_imageTapped];*/
        _textView = [[ModalTextView alloc]initWithFrame:CGRectMake(36,600, 600, 350)];
        [_textView setFontSize:[NSNumber numberWithInt:22.5]];
        [_textView setText:body];
        [_textView setFontColor:[UIColor whiteColor]];
        _subtitleView = [[ModalTextView alloc]initWithFrame:CGRectMake(36, 550, 600,100 )];
        [_subtitleView setFontSize:[NSNumber numberWithInt:25]];
        [_subtitleView setText:header];
        [_subtitleView setFontColor:[UIColor whiteColor]];
        
        _bannerImage = [[UIImageView alloc] initWithFrame:CGRectMake(36, 150, 588, 350)];
        [_bannerImage setImage:[[UIImage alloc]initWithContentsOfFile:[[NSBundle mainBundle]pathForResource:@"yellowRiver_img_2" ofType:@"png"]]];
        [self addSubview:_bannerImage];
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
}/*
-(id)initWithImage:(UIImage *)image text:(NSString *)text infoText:(NSString *)infoText
{
    self = [super init];
    if (self){
        [self setFrame:CGRectMake(0, 0, 768, 1024)];
        _imageView = [[UIImageView alloc]initWithImage:image];
        [_imageView setFrame:CGRectMake(36, 590, 450, 385)];
        _textView = [[ModalTextView alloc]initWithFrame:CGRectMake(36,150, 700, 350)];
        [_textView setBackgroundColor:[UIColor clearColor]];
        [_textView setText:text];
        [_textView setFontColor:[UIColor whiteColor]];
        _infoViewText = [[ModalTextView alloc]initWithFrame:CGRectMake(500,590, 230, 385)];
        [_infoViewText setFontColor:[UIColor whiteColor]];
        [_infoViewText setBackgroundColor:[UIColor clearColor]];
        [_infoViewText setText:infoText];
        [self addSubview:_imageView];
        [self addSubview:_textView];
        [self addSubview:_infoViewText];
    }
    return self;
}*/
-(bool)isVertical{
    return NO;
}
/*
 // Only override drawRect: if you perform custom drawing.
 // An empty implementation adversely affects performance during animation.
 - (void)drawRect:(CGRect)rect
 {
 // Drawing code
 }
 */

@end
