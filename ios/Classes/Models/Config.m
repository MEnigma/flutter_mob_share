//
//  Config.m
//  flutter_mob_share
//
//  Created by Mark on 2019/6/5.
//

#import "Config.h"


@implementation ConfigModel


@end

@implementation ConfigResult
+(ConfigResult *)normalFail{
    ConfigResult *res = [ConfigResult new];
    res.succeed = false;
    return res;
}
+(ConfigResult *)normalSucceed{
    
    ConfigResult *res = [ConfigResult new];
    res.succeed = true;
    return res;
    
}
+(ConfigResult *)methodCallOnNull{
    ConfigResult *res = [ConfigResult new];
    res.succeed = false;
    res.message = @"method call on null";
    return res;
}
@end
