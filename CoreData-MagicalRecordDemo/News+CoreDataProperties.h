//
//  News+CoreDataProperties.h
//  CoreData-MagicalRecordDemo
//
//  Created by Robin_Long on 15/12/3.
//  Copyright © 2015年 岳小龙. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "News.h"

NS_ASSUME_NONNULL_BEGIN

@interface News (CoreDataProperties)

@property (nullable, nonatomic, retain) NSString *name;

@end

NS_ASSUME_NONNULL_END
