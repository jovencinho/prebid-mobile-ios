//
//  IntegrationKindUtilites.m
//  PrebidDemoObjectiveC
//
//  Created by Yuriy Velichko on 15.11.2021.
//  Copyright © 2021 Prebid. All rights reserved.
//

#import "IntegrationKindUtilites.h"
#import "IntegrationKind.h"


@implementation IntegrationKindUtilites

+ (NSArray *)IntegrationKindAllCases {
    return @[
        [NSNumber numberWithInteger:IntegrationKind_OriginalGAM],
        [NSNumber numberWithInteger:IntegrationKind_InApp],
        [NSNumber numberWithInteger:IntegrationKind_RenderingGAM],
        [NSNumber numberWithInteger:IntegrationKind_RenderingAdMob],
        [NSNumber numberWithInteger:IntegrationKind_RenderingMAX]
    ];
}

+ (NSDictionary *)IntegrationKindDescr {
    return @{
        [NSNumber numberWithInteger:IntegrationKind_OriginalGAM]        : @"Original GAM",
        [NSNumber numberWithInteger:IntegrationKind_InApp]              : @"In-App",
        [NSNumber numberWithInteger:IntegrationKind_RenderingGAM]       : @"Rendering GAM",
        [NSNumber numberWithInteger:IntegrationKind_RenderingAdMob]     : @"Rendering AdMob",
        [NSNumber numberWithInteger:IntegrationKind_RenderingMAX]       : @"Rendering MAX"
    };
}

+ (NSArray *)IntegrationAdFormatAllCases {
    return @[
        [NSNumber numberWithInteger:IntegrationAdFormat_Banner],
        [NSNumber numberWithInteger:IntegrationAdFormat_BannerVideo],
        [NSNumber numberWithInteger:IntegrationAdFormat_Interstitial],
        [NSNumber numberWithInteger:IntegrationAdFormat_InterstitialVideo],
        [NSNumber numberWithInteger:IntegrationAdFormat_InterstitialVideoVertical],
        [NSNumber numberWithInteger:IntegrationAdFormat_InterstitialVideoLandscape],
        [NSNumber numberWithInteger:IntegrationAdFormat_Rewarded],
        [NSNumber numberWithInteger:IntegrationAdFormat_NativeInApp]
    ];
}

+ (NSDictionary *)IntegrationAdFormatDescr {
    return @{
        [NSNumber numberWithInteger:IntegrationAdFormat_Banner]             : @"Banner",
        [NSNumber numberWithInteger:IntegrationAdFormat_BannerVideo]        : @"Banner Video",
        [NSNumber numberWithInteger:IntegrationAdFormat_Interstitial]       : @"Interstitial",
        [NSNumber numberWithInteger:IntegrationAdFormat_InterstitialVideo]  : @"Interstitial Video",
        [NSNumber numberWithInteger:IntegrationAdFormat_InterstitialVideoVertical]: @"Video Interstitial Vertical",
        [NSNumber numberWithInteger:IntegrationAdFormat_InterstitialVideoLandscape]: @"Video Interstitial Landscape",
        [NSNumber numberWithInteger:IntegrationAdFormat_Rewarded]           : @"Rewarded",
        [NSNumber numberWithInteger:IntegrationAdFormat_NativeInApp]        : @"Native In-App"
    };
}

+ (NSArray *)IntegrationAdFormatFor:(IntegrationKind) integrationKind {
    if ([IntegrationKindUtilites isRenderingInApp:integrationKind]) {
        return [IntegrationKindUtilites IntegrationAdFormatRenderingInApp];
    } else {
        return [IntegrationKindUtilites isRenderingIntegrationKind:integrationKind] ?
        [IntegrationKindUtilites IntegrationAdFormatRendering] :
        [IntegrationKindUtilites IntegrationAdFormatOriginal];
    }
}

+ (NSArray *)IntegrationAdFormatOriginal {
    return @[
        [NSNumber numberWithInteger:IntegrationAdFormat_Banner],
        [NSNumber numberWithInteger:IntegrationAdFormat_Interstitial],
        [NSNumber numberWithInteger:IntegrationAdFormat_NativeInApp]
    ];
}
+ (NSArray *)IntegrationAdFormatRendering {
    return @[
        [NSNumber numberWithInteger:IntegrationAdFormat_Banner],
        [NSNumber numberWithInteger:IntegrationAdFormat_BannerVideo],
        [NSNumber numberWithInteger:IntegrationAdFormat_Interstitial],
        [NSNumber numberWithInteger:IntegrationAdFormat_InterstitialVideo],
        [NSNumber numberWithInteger:IntegrationAdFormat_Rewarded],
    ];
}

+ (NSArray *)IntegrationAdFormatRenderingInApp {
    return @[
        [NSNumber numberWithInteger:IntegrationAdFormat_Banner],
        [NSNumber numberWithInteger:IntegrationAdFormat_BannerVideo],
        [NSNumber numberWithInteger:IntegrationAdFormat_Interstitial],
        [NSNumber numberWithInteger:IntegrationAdFormat_InterstitialVideo],
        [NSNumber numberWithInteger:IntegrationAdFormat_InterstitialVideoVertical],
        [NSNumber numberWithInteger:IntegrationAdFormat_InterstitialVideoLandscape],
        [NSNumber numberWithInteger:IntegrationAdFormat_Rewarded],
    ];
}

+ (BOOL)isRenderingIntegrationKind:(IntegrationKind) integrationKind {
    return
        integrationKind == IntegrationKind_InApp ||
        integrationKind == IntegrationKind_RenderingGAM ||
        integrationKind == IntegrationKind_RenderingAdMob ||
        integrationKind == IntegrationKind_RenderingMAX;
}

+ (BOOL)isRenderingInApp:(IntegrationKind) integrationKind {
    return integrationKind == IntegrationKind_InApp;
}

@end
