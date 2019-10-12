//
//  StudentNSObject.h
//  学生管理系统
//
//  Created by 陈培旺 on 2019/8/17.
//  Copyright © 2019 ABC. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface StudentNSObject : NSObject

@property (nonatomic, copy) NSString *studentName;
@property (nonatomic, copy) NSString *studentAge;
@property (nonatomic, copy) NSString *studentClass;
@property (nonatomic, copy) NSString *studentNumber;
@property (nonatomic, copy) NSString *studentGrade;

@end

NS_ASSUME_NONNULL_END
