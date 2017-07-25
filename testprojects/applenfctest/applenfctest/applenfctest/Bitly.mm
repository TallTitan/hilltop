//
//  Bitly.cpp
//  applenfctest
//
//  Created by seaschi on 7/24/17.
//  Copyright © 2017 seaschi. All rights reserved.
//

#include "Bitly.h"

#import <Foundation/Foundation.h>

CFStringRef kClientID = CFSTR("8a3a2b05124a64f402f2aabfb29eb9523d02cb6b");
CFStringRef kClientSecret = CFSTR("6f6abfd5ebee5944ddb1345bcf1154c12f6a7d55");
CFStringRef kGenericAccessToken = CFSTR("6441e6e12c33775e2c8d52b91b1cba688af75ff4");
CFStringRef kDomain = CFSTR("http://applenfctest.seanschiff.microsoft.com/");
CFStringRef kSampleURL = CFSTR("http://www.kotaku.com");

void TestBitly()
{
    NSString* bitlyRequest = [NSString stringWithFormat:@"https://api-ssl.bitly.com/v3/shorten?access_token=%@&longUrl=%@",kGenericAccessToken, kSampleURL];
    NSString* bitlyResponse = [NSString stringWithContentsOfURL:[NSURL URLWithString:bitlyRequest] encoding:NSUTF8StringEncoding error:nil];
    
    NSData* data = [bitlyResponse dataUsingEncoding:NSUTF8StringEncoding];
    NSDictionary* bitlyDictionary = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
    
    NSString* bitlyUrl = bitlyDictionary[@"data"][@"url"];
    
    NSLog( @"%@", bitlyUrl );
}
