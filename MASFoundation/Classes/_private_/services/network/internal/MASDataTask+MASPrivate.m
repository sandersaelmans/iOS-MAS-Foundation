//
//  MASDataTask+MASPrivate.m
//  MASFoundation
//
//  Copyright © 2019 CA Technologies. All rights reserved.
//
//  This software may be modified and distributed under the terms
//  of the MIT license. See the LICENSE file for details.
//

#import "MASDataTask+MASPrivate.h"

@interface MASDataTask()
{
    
}

@property(readwrite)NSString* taskID;
@property(nonatomic,readwrite)MASSessionDataTaskOperation* operation;

@end

@implementation MASDataTask (MASPrivate)


- (instancetype)initWithTask:(MASSessionDataTaskOperation*)operation
{
    if(self = [super init]){
        self.operation = operation;
        self.taskID = operation.taskID;
    }
    
    return self;
}

- (BOOL)isFinished
{
    return [self.operation isFinished];
}


-(BOOL)isCancelled
{
    return [self.operation isCancelled];
}

- (BOOL)cancelTask
{
    if(self.operation && (![self.operation isFinished] && ![self.operation isCancelled])){
        DLog(@"Cancelling task with ID %@",self.taskID);
        [self.operation cancel];
        return YES;
    }
    
    DLog(@"Unable to cancel task. The operation is either finished or cancelled earlier");
    return NO;
}




@end
