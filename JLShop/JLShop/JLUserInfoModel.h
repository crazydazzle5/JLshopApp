//
//  JLUserInfoModel.h
//  JLShop
//
//  Created by imao on 16/5/22.
//
//

#import <Foundation/Foundation.h>

@interface JLUserInfoModel : NSObject

@property (nonatomic,assign) long long  userId;

@property (nonatomic,strong) NSString *loginName;

@property (nonatomic,strong) NSString *password;

@property (nonatomic,strong) NSString *name;

@property (nonatomic,strong) NSString *phone;

@property (nonatomic,strong) NSString *recommendCode;

@property (nonatomic,strong) NSString *recommendCodePic;

@property (nonatomic,assign) long long rank;

@property (nonatomic,assign) long long score;

@property (nonatomic,assign) NSInteger status;

@property (nonatomic,strong) NSString *createDate;

@property (nonatomic,strong) NSString *jdPayToken;

@property (nonatomic,assign) NSInteger age;

@property (nonatomic,assign) NSInteger sex;

@property (nonatomic,strong) NSString *birthday;

@property (nonatomic,assign) NSInteger lockScore;

@property (nonatomic,assign) NSInteger loginflag;

@property (nonatomic,strong) NSString *headPic;




@end
