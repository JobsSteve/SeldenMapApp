//
//  storage.m
//  SeldenMap
//
//  Created by Corey Zanotti on 10/16/12.
//
//


#import "storage.h"

@implementation storage
-(id)init
{
    self = [super init];
    if (self)
    {
        //read in homepwner.xcdatamodeld
        //OLD CORE DATA 
        /*
         NSURL *modelURL = [[NSBundle mainBundle] URLForResource:@"Model" withExtension:@"momd"];
        
        managedObjectModel = [[NSManagedObjectModel alloc] initWithContentsOfURL:modelURL];
        persistentStoreCoordinator = [[NSPersistentStoreCoordinator alloc] initWithManagedObjectModel:managedObjectModel];
        
        //where does the sqllite file go?
        
        NSString *storePath = [[[self applicationDocumentsDirectory]path] stringByAppendingPathComponent: @"Model.sqlite"];
        NSURL *storeUrl = [NSURL fileURLWithPath:storePath];
        NSError *error = nil;
        
        if(![persistentStoreCoordinator addPersistentStoreWithType:NSSQLiteStoreType configuration:nil URL:storeUrl options:nil error:&error]){
            [NSException raise:@"Open failed"
                        format:@"Reason: %@", [error localizedDescription]];
        }
        
        //create the managed object context
        managedObjectContext= [[NSManagedObjectContext alloc]init];
        [managedObjectContext setPersistentStoreCoordinator:persistentStoreCoordinator];
        
        [managedObjectContext setUndoManager:nil];
                
        //instantiating properties
        [self setManagedObjectContext:managedObjectContext];
        [self setManagedObjectModel:managedObjectModel];
        [self setPersistentStoreCoordinator:persistentStoreCoordinator];
        */
    }
    return self;
}

//ACCESSOR METHODS
+(storage *)sharedStore
{
    static storage *sharedStore = nil;
    if (!sharedStore)
        sharedStore = [[super allocWithZone:nil]init];
    return sharedStore;
}

-(NSMutableArray *)allProvinces{
    [self loadAllProvinces];
    return allProvinces;
}

-(NSMutableArray *)allPorts{
    [self loadAllPorts];
    return allPorts;
}


//POPULATION METHODS
-(void)loadAllPorts{
    if (!allPorts) {
        allPorts = [[NSMutableArray alloc]init];
        Ports *portToAdd = [[Ports alloc]init];
        [portToAdd setName:@"Nagasaki"];
        [portToAdd setChineseName:@"笼仔沙机"];
        [portToAdd setLocation:CGPointMake(3610, 1509)];
        [allPorts addObject:portToAdd];
        
        portToAdd = [[Ports alloc]init];
        [portToAdd setName:@"Qiantang River"];
        [portToAdd setChineseName:@"笼仔沙机"];
        [portToAdd setLocation:CGPointMake(2882, 1706)];
        [allPorts addObject:portToAdd];
        
        portToAdd = [[Ports alloc]init];
        [portToAdd setName:@"Beigang, Taiwan"];
        [portToAdd setChineseName:@"笼仔沙机"];
        [portToAdd setLocation:CGPointMake(2891, 2518)];
        [allPorts addObject:portToAdd];
        
        portToAdd = [[Ports alloc]init];
        [portToAdd setName:@"Jiali Forest, Taiwan"];
        [portToAdd setChineseName:@"笼仔沙机"];
        [portToAdd setLocation:CGPointMake(2948, 2582)];
        [allPorts addObject:portToAdd];
        
        portToAdd = [[Ports alloc]init];
        [portToAdd setName:@"Manila"];
        [portToAdd setChineseName:@"笼仔沙机"];
        [portToAdd setLocation:CGPointMake(3179, 3564)];
        [allPorts addObject:portToAdd];
    }
}

