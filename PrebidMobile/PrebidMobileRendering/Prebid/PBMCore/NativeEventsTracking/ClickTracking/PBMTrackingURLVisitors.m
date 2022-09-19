/*   Copyright 2018-2021 Prebid.org, Inc.

 Licensed under the Apache License, Version 2.0 (the "License");
 you may not use this file except in compliance with the License.
 You may obtain a copy of the License at

 http://www.apache.org/licenses/LICENSE-2.0

 Unless required by applicable law or agreed to in writing, software
 distributed under the License is distributed on an "AS IS" BASIS,
 WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 See the License for the specific language governing permissions and
 limitations under the License.
 */

#import "PBMTrackingURLVisitors.h"

#import "PrebidMobileSwiftHeaders.h"
#if __has_include("PrebidMobile-Swift.h")
#import "PrebidMobile-Swift.h"
#else
#import <PrebidMobile/PrebidMobile-Swift.h>
#endif

@implementation PBMTrackingURLVisitors

+ (PBMTrackingURLVisitorBlock)connectionAsTrackingURLVisitor:(id<ServerConnectionProtocol>)connection {
    return ^(NSArray<NSString *> *trackingUrlStrings) {
        for(NSString *trackingUrlString in trackingUrlStrings) {
            // TODO: Use 'fireAndForget' ?
            // TODO: Use non-zero timeout ?
            [connection get:trackingUrlString timeout:0 callback:^(ServerResponse *response){}];
        }
    };
}

@end
