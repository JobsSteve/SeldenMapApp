//
//  Ports.h
//  Selden Map App
//
//  Created by Corey Zanotti on 10/28/12.
//
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface Ports : NSManagedObject

@property (nonatomic, retain) NSString *name;
@property (nonatomic, retain) NSString *chineseName;
@property (nonatomic) CGPoint location;
@property (nonatomic, retain) NSMutableArray *paragraphArray;
@property (nonatomic, retain) NSMutableArray *subtitleArray;
@property (nonatomic, retain) NSMutableArray *imagePaths;
@property (nonatomic, retain) NSMutableArray *imageText;
@property (nonatomic, retain) NSMutableArray *imageOrientationArray;

@end
