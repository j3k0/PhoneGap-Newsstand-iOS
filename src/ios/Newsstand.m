#import <NewsstandKit/NewsstandKit.h>
#import "Newsstand.h"

@implementation Newsstand

- (void)setup: (CDVInvokedUrlCommand*)command
{
    CDVPluginResult *pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsString:@"OK"];
    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
}

- (void)setIcon: (CDVInvokedUrlCommand*)command
{
    NSDictionary *options = [command.arguments objectAtIndex:0];
    NSString *url = [options objectForKey:@"url"];
    int badge = [[options objectForKey:@"badge"] intValue];

    NSURL *imageURL = [NSURL URLWithString:url];
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_BACKGROUND, 0), ^{
        NSData *imageData = [NSData dataWithContentsOfURL:imageURL];
        dispatch_async(dispatch_get_main_queue(), ^{
            if (imageData) {
                // Update the newsstand icon
                UIImage *img = [UIImage imageWithData:imageData];
                if (img) {
                    [[UIApplication sharedApplication] setNewsstandIconImage:img];
                    [[UIApplication sharedApplication] setApplicationIconBadgeNumber:badge];

                    CDVPluginResult *pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsString:@"OK"];
                    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
                }
                else {
                    CDVPluginResult *commandResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:@"ERR"];
                    [self.commandDelegate sendPluginResult:commandResult callbackId:command.callbackId];
                }
            }
            else {
                CDVPluginResult *commandResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:@"ERR"];
                [self.commandDelegate sendPluginResult:commandResult callbackId:command.callbackId];
            }
        });
    });
}

@end
