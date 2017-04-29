//
//  Canvas2ImageDirectoryPlugin.h
//  Canvas2ImageDirectoryPlugin PhoneGap/Cordova plugin
//
//  Created by Tommy-Carlos Williams on 29/03/12.
//  Copyright (c) 2012 Tommy-Carlos Williams. All rights reserved.
//	MIT Licensed
//


#import <Cordova/CDVPlugin.h>

@interface Canvas2ImageDirectoryPlugin : CDVPlugin
{
	NSString* callbackId;
}

@property (nonatomic, copy) NSString* callbackId;

- (void)saveImageDataToLibrary:(CDVInvokedUrlCommand*)command;

@end
