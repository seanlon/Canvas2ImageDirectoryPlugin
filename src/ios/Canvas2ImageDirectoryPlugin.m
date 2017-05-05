//
//  Canvas2ImageDirectoryPlugin.m
//  Canvas2ImageDirectoryPlugin PhoneGap/Cordova plugin
//
//  Created by Tommy-Carlos Williams on 29/03/12.
//  Copyright (c) 2012 Tommy-Carlos Williams. All rights reserved.
//	MIT Licensed
//

#import "Canvas2ImageDirectoryPlugin.h"
#import <Cordova/CDV.h>

@implementation Canvas2ImageDirectoryPlugin
@synthesize callbackId;

//-(CDVPlugin*) initWithWebView:(UIWebView*)theWebView
//{
//    self = (Canvas2ImageDirectoryPlugin*)[super initWithWebView:theWebView];
//    return self;
//}



 

- (void)saveImageDataToLibrary:(CDVInvokedUrlCommand*)command
{ 

      self.callbackId = command.callbackId;
	  NSData* imageData = [NSData dataFromBase64String:[command.arguments objectAtIndex:0]]; 
	  UIImage* image = [[[UIImage alloc] initWithData:imageData] autorelease];	

      //default album name
	  UIImageWriteToSavedPhotosAlbum(image, self, @selector(image:didFinishSavingWithError:contextInfo:), nil);
	    

      //with option for custom album name
      
    // NSString* foldername =command.arguments objectAtIndex:1;
    // NSString* filename = command.arguments objectAtIndex:2;
    // ALAssetsLibrary *library = [[ALAssetsLibrary alloc] init];
    // [library saveImage:image toAlbum:@"tbank-album" withCompletionBlock:^(NSError *error) {
    //     if (error!=nil)
    //     {
    //         NSLog(@"Error: %@", [error description]);
    //     }
    // }];

}

- (void)image:(UIImage *)image didFinishSavingWithError:(NSError *)error contextInfo:(void *)contextInfo
{
    // Was there an error?
    if (error != NULL)
    {
        // Show error message...
        NSLog(@"ERROR: %@",error);
		CDVPluginResult* result = [CDVPluginResult resultWithStatus: CDVCommandStatus_ERROR messageAsString:error.description];
		[self.webView stringByEvaluatingJavaScriptFromString:[result toErrorCallbackString: self.callbackId]];
    }
    else  // No errors
    {
        // Show message image successfully saved
       NSLog(@"IMAGE SAVED!"); 
		CDVPluginResult* result = [CDVPluginResult resultWithStatus: CDVCommandStatus_OK messageAsString:@"Image saved"];
		[self.webView stringByEvaluatingJavaScriptFromString:[result toSuccessCallbackString: self.callbackId]];
    }
}

- (void)dealloc
{	
	[callbackId release];
    [super dealloc];
}


@end
