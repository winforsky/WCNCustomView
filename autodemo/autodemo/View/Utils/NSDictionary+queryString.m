//
//  NSDictionary+queryString.m
//  md5demo
//
//  Created by wcn on 15/3/19.
//  Copyright (c) 2015年 w.cn. All rights reserved.
//

#import "NSDictionary+queryString.h"

@implementation NSDictionary (queryString)

- (NSString*)getQueryString
{
    NSArray *sortKeys=[self.allKeys sortedArrayUsingComparator:^NSComparisonResult(id first, id second) {
        NSString *obj1=first;
        NSString *obj2=second;
        return  [obj1 compare:obj2];
    }];
    
    NSMutableString *tmpStr=[[NSMutableString alloc]init];
    int i=0;
    for (NSString *key in sortKeys) {
        if (i==0) {
            [tmpStr appendString:[NSString stringWithFormat:@"%@=%@",key,self[key]]];
        }else{
            [tmpStr appendString:[NSString stringWithFormat:@"&%@=%@",key,self[key]]];
        }
        i++;
    }
    return tmpStr;
}

@end
