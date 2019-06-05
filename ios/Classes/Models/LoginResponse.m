//
//  LoginResponse.m
//  flutter_mob_share
//
//  Created by Mark on 2019/6/5.
//

#import "LoginResponse.h"
#import <MJExtension.h>
@implementation LoginResponse
+(LoginResponse *)installFromSSDKUser:(SSDKUser *)userinf state:(SSDKResponseState)state{
    
    LoginResponse *response = LoginResponse.new;
    [response mj_setKeyValues:userinf.mj_JSONObject];
    response.state = state;
    return response;
}
@end
