#import "AppDelegate.h"


@implementation AppDelegate

@synthesize window = window_;
@synthesize viewController = viewController_;
@synthesize upnpServer = upnpServer_;


#pragma mark -
#pragma mark AppDelegate

- (void)dealloc
{
    [upnpServer_ release];
    [window_ release];
    
    [super dealloc];
}


#pragma mark -
#pragma mark UIApplicationDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    // Do not sleep
    [UIApplication sharedApplication].idleTimerDisabled = YES;
    
    // Load the view
    [self.window addSubview:self.viewController.view];
    [self.window makeKeyAndVisible];
    
    // Start the UPnP server
    UpnpServer *upnpServer = [[UpnpServer alloc] init];
    self.upnpServer = upnpServer;
    [upnpServer release];
    
    [self.upnpServer start];

    return YES;
}


- (void)applicationWillResignActive:(UIApplication *)application
{
    /*
     Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
     Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
     */
}


- (void)applicationDidBecomeActive:(UIApplication *)application
{
    /*
     Restart any tasks that were paused (or not yet started) while the application was inactive.
     */
}


- (void)applicationWillTerminate:(UIApplication *)application
{
    /*
     Called when the application is about to terminate.
     */
}

- (void)applicationDidReceiveMemoryWarning:(UIApplication *)application
{
    /*
     Free up as much memory as possible by purging cached data objects that can be recreated (or reloaded from disk) later.
     */
}


@end
