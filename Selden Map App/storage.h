//
//  storage.h
//  SeldenMap
//
//  Created by Corey Zanotti on 10/16/12.
//
/*
 Storage is responsible for initially populating the core data model
 After its populated, storage will hold arrays of all the ports and provinces for other classes to access
 Storage also provides universal access to the model, context, and persistent store
 
 */
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>
#import "ProvinceInformation.h"
#import "Province.h"
#import "Ports.h"
#import "TimelineInstance.h"

@interface storage : NSObject
{
    /*NSManagedObjectContext *managedObjectContext;
    NSManagedObjectModel *managedObjectModel;
    NSPersistentStoreCoordinator *persistentStoreCoordinator;
*/
    NSMutableArray *allPorts;
    NSMutableArray *allProvinces;
    NSMutableArray *allRouteMarkers;
    NSMutableArray *allTimelineInstances;
}
/*
@property (nonatomic, retain) NSManagedObjectContext *managedObjectContext;
@property (nonatomic, retain) NSManagedObjectModel *managedObjectModel;
@property (nonatomic, retain) NSPersistentStoreCoordinator *persistentStoreCoordinator;
*/

- (void)loadAllPorts;
- (void)loadAllProvinces;
-(void)loadAllTimelineInstances;
- (void)loadAllRouteMarkers;

+(storage *)sharedStore;
-(NSMutableArray *)allPorts;
-(NSMutableArray *)allProvinces;
-(NSMutableArray *)allTimelineInstances;
-(NSMutableArray *)allRouteMarkers;
//-(ProvinceInformation *)getPortInfoFromName:(NSString *)portName;
//-(PortInformation *)getPortInfoFromName:(NSString *)portName;

@end
