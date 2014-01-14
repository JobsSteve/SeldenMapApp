//
//  ProvinceInformation.h
//  ECSlidingViewController
//
//  Created by Corey Zanotti on 11/29/12.
//
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Provinces;

@interface ProvinceInformation : NSManagedObject

@property (nonatomic, retain) NSString * provinceDescription;
@property (nonatomic, retain) NSString * imagePath;
@property (nonatomic, retain) Provinces *aboutProvince;

@end
