//
//  AppDelegate.h
//  Selden Map App
//
//  Created by Corey Zanotti
//
/*
 Implementation Log: 
 10/30/12: Making progress towards the prototype... Currently working on getting the tab bar to load different buttons and views based on variables. Found out that the tabbars child view controllers are dependent upon the order in which they are established as children in the storyboard. This affects the tabbar's button's tag value which references the array of view controllers.
 
 11/5/12: Progress made last night and today... Rearranging classes and getting the database in its proper format. Now I'm working towards finding ways to get the fetch request to link from the port information to the port info. 
 11/10/12: Progress made... yesterday, dressed interface with custom elements. Today, got route Image to load onto view and off view. Progress to make, finding ways to get custom data onto views. 
 
 11/29/12: Progress made: Hardcoded information into app. Currently have one Province in the Core Data model. Its linked to another entity. The app is grabbing the information from both and displaying it onto the drawer. Issues: Can't seem to get images to load onto the views from Interface Builder. Specifically the DrawerPreviewController won't display any images in its image field. 
 
 12/3/12: Changed Implementation around... Got Rid of all coredata information and hard coded the province information into an all inclusive province class. From there I'm working on placing the information from the province class into the new reduced province info view. Current issue is linking the province info view to the top drawer. 
 
    More progress made... still working towards trying to populate the new province view... currently my aim is to figure out the best way to update the firsttopviewcontroller's province information view from the contentviewcontroller's ports pressed method. 
 
 12/8/12 Interface Buttons set up with proper delegate. Issues with Sliding View Controller. Pan Gesture is set to nil preventing the top view from loading properly. Class was adjusted to handle the inclusion of a navigation bar. Until 6: I will adjust the navigation bar to be in the Selden Map App class. 
    Began rewriting the sliding view class, minimizing the clutter and allowing for a storyboardless implementation. Currently finishing up updateDrawerCenterWithRecognizer (the pan gesture handler).
 12/10/12 9:00-12:00 Began using my implementation of SlidingViewController. Its currently set up to move on the tap gesture and does so between the left, preview, and right states. 
    ToDo for implementation:
        Set up Pan Gestures
        Instantiate with appropriate views
        Get Nav Bar Populated: Buttons for full screen, title change
 12/21/12 A few things arose today... I'm trying to get the modal view controller to load up properly from a button tap on the drawer view. The button tap is not registering becuase of the existing tap gesture on the drawer view. I temporarily got rid of the tap gesture and the button press is registering. The custom modal view class I created isn't working right now. I'm using a xib file to place the various elements in the view controller. When running on an iPad 1.0 I'm getting an error on the NSConstraint objects in the xib. When running on the ios simulator, I'm getting the following: "loaded the "ProvinceModalViewController" nib but the view outlet was not set." The outlet is placed in the xib file, so I don't know exactly whats going on. 
 
 12/26/12 Still can't figure out what went wrong with the previous modal view controller implementation. I recreated the modal view controller class with a xib from the get go and its presenting itself fine. When I'm populating the view, every object I add has constraints, which are getting thrown off when the view is presented modally. I bet if I switch the presentation to full screen mode the constraints will be satisfied. 
 
    Continued progress. I restricted the objects in the view to the appropriate constraints. The modal view looks appropriate regardless of the presentation style. The information is getting to the modal view appropriately. I need to tweak the scroll view and begin to think about how it might be related to the description text. 
 
 12/27/12 Progress made, got scroll view populated within the modal view controller. Need to figure out why close button is not working. 
 
 1/2/13 Began working on TitleImageView. 
 
 1/9/13
    I'm going to start working on the modal view controller again. At the night's conclusion I got a few things done... The modal view is being presented properly, but needs to be reconstrained. I animated the province buttons onto and off of the screen. I need to figure out a way to change the alpha on the modal view's background without dropping the alpha on the text. 
 1/21/13
    Still finishing up programming the modal view controller. I implemented a class called ModalPageController for each page of the modal view. I need to make minor adjustments to properly place the elements in this view controller.
 
 1/28/13
    Got the popup view programmed. Began working on the "label" view. Need to consider where to place the view itself, and when to make the view disappear. 
 2/16/13
    Work Commenced in Physical Computing Lab. Worked on label. Disappears when the user commences a scroll after touching an icon. This will have to work for now. 
 
 2/22/13
    Worked on Restructuring In lieu of the new label. Reorganized how content view controller handles icon pressed on the map. Finished by wireframing the process flow of map icon pressed. Check baseViewController's provincePressed and ContentViewController's getInfoForProvince methods for what to do next.
 
 3/2/13 
    Unsuccessfully tried to link the button press to the storage of the provinces. What went wrong... The button wouldn't take a delegate. 
 
 3.6.12
    Got the button to use the delegate to register events
    Began work on infoModalViewController, implementing the population of information for a province.
 3.11.13
    Having difficulty getting the Modal Page View Controller's info screen to show up. Its not getting events passed through to it. However... the default implementation is getting an event passed to it. Until I removed the instance of it in the super class InfoModalViewController, which was retaining the reference. Now its still registering a touch event, but throwing an I have no idea what method you speak of error. 
 
    Finished redressing the app. Its looking sexy. I need to go back into the scroll view and make adjustments. Need to add the close button and expand the width. 
 
    Tabish had a cool idea about allowing Robert to annotate the map. I thought this sounded awesome. It'd also be cool to have users upload photos from these locations. We could do a send a message feature where a user can choose a port or province and export their well wishes to another user in that port or province, in exchange for a reply. IT'd also be cool to populate the map with live data about cargo ships currently in transit around China (as if that info was free). 
 
    we could do a random exchange of kindness to the more impoverished areas of china, and prompt users to donate to a charity. or even just have a marketplace in the app to purchase chinese shit. 
 
 3.12.13
    Made progress. Populated the map with some provinces. Began putting content for the Yellow River into the app. At the last second the app broke. The scroll view is off now. I need to consider how the content is being shown in the boxes. Right now, its pretty crude, and not working. Also, I want more feedback when the user presses the province icon. Maybe have an overlay flash on the side of the screen. 
 
 4.1.13
    Progress Made: Popup adjusted except for page control...
 
 4.7.13
    IIIII... tried to readjust label view to no avail. Found a good project that successfully does this. 
    Steps to adjust label view: 
        Set size of labelView on update
        Set offset of labelView on update
        adjust to side of screen if necessary...
 
 4.8.13
    I'm going to try using UIView's convertPoint function to transfer the province views position on the map to the superview containing the overlay. 
 
 4.16.13
    Label Implementation is overdue... 
        Need to: create info button
            -fit all content into label
            -
    Magnifying glass effect... too much drifting right now. no effect being created. 
        I can either still attmept the effect or tell foster he needs to try to bull shit the design. 
    Looking forward... Templates need to be mocked up by this weekend.
        -lay out the pages in XCode
        -Getting scrolling to work between pages.
        -Figure out text resizing
        -potentially get paralaxxing to work?
 
    Implementation of Modal View
        -Attempting to set stroke on title text
        -need to grab the graphics context and set the stroke width before drawing the text. 
        -need to do this in drawRect in a UIView... need to subclass uiview
 
 4.17.13
    Progress Made... both views are mocked up to a decent fidelity in XCode. 
    -To finish modal views... get stroke happening on text... 
    -Add magnifying glass to image
    -figure out how to place images (custom images all with consistent size?)
    -Add Parallaxing? Two Separate Scroll Views one for images one for text?
 
 4.18.13
    Epic Day: Magnifying Glass is on the view and zooming in appropriately.
    -NEED TO: 
        -Get page control working and update the magnifying glasses view to magnify
        -Get text adjusted (awkward fix) and color working
        -Add Parallaxing
 4.19.13
    Progress Made: Switched the ModalTextView to subclass UIView instead of UITextView
        Began work on using the magnifying glass image in ACMagGlass. 
 
 4.22.12
    Behind, slightly. To finish for modal view... 
        -Pagination 
            -add button indicator, update magnifying glass's image to zoom into. 
        -add close button
    Finished both of these tasks... Additional updates to the modal view can be made. 
        -Add parallaxing on scrolls. 
        -fade in and out the magnifying glass
        -update the magnifying glass image on scroll
        -make the magnifying glass image the designed image
        -add a zoom Viewer for the magnifying glass (possibly a button to turn it on and off?)
        -add a popover view for the images
        -add animation onto and off of the screen
    So... I think the popover view is finished for now. The magnifying glass effect is kinda worthless. I want to make the image present a new popover of a big image that the user can use the magnifying glass over. Right now thats just not happening. BREAK>! 
 
 4.24.13
    Implementation continues... I prototyped the timeline view successfully, but got stuck when I switched to making it access the content from the storage view. Now nothing is showing up on the timeline! 
 
 4.30.13
    Need to get the touches working on the timeline... this will carry over into the modal view
 
 5.1.13
    Worked for a bit this morning... Began reworking image on popover screen. Working on getting it to present a new view on a touch event. 
 
 5.3.13
    Wyatts feedback... make image alpha animation relative to content offset of scrollview
    Get image info text working on transition first, than work on image... Scrollview hiccup occuring
    Storage is jacked up... Use plist with image location references
    Cut out isn't working on timeline. No indication that this location is significant. 
    Adjust scrollview offset to account for ui blocking bottom of map
    Look into changing the resampling mode of the map. 
    Put province,port information onto zoomed out map.
 
 5.6.13
    Progress being made... trying to figure out the scrolling issue on the timeline and modal view. Unresponsive when immediately trying to scroll backwards. Either get rid of automatic scrolling or figure it out. 
 
 5.18.13.
    Progressss.... timeline is finished more or less. The main view is so close to being done (not including the modal views). The routes crash the app when loaded onto the scroll view.
 
 5.20
    Attempt to load routes onto app continues to craash the app. Redesigned outes function to bring up markers that will load smaller portions of the routes, which the app can manage. 
 */

#import <UIKit/UIKit.h>
#import "BaseViewController.h"
#import "DrawerViewController.h"
#import "ContentViewController.h"
#import "SlidingViewController.h"
#import "TimeViewController.h"
#import "ModalTextView.h"
@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
//@property (strong, nonatomic) TimeViewController *timelineVC;

//-(void)switchToTimeline;
//-(void)switchToMapMode;
@end