//load AllItems method will populate the allItems array from the datamodel
-(void)loadAllProvinces{
    if (!allProvinces) {
        allProvinces = [[NSMutableArray alloc]init];
        
        //NEW HARDCODED IMPLEMENTATION
        Province *Fujan = [[Province alloc]init];
        [Fujan setName:@"Fujian"];
        [Fujan setChineseName:@"福建"];
        
        //[Fujan set]
        [Fujan setLocation:CGPointMake(2669, 2226)];       [Fujan setImages:[[NSMutableArray alloc]init]];
        /*[Fujan setImageText:[[NSMutableArray alloc]init]];
        [Fujan setParagraphArray:[[NSMutableArray alloc]init]];
        [[Fujan imageText] addObject:@"The tombstone of a Nestorian Christian Mrs. Qizi in the Mongol script Phags-Pa and Chinese, ca. 1300.  Quanzhou Maritime Museum.  See WU Wenliang, Quanzhou zongjiao shike (Religious Stone Inscriptions at Quanzhou, Beijing 1957)"];
        [[Fujan imageText] addObject:@"Sample Description"];
        [[Fujan imageText] addObject:@"Plan of the city of Quanzhou taken from Huaiyin Bu, Quanzhou Fuzhi  (Fujian: Quanzhou, 1763)"];*/
        
        //[[Fujan paragraphArray] addObject:@"The tombstone of a Nestorian Christian Mrs. Qizi in the Mongol script Phags-Pa and Chinese, ca. 1300.  Quanzhou Maritime Museum.  See WU Wenliang, Quanzhou zongjiao shike (Religious Stone Inscriptions at Quanzhou, Beijing 1957)"];
        //[[Fujan paragraphArray] addObject:@"Sample Description"];
        //[[Fujan paragraphArray] addObject:@"Plan of the city of Quanzhou taken from Huaiyin Bu, Quanzhou Fuzhi  (Fujian: Quanzhou, 1763)"];
        
        /*NSString *path = [[NSBundle mainBundle] pathForResource:@"fujian_001" ofType:@"png"];
        UIImage *provinceImage = [[UIImage alloc]initWithContentsOfFile:path];
        [[Fujan images]addObject:provinceImage];
        path = [[NSBundle mainBundle] pathForResource:@"fujian_002" ofType:@"png"];
        provinceImage = [[UIImage alloc]initWithContentsOfFile:path];
        [[Fujan images]addObject:provinceImage];
        path = [[NSBundle mainBundle] pathForResource:@"fujian_003" ofType:@"png"];
        provinceImage = [[UIImage alloc]initWithContentsOfFile:path];
        [[Fujan images]addObject:provinceImage];
        path = [[NSBundle mainBundle] pathForResource:@"preview_Image" ofType:@"png"];*/
        
        [allProvinces addObject:Fujan];
        
        
        //New Province
        Province *province_1 = [[Province alloc]init];
        [province_1 setName:@"Beijing District (北京)"];
        
        //[Fujan set]
        [province_1 setLocation:CGPointMake(2028,1194)];
        [allProvinces addObject:province_1];
        
        //New Province
        Province *province_2 = [[Province alloc]init];
        [province_2 setName:@"Liaodong Defense Region (遼東)"];
        
        //[Fujan set]
        [province_2 setLocation:CGPointMake(2523,897)];
        [allProvinces addObject:province_2];
        
        
        //New Province
        Province *province_3= [[Province alloc]init];
        [province_3 setName:@"Zhejiang Province (浙江)"];
        
        //[Fujan set]
        [province_3 setLocation:CGPointMake(2760,1872)];
        [allProvinces addObject:province_3];
        
        
        //New Province
        Province *province_4 = [[Province alloc]init];
        [province_4 setName:@"Mount Fuji (七島山, “Seven Island Mountain”)"];
        
        //[Fujan set]
        [province_4 setLocation:CGPointMake(3750, 605)];
        [allProvinces addObject:province_4];
        
        
        //New Province
        province_4 = [[Province alloc]init];
        [province_4 setName:@"Yellow River Source"];
        [province_4 setChineseName:@"(黃河水源)"];
        //[province_4 setImages:[[NSMutableArray alloc]init]];
        //[province_4 setParagraphArray:[[NSMutableArray alloc]init]];
        //[province_4 setSubtitleArray:[[NSMutableArray alloc]init]];
        //[province_4 setImageText:[[NSMutableArray alloc]init]];
        //[province_4 setImageOrientationArray:[[NSMutableArray alloc]init]];
        
        //[[province_4 subtitleArray]addObject:@"The Magical Mystical River"];
        //[[province_4 paragraphArray] addObject:@"From the Han Dynasty onward, emperors sponsored expeditions and Chinese scholars debated about the source of the Yellow River (Huang He). Before the Yangzi River became the locus of trade, the Yellow River was “the river” (河), the main artery of the empire and a symbol of its unification. Some speculated that it emerged from the magical Kun Lun Mountain. Sima Qian’s great history Shiji (史記, ca. 91 BCE) reported an expedition by Zhang Qian that called such origins into question. On the Selden Map, it is shown next to the Star Constellation Sea (星宿海), following a map from a 1607 Chinese encyclopedia.\n\n The classical geographers were correct in that the river does actually originate in the Banyan Har Mountains on the Tibetan Plateau. But the Selden Map suggests a link with a western ocean, a literal rather than celestial sea, even adding the word “water” (水) to the identification of the Yellow River."];
       // [[province_4 subtitleArray]addObject:@"The Three River Region"];
       // [[province_4 paragraphArray] addObject:@"A current map of the headwaters region of the Yellow River, including the important twin lakes Zhaling and Eling Hu. This “three rivers” (sanjiang) region also feeds the Yangzi and Mekong Rivers. It was turned into a nature reserve in 2000, when it appeared that the rivers were drying up. In many ways, the Selden Map is an attempt to show the relationship of the Ming Empire to water."];
        
       // [[province_4 imageText] addObject:@"Twenty-eight mansion, boundary- divided, imperial Ming, all provinces terrestrial world map” [二十八宿分野皇明各省地輿圖] in Wu Weizi, Bianyong Xuehai qunyu (Fujian: Xiong Chogyu, 1607), juan 2. Courtesy of Leiden University, Acad. 226, v.1."];
       // [[province_4 imageText] addObject:@"Source: http://www. meltdownin tibet.com/i mages/sanj iangyuan_l g.gif.Image is copyright free"];
        //path = [[NSBundle mainBundle] pathForResource:@"yellowRiver_img_1" ofType:@"png"];
        //provinceImage = [[UIImage alloc]initWithContentsOfFile:path];
        //[[province_4 images]addObject:provinceImage];
        //[[province_4 imageOrientationArray]addObject:[NSNumber numberWithBool:YES]];
        //path = [[NSBundle mainBundle] pathForResource:@"yellowRiver_img_2" ofType:@"png"];
        //provinceImage = [[UIImage alloc]initWithContentsOfFile:path];
        //[[province_4 images]addObject:provinceImage];
        //[[province_4 imageOrientationArray]addObject:[NSNumber numberWithBool:NO]];
        
        //[Fujan set]
        [province_4 setLocation:CGPointMake(218, 2478)];
        [allProvinces addObject:province_4];
        
        
        //New Province
        province_4 = [[Province alloc]init];
        [province_4 setName:@"Star Constellation Sea 星宿海"];
        
        /*[province_4 setImages:[[NSMutableArray alloc]init]];
        [province_4 setParagraphArray:[[NSMutableArray alloc]init]];
        [province_4 setImageText:[[NSMutableArray alloc]init]];
        
        
        [[province_4 paragraphArray] addObject:@"Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem."];
        
        [[province_4 paragraphArray] addObject:@"Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem."];
        
        [[province_4 imageText] addObject:@"Image"];
        [[province_4 imageText] addObject:@"Another Image"];
         
         */
        /*path = [[NSBundle mainBundle] pathForResource:@"popup" ofType:@"png"];
        provinceImage = [[UIImage alloc]initWithContentsOfFile:path];
        [[province_4 images]addObject:provinceImage];
        path = [[NSBundle mainBundle] pathForResource:@"popup" ofType:@"png"];
        provinceImage = [[UIImage alloc]initWithContentsOfFile:path];
        [[province_4 images]addObject:provinceImage];*/
        
        //[Fujan set]
        [province_4 setLocation:CGPointMake (5, 2510)];
        [allProvinces addObject:province_4];
        
        
        //New Province
        province_4 = [[Province alloc]init];
        [province_4 setName:@"Jade Gate Pass (玉門關)"];
        /*
        
        [province_4 setImages:[[NSMutableArray alloc]init]];
        [province_4 setParagraphArray:[[NSMutableArray alloc]init]];
        [province_4 setImageText:[[NSMutableArray alloc]init]];
        
        
        [[province_4 paragraphArray] addObject:@"Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem."];
        
        [[province_4 paragraphArray] addObject:@"Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem."];
        
        [[province_4 imageText] addObject:@"Image"];
        [[province_4 imageText] addObject:@"Another Image"];*/
        /*path = [[NSBundle mainBundle] pathForResource:@"popup" ofType:@"png"];
        provinceImage = [[UIImage alloc]initWithContentsOfFile:path];
        [[province_4 images]addObject:provinceImage];
        path = [[NSBundle mainBundle] pathForResource:@"popup" ofType:@"png"];
        provinceImage = [[UIImage alloc]initWithContentsOfFile:path];
        [[province_4 images]addObject:provinceImage];
        //[Fujan set]
        [province_4 setLocation:CGPointMake (1027, 1482)];*/
        [allProvinces addObject:province_4];
        
        
        //New Province
        province_4 = [[Province alloc]init];
        [province_4 setName:@"Kunlun Mountain (崑崙山)"];
        
        /*
        [province_4 setImages:[[NSMutableArray alloc]init]];
        [province_4 setParagraphArray:[[NSMutableArray alloc]init]];
        [province_4 setImageText:[[NSMutableArray alloc]init]];
        
        
        [[province_4 paragraphArray] addObject:@"Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem."];
        
        [[province_4 paragraphArray] addObject:@"Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem."];
        */
        /*[[province_4 imageText] addObject:@"Image"];
        [[province_4 imageText] addObject:@"Another Image"];
        path = [[NSBundle mainBundle] pathForResource:@"popup" ofType:@"png"];
        provinceImage = [[UIImage alloc]initWithContentsOfFile:path];
        [[province_4 images]addObject:provinceImage];
        path = [[NSBundle mainBundle] pathForResource:@"popup" ofType:@"png"];
        provinceImage = [[UIImage alloc]initWithContentsOfFile:path];
        [[province_4 images]addObject:provinceImage];*/
        
        //[Fujan set]
        [province_4 setLocation:CGPointMake  (668, 1817)];
        [allProvinces addObject:province_4];
    }
}
-(void)loadAllRouteMarkers
{
    
}
-(void)loadAllTimelineInstances{
    //create a new array
    //populate with timeline instances
    if(!allTimelineInstances)
    {
        allTimelineInstances = [[NSMutableArray alloc]init];
        UIImage *image1 = [[UIImage alloc]initWithContentsOfFile:[[NSBundle mainBundle]pathForResource:@"demo_image1" ofType:@"png"]];
        UIImage *image2 = [[UIImage alloc]initWithContentsOfFile:[[NSBundle mainBundle]pathForResource:@"demo_image2" ofType:@"png"]];
        TimelineInstance *instance = [[TimelineInstance alloc]initWithTitle:@"Nurhachi Assembles in Liaonong" Subtitle:@"The Fall of the Ming Dynasty Begins" Body:@"Jurchen warlord Nurhaci is retrospectively identified as the founder of the Qing dynasty. In 1616 he declared himself khagan. His unifying efforts gave the Jurchen the strength to assert themselves. In 1618 he proclaimed Seven Grievances against the Ming and seized the city of Fushun in what is now Liaoning province in China's northeast."  XLocation:[NSNumber numberWithInt:1500] YLocation:[NSNumber numberWithInt:824] FirstImage:image1 SecondImage:image2];
        [allTimelineInstances addObject:instance];
        
        image1 = [[UIImage alloc]initWithContentsOfFile:[[NSBundle mainBundle]pathForResource:@"tl_2_1" ofType:@"png"]];
        image2 = [[UIImage alloc]initWithContentsOfFile:[[NSBundle mainBundle]pathForResource:@"tl_2_2" ofType:@"png"]];
        instance = [[TimelineInstance alloc]initWithTitle:@"Nurhachi Defeated in Ningyuan" Subtitle:@"Li Zicheng Attacks from the North" Body:@"On May 26, 1644, Beijing fell to a rebel army led by Li Zicheng, a former minor Ming official who became the leader of the peasant revolt, who then proclaimed the Shun dynasty. The last Ming emperor, the Chongzhen Emperor, hanged himself on a tree in the imperial garden outside the Forbidden City. When Li Zicheng moved against Ming general Wu Sangui, the latter made an alliance with the Manchus."  XLocation:[NSNumber numberWithInt:2248] YLocation:[NSNumber numberWithInt:1936] FirstImage:image1 SecondImage:image2];
        [allTimelineInstances addObject:instance];
        image1 = [[UIImage alloc]initWithContentsOfFile:[[NSBundle mainBundle]pathForResource:@"tl_3_1" ofType:@"png"]];
        image2 = [[UIImage alloc]initWithContentsOfFile:[[NSBundle mainBundle]pathForResource:@"tl_3_2" ofType:@"png"]];
        instance = [[TimelineInstance alloc]initWithTitle:@"Manchus Force Ming Men to Braid Hair" Subtitle:@"The End of the Ming Dynasty" Body:@"On 21 July 1645, after the Jiangnan region had been superficially pacified, Dorgon issued the most untimely promulgation of his career: he ordered all Chinese men to shave their forehead and to braid the rest of their hair into a queue just like the Manchus. The punishment for non-compliance was death. This policy of symbolic submission to the new dynasty helped the Manchus in telling friend from foe."  XLocation:[NSNumber numberWithInt:500] YLocation:[NSNumber numberWithInt:912] FirstImage:image1 SecondImage:image2];
        
        image1 = [[UIImage alloc]initWithContentsOfFile:[[NSBundle mainBundle]pathForResource:@"tl_4_1" ofType:@"png"]];
        image2 = [[UIImage alloc]initWithContentsOfFile:[[NSBundle mainBundle]pathForResource:@"tl_4_2" ofType:@"png"]];
        [allTimelineInstances addObject:instance];        instance = [[TimelineInstance alloc]initWithTitle:@"A New Dynasty Arises" Subtitle:@"A Final Battle" Body:@"Though the Qing under Dorgon's leadership had successfully pushed the Southern Ming deep into southern China, Ming loyalism was not dead yet. In early August 1652, Li Dingguo, who had served as general in Sichuan under bandit king Zhang Xianzhong/Users/itgmadmin/Downloads/tl_2_2.png (d. 1647) and was now protecting the Yongli Emperor of the Southern Ming, retook Guilin (Guangxi province) from the Qing. Within a month, most of the commanders who had been supporting the Qing in Guangxi reverted to the Ming side."  XLocation:[NSNumber numberWithInt:1148] YLocation:[NSNumber numberWithInt:1820] FirstImage:image1 SecondImage:image2];
        [allTimelineInstances addObject:instance];
    }
}



-(NSMutableArray *)allTimelineInstances{
    [self loadAllTimelineInstances];
    return allTimelineInstances;
}


@end
