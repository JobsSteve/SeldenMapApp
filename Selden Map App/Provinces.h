//
//  Provinces.h
//  ECSlidingViewController
//
//  Created by Corey Zanotti on 11/29/12.
//
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class ProvinceInformation;

@interface Provinces : NSManagedObject

@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) NSNumber * xLocation;
@property (nonatomic, retain) NSNumber * yLocation;
@property (nonatomic, retain) ProvinceInformation *information;

@end
