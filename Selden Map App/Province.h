//
//  Province.h
//  Selden Map App
//
//  Created by Corey Zanotti on 12/3/12.
//
//

#import <Foundation/Foundation.h>

@interface Province : NSObject
@property (nonatomic, retain) NSString *name;
@property (nonatomic, retain) NSString *chineseName;
@property (nonatomic) CGPoint location;
@property (nonatomic, retain) NSMutableArray *paragraphArray;
@property (nonatomic, retain) NSMutableArray *subtitleArray;
@property (nonatomic, retain) NSMutableArray *images;
@property (nonatomic, retain) NSMutableArray *imageText;
@property (nonatomic, retain) NSMutableArray *imageOrientationArray;
@end
