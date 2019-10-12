//
//  AddtoViewController.h
//  学生管理系统
//
//  Created by 陈培旺 on 2019/8/16.
//  Copyright © 2019 ABC. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol addtoViewControllerDelegate <NSObject>

- (void)addtoStudent:(NSMutableArray *_Nullable)addtoArray;

@end

NS_ASSUME_NONNULL_BEGIN

@interface AddtoViewController : UIViewController
@property (nonatomic, weak) id<addtoViewControllerDelegate> delegate;
@property NSMutableArray *array;

@end

NS_ASSUME_NONNULL_END
