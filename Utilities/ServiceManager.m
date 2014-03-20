//
//  ServiceManager.m
//  CountryGrocer
//
//  Created by Jacky Nguyen on 5/13/13.
//  Copyright (c) 2013 teamios. All rights reserved.
//

#import "ServiceManager.h"
#import "ASIHTTPRequest.h"
#import "ASIFormDataRequest.h"
#import "define.h"
#import "NSObject+SBJSON.h"
#import "NSString+SBJSON.h"
#import <AdSupport/AdSupport.h>

@implementation ServiceManager

+ (BOOL)sendPushNotification:(NSString *)message
{
    
    ASIFormDataRequest * request;
    NSURL *url = [NSURL URLWithString:kServer_Post_sendPush];
    request = [ASIFormDataRequest requestWithURL:url];
    [request setRequestMethod:@"POST"];
    [request setPostValue:message forKey:@"message"];
    [request startSynchronous];
    
    if ([request responseStatusCode] == 200) {
        NSLog(@"%@",request.responseString);
        NSDictionary *userdict = [request.responseString JSONValue];
        if ([userdict isKindOfClass:[NSDictionary class]]) {
            if ([[userdict objectForKey:@"success"] isEqualToString:@"success"])
                {
                    
                    return YES;
                }
                else
                {
                    [Util showAlertWithString:[userdict objectForKey:@"message"]];
                }
            }
        
    }
    return NO;
}

+ (BOOL)sendToken
{
    
    ASIFormDataRequest * request;
    
    NSURL *url = [NSURL URLWithString:kServer_Post_sendToken];
    
    request = [ASIFormDataRequest requestWithURL:url];
    [request setRequestMethod:@"POST"];
    if ([[NSUserDefaults standardUserDefaults] objectForKey:kDeviceToken]) {
        [request setPostValue:[[NSUserDefaults standardUserDefaults] objectForKey:kDeviceToken] forKey:@"device_token"];
    }
    else
    {
        return NO;
    }
    [request startSynchronous];
    
    if ([request responseStatusCode] == 200) {
        NSLog(@"%@",request.responseString);
        NSDictionary *userdict = [request.responseString JSONValue];
        if ([userdict isKindOfClass:[NSDictionary class]]) {
            if ([[userdict objectForKey:@"success"] isEqualToString:@"success"])
            {
                
                return YES;
            }
            else
            {
                return NO;
                [Util showAlertWithString:[userdict objectForKey:@"message"]];
            }
        }
        
    }
    return NO;
}

+ (BOOL)getMessage
{
    
    ASIFormDataRequest * request;
    
    NSURL *url = [NSURL URLWithString:kServer_Get_Message];
    
    request = [ASIFormDataRequest requestWithURL:url];
    [request setRequestMethod:@"GET"];
    [request startSynchronous];
    
    if ([request responseStatusCode] == 200) {
        NSLog(@"%@",request.responseString);
        NSDictionary *userdict = [request.responseString JSONValue];
        if ([userdict isKindOfClass:[NSDictionary class]]) {
            NSArray *array = [userdict objectForKey:@"messages"];
            if ([array count] > 0)
            {
                [[NSUserDefaults standardUserDefaults] setObject:array forKey:@"Messages"];
                
            }
            else
            {
                [[NSUserDefaults standardUserDefaults] removeObjectForKey:@"Messages"];
            }
            
            [[NSUserDefaults standardUserDefaults] synchronize];
                return YES;
            

        }
        
    }
    return NO;
}





@end
